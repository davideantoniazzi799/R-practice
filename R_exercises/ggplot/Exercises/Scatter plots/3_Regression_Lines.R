# =========================================================
# Exercise 3 – Adding Regression Lines
# Dataset: mtcars
#
# Visual idea:
# Scatter plot with 3 colored groups + regression lines per group
#
# Tasks:
# 1. Create a scatter plot of hp vs mpg.
# 2. Convert cyl to a factor and color by cyl.
# 3. Add a linear regression line for each group.
# 4. Remove confidence interval shading.
# 5. Customize legend title and plot title.
# =========================================================

library(tidyverse)

view(mtcars)

mtcars %>%
  mutate(cyl = factor(cyl))%>%
  ggplot(aes(hp, mpg, color=cyl))+
  geom_point()+
  geom_smooth(aes(group = cyl), method = "lm", se = FALSE)+
  labs(title="Car Horsepower vs Miles per Gallon by Cylinder",
       x="Horsepower",
       y="Miles per Gallon",
       color="N° Cyl")+
  theme_bw()+
  theme(plot.title=
          element_text(color="steelblue",
                       family="sans",
                       face="bold",
                       hjust = 0.5),
        legend.background=
          element_rect(fill="white",
                       color="black",
                       size=0.8),
        legend.key = 
          element_rect(fill="white",
                       color = "black",
                       size = 0.2),
        legend.title = 
          element_text(face="bold.italic"),
        legend.text = 
          element_text(family="sans",
                       face ="bold",
                       color = "steelblue"))

        