












tree_spec <- decision_tree() %>%
  set_engine("rpart")

class_tree_spec <- tree_spec %>%
  set_mode("classification")



class_tree_wf <- workflow() %>%
  add_recipe(vessels_recipe) %>%
  add_model(class_tree_spec %>% set_args(cost_complexity = tune()))

param_grid_tr <- grid_regular(cost_complexity(range = c(-3, -1)), levels = 10)



tune_res_tr <- tune_grid(
  class_tree_wf,
  resamples = vessels_folds,
  grid = param_grid_tr,
  metrics = metric_set(roc_auc)
)


autoplot(tune_res_tr)






tree_metrics <- collect_metrics(tune_res_tr) %>%
  arrange(desc((mean)))

best_complexity <- select_best(tune_res_tr )

nn_results <- saveRDS(nnet_res,file = "data/nnet_res.rds")


class_tree_final <- finalize_workflow(class_tree_wf, best_complexity)

class_tree_final_fit <- fit(class_tree_final, data = vessels_train)

class_tree_final_fit %>%
  extract_fit_engine() %>%
  rpart.plot()
