# =========================================================
# Exercise 2 - Clean Summary Table with Formatting
# Dataset: mtcars
#
# Goal:
# Create a readable summary table.
#
# Tasks:
# 1. Convert cyl to a factor.
# 2. Group the dataset by cyl.
# 3. Compute mean mpg and mean hp.
# 4. Round values for better readability.
# 5. Create a gt table with a title.
# =========================================================

library(tidyverse)
library(gt)
library(gtExtras)

view(mtcars)

mtcars %>%
  mutate(cyl = factor(cyl)) %>%
  group_by(cyl) %>%
  summarise(
    avg_mpg = mean(mpg),
    avg_hp = mean(hp),
    .groups = "drop"
  ) %>%
  gt() %>%
  tab_header(
    title = "Cars by Number of Cylinders",
    subtitle = "Average Miles per Gallon (MPG) and Horsepower (HP)"
  ) %>%
  fmt_number(columns = c(avg_mpg, avg_hp),
             decimals = 2) %>%
  cols_label(cyl = "Cylinders",
             avg_mpg= "Avg. MPG",
             avg_hp= "Avg. HP") %>% 
  cols_align(
    align = "center",
    columns = everything()
  ) %>%
  gt_theme_guardian()
