### Data Cleaning & wrangling
library(tidyverse) # for general data wrangling and plotting
library(purrr)
library(lubridate) # for working with dates
library(here) # for paths
library(janitor) # for cleaning var names


### ML packages
library(tidymodels)
library(glmnet) # Lasso and Elastic-Net Regularized Generalized Linear Models
library(vip)
library(randomForest)
library(ranger) #for random forest
library(xgboost)
library(readr)
library(corrr)
library(corrplot)
library(discrim)
library(klaR)
library(tune)

###Visualization
library(corrplot) # to create a correlation matrix
library(rpart.plot) # for trees to plot an rpart model
# library(fishualize) #
# library(fishmethods)
library(GGally)
library(visdat)
library(skimr)
library(kableExtra)



load("vessels.Rda")

vessels %>%
  ggplot(aes(x=reorder(vessel_class_gfw, vessel_class_gfw, function(x) length(x)))) +
  geom_bar(aes(fill=vessel_class_gfw,stat="identity"))+
  theme_bw()+
  labs(x="") +
  theme(axis.ticks.y = element_line(size =1),
        panel.grid = element_blank(), legend.key = NULL)+
  coord_flip()

