# Exercise 6 - Faceting
# Using the built-in mtcars dataset:
# Tasks:
# 1. Create a scatter plot of wt (weight) vs mpg (miles per gallon).
# 2. Color the points by the number of cylinders (cyl).
# 3. Create separate plots for each cylinder group using facet_wrap().
# 4. Add a title and axis labels.
# 5. Apply a clean theme.

library(tidyverse)

View(mtcars)
str(mtcars)

mtcars %>%
  ggplot(aes(wt, mpg, 
             color = factor(cyl)))+
  geom_point()+
  facet_wrap(~factor(cyl))+
  labs(title = "Weight vs Miles per Gallon by N° of Cylinders",
       x = "Weight",
       y = "Miles per Gallon",
       color = "N° Cyl")+
  theme_bw()
