# =========================================================
# Exercise 1 – Basic Scatter Plot
# Dataset: mtcars
#
# Goal:
# A simple clean scatter plot
#
# Visual idea:
# Points spread diagonally, no colors, just clean minimal style
#
# Tasks:
# 1. Create a scatter plot of wt (weight) vs mpg.
# 2. Add axis labels and a title.
# 3. Set all points to a fixed color (e.g., dark blue).
# 4. Increase point size.
# 5. Apply theme_minimal().
# =========================================================

library(tidyverse)

view(mtcars)

mtcars %>%
  ggplot(aes(wt, mpg))+
  geom_point(color="darkblue",
                 size = 3)+
  labs(title="Car Weight vs. Miles per Gallon",
       x="Weight",
       y="Miles per Gallon")+
  theme_minimal()
