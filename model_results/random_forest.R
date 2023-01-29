### Data Cleaning & wrangling
library(tidyverse) # for general data wrangling and plotting
library(purrr)
library(lubridate) # for working with dates
library(here) # for paths
library(janitor) # for cleaning var names



### ML packages
library(tidymodels)
library(vip)
library(randomForest)
library(ranger) #for random forest
library(xgboost)
library(kableExtra)
library(readr)
library(corrr)
library(corrplot)
library(tune)




load("vessels.RDS")
vessels <- readRDS("rf_tune.RDS")


# Creating a vessels df and filtering for the geartype of choice

vessels_df <- vessels %>%
  filter(vessel_class_gfw %in% c("set_longlines", "set_gillnets", "tuna_purse_seines",	"fishing",
                                 "other_purse_seines","	drifting_longlines")) %>%
  mutate(flag = factor(flag_gfw),
         vessel_class_gfw = factor(vessel_class_gfw))

# Creating a subset of the vessel_df
vessels_sub <- sample_n(vessels_df,10000) %>%
  imputeTS::na.replace(0)

set.seed(3435)

# Split the dataset into train and test

vessels_split <- initial_split(vessels_sub, prop = 0.8, strata = vessel_class_gfw)
vessels_train <- training(vessels_split)
vessels_test <- testing(vessels_split)
dim(vessels_train)




#recipe
vessels_recipe <- recipe(vessel_class_gfw ~ length_m_gfw+ mmsi+ tonnage_gt_gfw +
                           fishing_hours_2012 + fishing_hours_2015 + fishing_hours_2018 + fishing_hours_2013 +fishing_hours_2016 + fishing_hours_2019 + fishing_hours_2014 + fishing_hours_2017 + fishing_hours_2020, data = vessels_train) %>%
  step_rollimpute(all_predictors()) %>%
  step_naomit(everything(), skip = TRUE) %>%
  step_dummy(all_nominal_predictors()) %>%
  step_normalize(all_predictors()) %>%
  step_novel(all_nominal(), -all_outcomes()) %>%
  step_zv(all_numeric(), -all_outcomes()) %>%
  step_corr(all_predictors(), threshold = 0.7, method = "spearman")


#folds
set.seed(3435)
vessels_folds <- vfold_cv(data = vessels_train, v = 3, strata = vessel_class_gfw)

class_rf_model = rand_forest(mtry = tune(), trees = tune(), min_n = tune()) %>%
  set_engine("ranger", importance = "impurity") %>%
  set_mode("classification")


class_rf_wflw = workflow() %>%
  add_recipe(vessels_recipe) %>%
  add_model(class_rf_model)


library(tictoc)
tic()

rf_grid <- grid_regular(
  mtry(range = c(1, 8)), #set mtry to 1-8
  trees(range = c(100,200)), #set trees 100 to 200
  min_n(range = c(2, 10)), # set min_n between 2 and 20
  levels = 8) #what's a good level?

rf_tune <- tune_grid(
  class_rf_wflw,
  resamples = vessels_folds,
  grid = rf_grid,
  metrics = metric_set(roc_auc)
)
toc()


autoplot(rf_tune)

# saveRDS(rf_tune,file = "rf_tune.RDS")
# rf_tune_results <- readRDS("rf_tune.RDS")

rf_tree_metrics <- collect_metrics(rf_tune) %>%
  arrange(desc((mean)))
rf_tree_metrics
best_complexity_rf <- select_best(rf_tune)
best_complexity_rf
