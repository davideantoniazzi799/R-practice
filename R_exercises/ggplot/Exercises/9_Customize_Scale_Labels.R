# Exercise 9 – Customizing Scales and Labels
# Using the mtcars dataset:
# Tasks:
# 1. Create a scatter plot of wt vs mpg.
# 2. Change the x-axis and y-axis labels to more descriptive names.
# 3. Customize the x-axis scale (e.g., breaks).
# 4. Customize the y-axis limits.
# 5. Change the legend title for cyl.

library(tidyverse)

View(mtcars)
str(mtcars)

mtcars %>%
  mutate(cyl = as.factor(cyl)) %>%
  ggplot(aes(wt, mpg, 
             color = cyl))+
  geom_point(size = 2)+
  scale_x_continuous(breaks = seq(1.5, 5.5, by = 0.5))+
  coord_cartesian(ylim= c(5, 40))+
  labs(title = "Weight vs Miles per Gallon by N° of Cylinders",
       x = "Weight",
       y = "Miles per Gallons",
       color="N° Cyl")+
  theme_bw()
