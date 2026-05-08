# =========================================================
# Exercise 12 - Table with Grouped Headers (Spanners)
# Dataset: iris
#
# Goal:
# Organize columns into logical groups.
#
# Visual idea:
# - Two column groups:
#   → Sepal metrics
#   → Petal metrics
#
# Tasks:
# 1. Group by Species.
# 2. Compute mean Sepal.Length, Sepal.Width,
#    Petal.Length, Petal.Width.
# 3. Create a gt table.
# 4. Use tab_spanner() to group:
#    - Sepal variables together
#    - Petal variables together
# 5. Format numbers (2 decimals).
# 6. Add a title and improve column labels.
# =========================================================

library(tidyverse)
library(gtExtras)
library(gt)

view(iris)

iris %>%
  group_by(Species) %>%
  summarise(
    count = n(),
    avg_Sepal_Length = mean(Sepal.Length),
    avg_Sepal_Width = mean(Sepal.Width),
    avg_Petal_Length = mean(Petal.Length),
    avg_Petal_Width = mean(Petal.Width),
    .groups = "drop"
  ) %>%
  select(Species, count, everything()) %>%
  gt() %>%
  tab_header(
    title = "Sepal and Petal Average Measurements by Species"
  ) %>%
  fmt_number(columns = c(avg_Sepal_Length, avg_Sepal_Width,
                         avg_Petal_Length, avg_Petal_Width),
             decimals = 2) %>%
  cols_label(count="Amount",
             avg_Sepal_Length="Length",
             avg_Sepal_Width="Width",
             avg_Petal_Length="Length",
             avg_Petal_Width="Width") %>%
  cols_align(
    align = "center",
    columns = everything()
  ) %>%
  gt_theme_guardian() %>%
  tab_spanner(
    label = "Sepal",
    columns = c(avg_Sepal_Length, avg_Sepal_Width)
  ) %>%
  tab_spanner(
    label = "Petal",
    columns = c(avg_Petal_Length, avg_Petal_Width))
