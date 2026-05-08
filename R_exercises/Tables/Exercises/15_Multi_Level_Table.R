# =========================================================
# Exercise 15 - Multi-Level Table with Sorting and Styling
# Dataset: mpg
#
# Goal:
# Build a polished summary table.
#
# Visual idea:
# - Table grouped by manufacturer
# - Shows number of cars and average mpg
# - Sorted from best to worst mpg
#
# Tasks:
# 1. Group by manufacturer.
# 2. Compute:
#    - count of cars
#    - average mpg
# 3. Sort by average mpg (descending).
# 4. Create a gt table.
# 5. Format mpg (1 decimal).
# 6. Add a subtitle explaining the ranking.
# 7. Add a clean theme and improve labels.
# =========================================================

library(tidyverse)
library(gtExtras)
library(gt)

?mpg
view(mpg)
str(mpg)

mpg %>%
  mutate(
    manufacturer = factor(manufacturer)
  ) %>%
  group_by(manufacturer) %>%
  summarise(
    count = n(),
    avg_cty = mean(cty),
    avg_hwy = mean(hwy),
    avg_mpg = mean((cty + hwy) / 2),
    .groups = "drop"
  ) %>%
  arrange(-avg_mpg) %>%
  gt() %>%
  tab_header(
    title = "Car Manufacturer by Average Miles per Gallon",
    subtitle = "Manufacturers ranked from highest to lowest average MPG"
  ) %>%
  fmt_number(columns = c(avg_hwy, avg_cty, avg_mpg),
             decimals = 1) %>%
  cols_label(manufacturer = "Manufacturer",
             count= "Amount",
             avg_cty= "Avg. City MPG",
             avg_hwy= "Avg. Highway MPG",
             avg_mpg= "Total Avg. MPG"
             ) %>%
  cols_align(
    align = "center",
    columns = everything()
  ) %>%
  tab_footnote(
    footnote = "Original Dataset: mpg",
    locations = cells_column_labels(columns = c(manufacturer))
  ) %>%
  tab_footnote(
    footnote = "Considering City and Highway MPG",
    locations = cells_column_labels(columns = avg_mpg)
  ) %>%
  gt_theme_pff()












