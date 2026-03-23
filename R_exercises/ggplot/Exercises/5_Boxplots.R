# Exercise 5 – Boxplots
# Using the products data frame (Ex. 16, Mixed Folder):
# Tasks:
# 1. Create a boxplot of price by category.
# 2. Add a title and axis labels.
# 3. Change the fill color by category.
# 4. Overlay the individual data points using geom_jitter().
# 5. Apply a clean theme (e.g., theme_minimal()).

library(tidyverse)

#Dataset
products <- data.frame(product_id = c(101, 102, 103, 104, 105),
                       category = c("A", "B", "A", "C", "B"),
                       price = c(25.5, 40.0, 35.0, 50.0, 45.0),
                       quantity = c(10, 5, 12, 7, 9))

products %>%
  ggplot(aes(category, price,
             fill = category)) +
  geom_boxplot()+
  geom_jitter(width = 0.1, 
              size = 2, 
              alpha = 0.7)+
  coord_flip()+
  theme_minimal()+
  labs(x="Category", 
       y="Price", 
       title = "Boxplot Category-Price", 
       fill = "Category")
