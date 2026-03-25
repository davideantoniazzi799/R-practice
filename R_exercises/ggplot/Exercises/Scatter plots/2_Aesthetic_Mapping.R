# =========================================================
# Exercise 2 – Aesthetic Mapping (Color + Size)
# Dataset: iris
#
# Visual idea:
# Colored clusters (3 species), bigger points = larger petals
#
# Tasks:
# 1. Create a scatter plot of Sepal.Length vs Petal.Length.
# 2. Color points by Species.
# 3. Map size to Petal.Width.
# 4. Adjust transparency (alpha).
# 5. Add labels and a title.
# =========================================================

library(tidyverse)

view(iris)

iris %>% 
  ggplot(aes(Sepal.Length, Petal.Length, 
             colour = Species,
             size = Petal.Width))+
  geom_point(alpha=0.5)+
  labs(title="Sepal vs Petal Length by Species",
       x="Sepal Length",
       y="Petal Length",
       color="Species",
       size="Petal Width")+
  theme_bw()
