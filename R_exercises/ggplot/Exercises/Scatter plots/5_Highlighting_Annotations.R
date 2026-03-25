# =========================================================
# Exercise 5 – Highlighting + Annotation
# Dataset: mtcars
#
# Visual idea:
# Scatter plot where one car is highlighted and labeled
#
# Tasks:
# 1. Create a scatter plot of wt vs mpg.
# 2. Add labels using row names (car names).
# 3. Use ggrepel to avoid overlapping text.
# 4. Highlight "Toyota Corolla" with a different color and larger size.
# 5. Add a title and clean theme.
#
# Hint:
# - Use rownames(mtcars) to create a label column
# - Use ifelse() inside aes() to highlight one car
# =========================================================

library(tidyverse)
library(ggrepel)

view(mtcars)

mtcars %>%
  mutate(car = rownames(mtcars),
         highlight = ifelse(car == "Toyota Corolla","Highlight","Other")) %>%
  ggplot(aes(wt,mpg))+
  geom_point(aes(color = highlight),
             size = 2, 
             alpha = 0.6)+
  geom_text_repel(aes(label = car), size = 3) +
  scale_color_manual(values = c("Highlight" = "red", "Other" = "black")) +
  labs(title="Car Weight vs Miles per Gallon",
       x="Weight",
       y="Miles per Gallon",
       color="Car Type")+
  theme_minimal()+
  theme(plot.title=
          element_text(color="steelblue",
                       hjust = 0.5))

# To show only highlighted car
# geom_text_repel(aes(label = ifelse(highlight == "Highlight", car, "")), size = 3)
