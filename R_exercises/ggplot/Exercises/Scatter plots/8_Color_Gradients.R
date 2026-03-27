# =========================================================
# Exercise 8 – Using Color Gradients (Continuous Variable)
# Dataset: mtcars
#
# Visual idea:
# Scatter plot where color represents a continuous variable.
#
# Sketch:
# - Smooth gradient (e.g., light → dark)
# - Color represents horsepower or weight
#
# Tasks:
# 1. Create a scatter plot of wt vs mpg.
# 2. Map color to hp (continuous).
# 3. Use a gradient scale (e.g., scale_color_viridis()).
# 4. Adjust point size and alpha.
# 5. Add title, labels, and legend title.
# =========================================================

library(tidyverse)
library(viridis)

view(mtcars)

mtcars %>%
  ggplot(aes(wt, mpg, color = hp))+
  geom_point(size=3, alpha=0.8)+
  scale_color_viridis_c(direction = -1)+
  labs(title="Car Weight vs Miles per Gallon",
       x="Weight",
       y="Miles per Gallon",
       color="Horsepower")+
  theme_minimal()+
  theme(plot.title = element_text(hjust=0.5))
