# Exercise 1 - Introduction to ggplot2
# Using the products data frame (Ex. 16, Mixed Folder):
# Tasks:
# 1. Create a basic scatter plot with price on the x-axis and quantity on the y-axis.
# 2. Add appropriate axis labels and a title.
# 3. Change the color of all points to blue.
# 4. Increase the size of the points.
# 5. Apply a minimal theme to the plot.

library(tidyverse)

#Dataset
products <- data.frame(product_id = c(101, 102, 103, 104, 105),
                       category = c("A", "B", "A", "C", "B"),
                       price = c(25.5, 40.0, 35.0, 50.0, 45.0),
                       quantity = c(10, 5, 12, 7, 9))

products %>%
  ggplot(aes(price, quantity))+
  geom_point(colour = "blue", size = 5)+
  labs(x="Price", 
       y="Quantity", 
       title="Products' Price and Quantity")+
  theme_minimal()
