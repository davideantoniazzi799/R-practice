# =========================================================
# Exercise 5 - Ranked Summary Table
# Dataset: diamonds
#
# Goal:
# Build a ranked performance-style table.
#
# Tasks:
# 1. Group the dataset by cut.
# 2. Compute average price and count of diamonds.
# 3. Create a ranking based on average price.
# 4. Create a gt table.
# 5. Highlight the best-performing category.
# =========================================================

library(tidyverse)
library(gt)
library(gtExtras)

view(diamonds)
str(diamonds)

diamonds %>%
  group_by(cut) %>%
  summarise(
    count = n(),
    avg_price = mean(price),
    .groups = "drop"
  ) %>%
  mutate(
    ranking = rank(-avg_price)
  ) %>%
  arrange(-avg_price) %>%
  gt() %>%
  tab_header(
    title = "Average Diamond Price by Cut"
  ) %>%
  fmt_number(columns = c(avg_price),
             decimals = 2) %>%
  cols_label(cut="Cut",
             count="Amount",
             avg_price="Avg. Price") %>%
  cols_align(
    align = "center",
    columns = everything()
  ) %>%
  gt_theme_538() %>%
  gt_highlight_rows(rows = ranking == min(ranking),
                    fill = "lightpink")


# tab_style(
#   style = list(
#     cell_fill(color = "lightpink"),
#     cell_text(weight = "bold")
#   ),
#   locations = cells_body(rows = 1)
# )
  