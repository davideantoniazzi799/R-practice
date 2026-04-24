# =========================================================
# Exercise 10 - Highlighting Extremes (Min & Max)
# Dataset: mtcars
#
# Goal:
# Emphasize best and worst values.
#
# Visual idea:
# - Table with mpg values
# - Highest value highlighted in green
# - Lowest value highlighted in red
#
# Tasks:
# 1. Convert row names into a column (Model).
# 2. Select Model and mpg.
# 3. Create a gt table.
# 4. Highlight highest mpg in green.
# 5. Highlight lowest mpg in red.
# 6. Add title and clean theme.
# =========================================================

library(tidyverse)
library(gt)
library(gtExtras)

view(mtcars)

max_mpg <- max(mtcars$mpg)
min_mpg <- min(mtcars$mpg)

mtcars %>%
  rownames_to_column(var="Model") %>%
  select(Model, mpg) %>%
  gt() %>%
  tab_header(
    title = "Miles per Gallon by Car Model"
  ) %>%
  cols_label(Model="Model",
             mpg="MPG") %>%
  cols_align(
    align = "center",
    columns = everything()
  ) %>%
  gt_theme_guardian() %>%
  tab_footnote(
    footnote = "Green represents the highest, red the lowest",
    locations = cells_column_labels(columns = mpg)
  ) %>%
  tab_style(
    style = cell_text(color = "darkgreen", 
                      weight = "bold"),
    locations = cells_body(
      columns = mpg,
      rows = mpg == max_mpg)) %>%
  tab_style(
    style = cell_text(color = "red", 
                      weight = "bold"),
    locations = cells_body(
      columns = mpg,
      rows = mpg == min_mpg))

# To fill the cell
tab_style(
  style = cell_fill(color = "#d4edda"),
  locations = cells_body(
    columns = mpg,
    rows = mpg == max_mpg
  )
) %>%
  tab_style(
    style = cell_fill(color = "#f8d7da"),
    locations = cells_body(
      columns = mpg,
      rows = mpg == min_mpg
    )
  )