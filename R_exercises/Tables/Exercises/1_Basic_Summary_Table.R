# =========================================================
# Exercise 1 - Basic Summary Table
# Dataset: iris
#
# Goal:
# Build a simple summary table of the dataset.
#
# Tasks:
# 1. Group the iris dataset by Species.
# 2. Compute the mean of all numeric variables.
# 3. Create a gt table.
# 4. Add a title to the table.
# =========================================================

library(tidyverse)
library(gtExtras)

view(iris)

iris %>%
  group_by(Species) %>%
  summarise(
    count = n(),
    avg_Sepal_Length = mean(Sepal.Length),
    avg_Sepal_Width = mean(Sepal.Width),
    avg_Petal_Length = mean(Petal.Length),
    avg_Petal_Width = mean(Petal.Width),
    .groups = "drop") %>%
  arrange(desc(count)) %>%
  gt() %>%
  tab_header(
    title = "Species Averaged Charactheristics",
    subtitle = "Average values by Species of Sepal and Petal Width and Length"
  ) %>%
  fmt_number(columns = c(avg_Sepal_Length, avg_Sepal_Width,
                         avg_Petal_Length, avg_Petal_Width),
             decimals = 2) %>%
  cols_label(count = "Count",
             avg_Sepal_Length = "Avg. Sepal Length",
             avg_Sepal_Width = "Avg. Sepal Width",
             avg_Petal_Length = "Avg. Petal Length",
             avg_Petal_Width = "Avg. Petal Width") %>%
  cols_align(
    align = "center",
    columns = c(count, avg_Sepal_Length, avg_Sepal_Width, 
                avg_Petal_Length, avg_Petal_Width) 
  ) %>%
  gt_theme_pff()


iris %>%
  group_by(Species) %>%
  summarise(across(where(is.numeric), mean), .groups = "drop") %>%
  gt() %>%
  tab_header(
    title = "Species Average Characteristics",
    subtitle = "Mean values of iris measurements by species"
  ) %>%
  fmt_number(columns = where(is.numeric), decimals = 2)