# =========================================================
# Exercise 10 – Combining Multiple Improvements
# Dataset: mtcars
#
# Visual idea:
# A "publication-style" scatter plot combining:
# - groups
# - regression lines
# - clean theme
# - good color choices
#
# Sketch:
# - Points colored by cyl
# - One regression line per group
# - Clean legend
# - Balanced layout
#
# Tasks:
# 1. Create a scatter plot of hp vs mpg.
# 2. Convert cyl to factor and color points by cyl.
# 3. Add regression lines per group (no CI).
# 4. Use a nice color palette (manual or viridis).
# 5. Improve theme (title centered, readable text, legend clean).
# =========================================================

library(tidyverse)
library(viridis)

view(mtcars)

mtcars %>%
  mutate(cyl = factor(cyl)) %>%
  ggplot(aes(hp, mpg, color=cyl))+
  geom_point(size=2.5, alpha = 0.7)+
  geom_smooth(aes(group = cyl), 
              linewidth = 1,
              method = "lm", 
              se = FALSE)+
  scale_color_viridis(discrete = TRUE, direction = -1)+
  labs(title="Car Horsepower vs Miles per Gallon by Cylinders",
       x="Horsepower",
       y="Miles per Gallon",
       color="N° Cyl")+
  theme_bw()+
  theme(plot.title = 
          element_text(hjust=0.5,
                       face="bold"),
        legend.background=
          element_rect(fill="white",
                       color="black",
                       linewidth = 0.5),
        legend.key = 
          element_rect(fill="white",
                       color = "black",
                       linewidth = 0.2),
        legend.title = 
          element_text(face="italic"),
        legend.position=c(0.9, 0.8))
