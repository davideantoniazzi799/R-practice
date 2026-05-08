# =========================================================
# Exercise 13 - Adding Data Bars Inside Table
# Dataset: mtcars
#
# Goal:
# Add visual bar indicators inside cells.
#
# Visual idea:
# - mpg column has horizontal bars
# - hp column has horizontal bars
# - Clean, dashboard-like table
#
# Tasks:
# 1. Convert row names into a column (Model).
# 2. Select Model, mpg, hp.
# 3. Create a gt table.
# 4. Add bar-style visualization inside mpg column.
# 5. Add bar-style visualization inside hp column.
# 6. Add a title and align columns properly.
# =========================================================

library(tidyverse)
library(gtExtras)
library(gt)

view(mtcars)

mtcars %>%
  rownames_to_column(var = "Model") %>%
  select(Model, mpg, hp) %>%
  gt() %>%
  data_color(
    columns = mpg,
    fn = scales::col_numeric(
      palette = c("white", "steelblue"),
      domain = NULL
    )
  ) %>%
  data_color(
    columns = hp,
    fn = scales::col_numeric(
      palette = c("white", "red"),
      domain = NULL
    )
  ) %>%
  tab_header(
    title = "Car Model Miles per Gallon and Horsepower"
  ) %>%
  cols_label(
    mpg = "MPG",
    hp = "HP"
  ) %>%
  cols_align(
    align = "center",
    columns = everything()
  ) %>%
  gt_theme_guardian()
  
  
