# Exercise 10 – Combining Geoms
# Using the mtcars dataset:
# Tasks:
# 1. Create a boxplot of mpg by cyl.
# 2. Overlay individual data points using geom_jitter().
# 3. Color points by cyl.
# 4. Add a title and axis labels.
# 5. Try a different theme (e.g., theme_light()).

library(tidyverse)

View(mtcars)
str(mtcars)

mtcars %>%
  mutate(cyl = as.factor(cyl))%>%
  ggplot(aes(cyl, mpg, fill = cyl))+
  geom_boxplot(alpha = 0.5)+
  geom_jitter(width = 0.1, color = "black", alpha = 0.7)+
  scale_fill_manual(values = c("lightblue", "lightgreen", "lightcoral"))+
  theme_light()+
  labs(x="Cylinders", 
       y="Miles per Gallon (mpg)", 
       title = "Boxplot Cylinder-Miles per Gallon",
       fill = "N° Cyl")
