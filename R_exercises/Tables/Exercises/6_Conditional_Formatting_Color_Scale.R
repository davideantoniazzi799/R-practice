# =========================================================
# Exercise 6 - Conditional Formatting (Color Scale)
# Dataset: mtcars
#
# Goal:
# Highlight values using a color gradient (like Excel heatmap).
#
# Visual idea:
# - Table with mpg and hp
# - Cells colored from low → high values
#
# Tasks:
# 1. Convert row names into a column (car names).
# 2. Select Model, mpg, and hp.
# 3. Create a gt table.
# 4. Apply a color gradient to mpg and hp columns.
# 5. Add a title and center-align columns.
# =========================================================

library(tidyverse)
library(gt)
library(gtExtras)
library(RColorBrewer)

display.brewer.all(colorblindFriendly = TRUE)

view(mtcars)
str(mtcars)

mtcars %>%
  rownames_to_column(var="Model") %>%
  select(Model, mpg, hp) %>%
  arrange(-hp, mpg) %>%
  gt() %>%
  tab_header(
    title = "Car Models and their Characteristics",
    subtitle = "Miles per Gallon (MPG) and Horsepower(HP)"
  ) %>%
  cols_label(mpg="MPG",
             hp="HP") %>%
  cols_align(
    align = "center",
    columns = c(Model, mpg, hp)
  ) %>%
  gt_theme_pff() %>%
  data_color(
    columns = mpg,
    fn = scales::col_numeric(
      palette = "Blues",
      domain = NULL)
    ) %>%
  data_color(
    columns = hp,
    fn = scales::col_numeric(
      palette = "Reds",
      # palette = viridis::viridis(100)
      # palette = RColorBrewer::brewer.pal(9, "YlGnBu")
      domain = NULL)
  )