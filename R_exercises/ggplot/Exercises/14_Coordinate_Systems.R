# Exercise 14 – Coordinate Systems
# Using the built-in mtcars dataset:
# Tasks:
# 1. Create a boxplot of mpg by cyl.
# 2. Flip the coordinates using coord_flip().
# 3. Try zooming into the y-axis using coord_cartesian().
# 4. Add labels and a title.
# 5. Apply a theme of your choice.

library(tidyverse)

view(mtcars)

mtcars %>% 
  mutate(cyl = as.factor(cyl)) %>%
  ggplot(aes(cyl, mpg))+
  geom_boxplot()+
  coord_flip() +
  scale_y_continuous(limits = c(15, 30))+
  labs(title="Boxplot Cylinders - Miles per Gallon",
       x = "N° Cylinders",
       y = "mpg")+
  theme_classic()
  