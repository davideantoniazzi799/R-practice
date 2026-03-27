# =========================================================
# Exercise 6 – Emphasizing Groups with Transparency
# Dataset: mtcars
#
# Visual idea:
# Scatter plot where one group stands out clearly,
# while others are faded in the background.
#
# Sketch:
# - Most points: light gray, semi-transparent
# - One group (e.g., cyl = 6): strong color and visible
#
# Tasks:
# 1. Create a scatter plot of wt vs mpg.
# 2. Convert cyl to factor.
# 3. Highlight only cars with 6 cylinders (different color).
# 4. Make all other points gray and more transparent.
# 5. Add a clear title and labels.
# =========================================================

library(tidyverse)

view(mtcars)

mtcars %>%
  mutate(six_cyl = ifelse(cyl == 6,"6 Cylinders","Other"),
         cyl=factor(cyl)) %>%
  ggplot(aes(wt, mpg, 
             alpha=six_cyl, 
             size=six_cyl))+
  geom_point(aes(color=six_cyl),
             size = 2)+
  scale_color_manual(values = c("6 Cylinders" = "darkblue", 
                                "Other" = "lightgray")) +
  scale_alpha_manual(values = c("Other"= 0.3, 
                                "6 Cylinders"= 1))+
  scale_size_manual(values = c("6 Cylinders" = 3, 
                               "Other" = 2)) +
  labs(title="Car Weight vs Miles per Gallon",
       x="Weight",
       y="Miles per Gallon",
       color="Group")+
  guides(alpha = "none",
         size="none")+
  theme_bw()+
  theme(plot.title=element_text(hjust = 0.5))
