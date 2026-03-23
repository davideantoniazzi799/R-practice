# Exercise 13 – Faceting with Continuous Variable (Binning)
# Using the mtcars dataset:
# Tasks:
# 1. Create a scatter plot of hp vs mpg.
# 2. Create a new variable that groups hp into categories (e.g., Low, Medium, High).
# 3. Use facet_wrap() based on this new variable.
# 4. Color points by cyl.
# 5. Add labels and a theme.

library(tidyverse)

view(mtcars)

mtcars %>%
  mutate(hp_level = ifelse(hp<100, "Low", 
                           ifelse(hp<170, "Medium", "High")), 
         cyl = as.factor(cyl)) %>%
  mutate(hp_level = factor(hp_level, levels = c("Low", "Medium", "High"))) %>%
  ggplot(aes(hp, mpg, colour = cyl))+
  geom_point()+
  facet_wrap(~hp_level)+
  labs(x="HP",
       y ="Miles per Gallon",
       title = "Horsepower vs. Miles per Gallon by HP category and Cylinders",
       color="N° Cyl")+
  theme_bw()


# mutate(
#   hp_level = cut(hp,
#                  breaks = c(-Inf, 100, 170, Inf),
#                  labels = c("Low", "Medium", "High"))