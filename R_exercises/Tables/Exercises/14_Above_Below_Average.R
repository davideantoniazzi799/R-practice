# =========================================================
# Exercise 14 - Highlighting Above/Below Average
# Dataset: diamonds
#
# Goal:
# Emphasize values relative to a benchmark.
#
# Visual idea:
# - Table of cuts with avg price
# - Above average → green
# - Below average → red
#
# Tasks:
# 1. Group by cut.
# 2. Compute average price.
# 3. Compute overall average price.
# 4. Create a gt table.
# 5. Highlight rows above average in green.
# 6. Highlight rows below average in red.
# 7. Add title and format numbers.
# =========================================================

library(tidyverse)
library(gtExtras)
library(gt)

view(diamonds)

avg_overall_price <- round(mean(diamonds$price), 2)
avg_overall_price

diamonds %>%
  group_by(cut) %>%
  summarise(
    count = n(),
    avg_price = mean(price),
    .groups = "drop"
  ) %>%
  mutate(
    highlight_price = case_when(
      avg_price >= avg_overall_price ~ "Higher",
      avg_price < avg_overall_price ~ "Lower"
    )
  ) %>%
  gt() %>%
  cols_hide(columns = highlight_price) %>%
  tab_header(
    title = "Average Price by Diamond Cut",
    subtitle = paste(
      "Overall Average Diamond Price:",
      scales::dollar(avg_overall_price)
    )
  ) %>%
  fmt_number(columns = c(avg_price),
             decimals = 2) %>%
  cols_label(cut = "Cut",
             count= "Amount",
             avg_price= "Avg. Price") %>%
  cols_align(
    align = "center",
    columns = everything()
  ) %>%
  tab_footnote(
    footnote = html(
      "Green boxes represent higher avg. price<br>
    Red boxes represent lower avg. price"
    ),
    locations = cells_column_labels(columns = c(avg_price))
  ) %>%
  gt_theme_pff() %>%
  tab_style(
    style = cell_fill(color = "#d4edda"),
    locations = cells_body(
      columns = everything(),
      rows = highlight_price == "Higher"
    )
  ) %>%
  tab_style(
    style = cell_fill(color = "#f8d7da"),
    locations = cells_body(
      columns = everything(),
      rows = highlight_price == "Lower"
    )
  )
  





