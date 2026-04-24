# =========================================================
# Exercise 4 - Adding Visual Bars Inside a Table
# Dataset: mtcars
#
# Goal:
# Enhance a table using visual bar indicators.
#
# Tasks:
# 1. Create a dataset with car names, mpg, and hp.
# 2. Convert row names into a column.
# 3. Select only relevant columns.
# 4. Create a gt table.
# 5. Add bar-style visualization for mpg and hp columns.
# =========================================================

library(tidyverse)
library(gt)
library(gtExtras)
library(DT)

view(mtcars)

dataset <- mtcars %>%
  rownames_to_column(var="Model") %>%
  select(Model, mpg, hp)

view(dataset)

dataset %>%
  select(1:3) %>%
  datatable(
    rownames = FALSE
  ) %>%
  formatStyle(
    "mpg",
    background = styleColorBar(range(dataset$mpg), "lightblue"),
    backgroundSize = "100% 90%",
    backgroundRepeat = "no-repeat"
  ) %>%
  formatStyle(
    "hp",
    background = styleColorBar(range(dataset$hp), "lightgreen"),
    backgroundSize = "100% 90%",
    backgroundRepeat = "no-repeat"
  )


dataset %>%
  gt() %>%
  tab_style(
    style = cell_fill(color = "lightblue"),
    locations = cells_body(columns = mpg)
  )
