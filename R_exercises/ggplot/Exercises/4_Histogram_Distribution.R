# Exercise 4 – Histograms and Distributions
# Using the products data frame (Ex. 16, Mixed Folder):
# Tasks:
# 1. Create a histogram of the price variable.
# 2. Change the number of bins.
# 3. Add color to the bars.
# 4. Add a title and axis labels.
# 5. Create a density plot of price.

library(tidyverse)

#Dataset
products <- data.frame(product_id = c(101, 102, 103, 104, 105),
                       category = c("A", "B", "A", "C", "B"),
                       price = c(25.5, 40.0, 35.0, 50.0, 45.0),
                       quantity = c(10, 5, 12, 7, 9))


# 1. Create a histogram of the price variable
products %>%
  ggplot(aes(price))+
  geom_histogram(binwidth = 2, 
                 fill = "#97B3C6",
                 color = "black")+
  theme_bw()+
  labs(x="Price", 
       y=NULL, 
       title="Price Histogram")

# 5. Create a density plot of price
products %>%
  ggplot(aes(price)) +
  geom_density(fill="lightblue")+
  theme_bw()
