# =========================================================
# Exercise 7 - Top N Table with Filtering
# Dataset: diamonds
#
# Goal:
# Show only the most relevant categories.
#
# Visual idea:
# - Table showing only top 5 cuts by average price
# - Clean and minimal
#
# Tasks:
# 1. Group by cut.
# 2. Compute average price and count.
# 3. Sort by average price (descending).
# 4. Keep only top 5 rows.
# 5. Create a gt table with formatted numbers and title.
# =========================================================

library(tidyverse)
library(gt)
library(gtExtras)

view(diamonds)

diamonds %>%
  group_by(cut) %>%
  summarise(
    count = n(),
    avg_price = mean(price),
    .groups = "drop"
  ) %>%
  arrange(-avg_price) %>%
  slice_head(n = 5) %>%
  gt() %>%
  tab_header(
    title = "Top 5 Diamond Cuts by Average Price"
  ) %>%
  fmt_number(columns = avg_price,
             decimals = 2) %>%
  cols_label(cut="Cut",
             count = "Amount",
             avg_price="Avg. Price") %>%
  cols_align(
    align = "center",
    columns = everything()
  ) %>%
  gt_theme_espn()
