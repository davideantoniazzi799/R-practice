# =========================================================
# Exercise 9 - Multi-Metric Summary Table
# Dataset: iris
#
# Goal:
# Combine multiple summary metrics in one table.
#
# Visual idea:
# - Table by Species
# - Multiple columns: mean, min, max
#
# Tasks:
# 1. Group by Species.
# 2. Compute mean, min, and max of Sepal.Length.
# 3. Create a gt table.
# 4. Format numbers (2 decimals).
# 5. Add a title and rename columns clearly.
# =========================================================

library(tidyverse)
library(gt)
library(gtExtras)

view(iris)

iris %>%
  group_by(Species) %>%
  summarise(
    avg_Sepal_Length = mean(Sepal.Length),
    min_Sepal_Length = min(Sepal.Length),
    max_Sepal_Length = max(Sepal.Length),
    .groups = "drop"
  ) %>%
  arrange(-avg_Sepal_Length) %>%
  gt() %>%
  tab_header(
    title = "Sepal Length Metrics by Species"
  ) %>%
  fmt_number(columns = avg_Sepal_Length,
             decimals = 2) %>%
  cols_label(avg_Sepal_Length="Average",
             min_Sepal_Length="Minimum",
             max_Sepal_Length="Maximum") %>%
  cols_align(
    align = "center",
    columns = everything()
  ) %>%
  gt_theme_pff()
