# =========================================================
# Exercise 3 - Highlighting Key Values
# Dataset: iris
#
# Goal:
# Create a table that visually highlights important values.
#
# Tasks:
# 1. Compute mean Sepal.Length and Petal.Length per Species.
# 2. Create a gt table.
# 3. Highlight the highest values in each column.
# 4. Add a descriptive title.
# =========================================================

library(tidyverse)
library(gt)
library(gtExtras)

view(iris)

iris %>%
  group_by(Species) %>%
  summarise(
    count = n(),
    avg_Sepal_Length = mean(Sepal.Length),
    avg_Petal_Length = mean(Petal.Length),
    .groups = "drop"
  ) %>%
  gt() %>%
  tab_header(
    title = "Average Sepal and Petal Length by Species",
    subtitle = "Colored cells represents highest averaged variable value"
  ) %>%
  fmt_number(columns = c(avg_Sepal_Length, avg_Petal_Length),
             decimals = 2) %>%
  cols_label(count="Amount",
             avg_Sepal_Length="Avg. Sepal Length",
             avg_Petal_Length="Avg. Petal Length") %>%
  cols_align(
    align = "center",
    columns = everything()
  ) %>%
  gt_theme_538() %>%
  tab_style(
    style = cell_text(color = "red", weight = "bold"),
    locations = cells_body(
      columns = avg_Sepal_Length,
      rows = avg_Sepal_Length == max(avg_Sepal_Length))) %>%
  tab_style(
    style = cell_text(color = "red", weight = "bold"),
    locations = cells_body(
      columns = avg_Petal_Length,
      rows = avg_Petal_Length == max(avg_Petal_Length)))
