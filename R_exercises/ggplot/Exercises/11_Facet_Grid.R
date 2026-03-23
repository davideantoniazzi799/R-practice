# Exercise 11 – Facet Grid
# Using the built-in mtcars dataset:
# Tasks:
# 1. Convert cyl and gear to factors.
# 2. Create a scatter plot of wt vs mpg.
# 3. Use facet_grid() to create a grid of plots by cyl (rows) and gear (columns).
# 4. Color the points by gear.
# 5. Add a title and axis labels.

library(tidyverse)

view(mtcars)

mtcars %>%
  mutate(cyl = as.factor(cyl), gear = as.factor(gear))%>%
  ggplot(aes(wt, mpg, color = gear))+
  geom_point()+
  facet_grid(rows = vars(cyl), cols = vars(gear))+
  # facet_grid(cyl ~ gear) alternative
  labs(title = "Weight vs Miles per Gallon by Gear and Cylinders",
       x = "Weight",
       y = "Miles per Gallon",
       color= "Gear")+
  theme_bw()
