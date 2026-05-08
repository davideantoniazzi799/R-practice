# =========================================================
# Exercise 11 - Ranked Table with Conditional Formatting
# Dataset: mtcars
#
# Goal:
# Build a ranking table with visual emphasis.
#
# Visual idea:
# - Table ranked by mpg (descending)
# - Rank column (1 = best)
# - Top 3 highlighted differently
#
# Tasks:
# 1. Convert row names into a column (Model).
# 2. Select Model, mpg, and hp.
# 3. Create a ranking based on mpg (descending).
# 4. Create a gt table.
# 5. Highlight top 3 rows with a different background color.
# 6. Format mpg to 1 decimal.
# 7. Add a title and clean alignment.
# =========================================================

library(tidyverse)
library(gtExtras)
library(gt)

view(mtcars)

mtcars %>%
  rownames_to_column(var="Model") %>%
  select(Model, mpg, hp) %>%
  mutate(
    ranking = dense_rank(-mpg)
  ) %>%
  arrange(ranking) %>%
  gt() %>%
  tab_header(
    title = "Ranked Car Model by Miles per Gallon",
    subtitle = "MPG = Miles per Gallon, HP = Horsepower"
  ) %>%
  fmt_number(columns = c(mpg),
             decimals = 1) %>%
  cols_label(mpg="MPG",
             hp="HP",
             ranking = "Rank") %>%
  cols_align(
    align = "center",
    columns = everything()
  ) %>%
  gt_theme_538() %>%
  tab_style(
    style = list(
      cell_fill(color = "#1D5DF2"),
      cell_text(weight = "bold")),
    locations = cells_body(rows = ranking == 1)
  ) %>%
  tab_style(
    style = cell_fill(color = "#589DD6"),
    locations = cells_body(rows = ranking == 2)
  ) %>%
  tab_style(
    style = cell_fill(color = "#58D0D6"),
    locations = cells_body(rows = ranking == 3)
  )
  
  