# Exercise 15 – Annotations and Text
# Using the mtcars dataset:
# Tasks:
# 1. Create a scatter plot of wt vs mpg.
# 2. Add labels (text) for each point using the row names of mtcars.
# 3. Adjust text size and position to avoid overlap.
# 4. Highlight one specific car (e.g., "Toyota Corolla") with a different color.
# 5. Add a title and axis labels.

library(tidyverse)
library(ggplot2)
library(ggrepel)

view(mtcars)

mtcars %>%
  mutate(car = rownames(mtcars),
         highlight = ifelse(car == "Toyota Corolla", "Highlight", "Other")) %>%
  ggplot(aes(wt, mpg))+
  geom_point(aes(color = highlight), size = 3) +
  geom_text_repel(aes(label = car), size = 3) +
  scale_color_manual(values = c("Highlight" = "red", "Other" = "black")) +
  labs(
    title = "Weight vs Miles per Gallon",
    x = "Weight",
    y = "Miles per Gallon",
    color = "Car Type"
  ) +
  theme_bw()
