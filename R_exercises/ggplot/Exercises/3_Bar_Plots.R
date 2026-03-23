# Exercise 3 – Bar Plots
# Using the products data frame (Ex. 16, Mixed Folder):
# Tasks:
# 1. Create a bar plot showing the number of products per category.
# 2. Create a bar plot showing total quantity per category.
# 3. Change the fill color based on category.
# 4. Add labels and a title.
# 5. Try a different theme (e.g., theme_classic()).

library(tidyverse)

#Dataset
products <- data.frame(product_id = c(101, 102, 103, 104, 105),
                       category = c("A", "B", "A", "C", "B"),
                       price = c(25.5, 40.0, 35.0, 50.0, 45.0),
                       quantity = c(10, 5, 12, 7, 9))

# 1. Create a bar plot showing the number of products per category
products %>%
  ggplot(aes(category))+
  geom_bar()+
  labs(x="Category", 
       y="Count", 
       title="Amount of Products per Category")+
  theme_classic()

# 2. Create a bar plot showing total quantity per category
products %>%
  ggplot(aes(category, quantity, fill=category))+
  geom_bar(stat = "identity")+
  labs(x="Category", 
       y="Quantity", 
       title="Quantities per Category")+
  theme_classic()
