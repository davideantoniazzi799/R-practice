# Exercise 2 – Aesthetic Mapping
# Using the products data frame (Ex. 16, Mixed Folder):
# Tasks:
# 1. Create a scatter plot of price vs quantity.
# 2. Map the color of points to the category variable.
# 3. Map the size of points to quantity.
# 4. Add a title and axis labels.
# 5. Change the legend title for category.

library(tidyverse)

#Dataset
products <- data.frame(product_id = c(101, 102, 103, 104, 105),
                       category = c("A", "B", "A", "C", "B"),
                       price = c(25.5, 40.0, 35.0, 50.0, 45.0),
                       quantity = c(10, 5, 12, 7, 9))

products %>%
  ggplot(aes(price, quantity, 
             color = category))+
  geom_point(aes(size = quantity))+
  labs(x="Price", 
       y="Quantity", 
       title="Price vs Quantity", 
       color="Category")
