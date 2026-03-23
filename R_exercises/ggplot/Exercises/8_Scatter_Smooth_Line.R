# Exercise 8 – Scatter Plot with Smoothing Line
# Using the mtcars dataset:
# Tasks:
# 1. Create a scatter plot of hp (horsepower) vs mpg.
# 2. Color points by cyl.
# 3. Add a regression (smoothing) line using geom_smooth().
# 4. Remove the confidence interval shading.
# 5. Add title and labels.

library(tidyverse)

View(mtcars)
str(mtcars)

mtcars %>%
  mutate(cyl=as.factor(cyl))%>%
  ggplot(aes(hp, mpg, color=cyl))+
  geom_point()+
  geom_smooth(method = "lm", se = FALSE)+
  labs(title="Horsepower vs. Miles per Gallon by N° of Cylinders",
       x="Horsepower",
       y="Miles per Gallon",
       color = "N° Cyl")+
  theme_bw()

# To have only one regression line
#geom_smooth(aes(group = 1), method = "lm", se = FALSE, color = "black")