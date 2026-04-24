# =========================================================
# Exercise 8 - Adding Percentages
# Dataset: mpg
#
# Goal:
# Add relative information (percentages).
#
# Visual idea:
# - Table showing count of cars by class
# - Additional column with percentage share
#
# Tasks:
# 1. Count number of cars per class.
# 2. Compute percentage of total.
# 3. Create a gt table.
# 4. Format percentage column properly.
# 5. Add title and improve readability (labels, alignment).
# =========================================================

library(tidyverse)
library(gt)
library(gtExtras)

view(mpg)

mpg %>%
  group_by(class) %>%
  summarise(
    count = n(),
    percentage = n() / nrow(mpg) * 100,
    .groups = "drop"
  ) %>%
  arrange(-count) %>%
  gt() %>%
  tab_header(
    title = "Cars by Class",
    subtitle = "Class Percentage"
  ) %>%
  fmt_number(columns = percentage,
              decimals = 0) %>%
  cols_label(class="Class",
             count="Amount",
             percentage="%") %>%
  cols_align(
    align = "center",
    columns = everything()
  ) %>%
  gt_theme_guardian()
  
# fmt_percent(
#   columns = percentage,
#   decimals = 1
# )