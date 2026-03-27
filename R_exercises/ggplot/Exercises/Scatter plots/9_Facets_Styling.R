# =========================================================
# Exercise 9 – Facets + Consistent Styling
# Dataset: iris
#
# Visual idea:
# Multiple panels, one per species, very clean and comparable.
#
# Sketch:
# - 3 panels (setosa, versicolor, virginica)
# - Same axes, same style
# - Points colored consistently
#
# Tasks:
# 1. Create a scatter plot of Sepal.Length vs Petal.Length.
# 2. Use facet_wrap() by Species.
# 3. Use a consistent color palette (manual or brewer).
# 4. Remove redundant legends if needed.
# 5. Add a clean title and minimal theme.
# =========================================================

library(tidyverse)
library(RColorBrewer)

display.brewer.all(colorblindFriendly = TRUE)

view(iris)

iris %>%
  ggplot(aes(Sepal.Length, Petal.Length, color=Species))+
  geom_point(size=3, alpha = 0.6)+
  facet_wrap(~Species)+
  scale_color_brewer(palette = "Dark2")+
  labs(title = "Relationship Between Sepal and Petal Length Across Species",
       x="Sepal Length",
       y="Petal Length")+
  guides(color="none")+
  theme_minimal()+
  theme(plot.title = element_text(hjust=0.5))
