# ?keras::install_keras()
# install_keras(Tensorflow = "1.13.1",
# restart_session = FALSE)
library(keras)
library(tensorflow)
library(tidymodels)

#load data
load("vessels.Rda")

# Creating a vessels df and filtering for the geartype of choice
vessels_df <- vessels %>%
filter(vessel_class_gfw %in% c("set_longlines", "set_gillnets", "tuna_purse_seines","fishing",
                               "other_purse_seines","	drifting_longlines"))%>%
mutate(flag = factor(flag_gfw),
       vessel_class_gfw = factor(vessel_class_gfw))

# Creating a subset of the vessel_df
vessels_sub <- sample_n(vessels_df,10000) %>%
imputeTS::na.replace(0)

#train & test models
set.seed(3435)
# Split the dataset into train and test
vessels_split <- initial_split(vessels_sub, prop = 0.8, strata = vessel_class_gfw)
vessels_train <- training(vessels_split)
vessels_test <- testing(vessels_split)

#folds
set.seed(3435)
vessels_folds <- vfold_cv(data = vessels_train, v = 3, strata = vessel_class_gfw)

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



nnet_spec <-
  mlp() %>%
  set_mode("classification") %>%
  set_engine("keras", verbose = 0)

nnet_wflow <-
  workflow() %>%
  add_recipe(vessels_recipe) %>%
  add_model(nnet_spec)

nnet_res <-
  nnet_wflow %>%
  fit_resamples(
    resamples = vessels_folds,
    metrics = metric_set(
      recall, precision, f_meas,
      accuracy, kap,
      roc_auc, sens, spec),
    control = control_resamples(save_pred = TRUE)
  )
nn_results <- saveRDS(nnet_res,file = "data/nnet_res.rds")
# knn_results <- readRDS("boost_results.rds")
