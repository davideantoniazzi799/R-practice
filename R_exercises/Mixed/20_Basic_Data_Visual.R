# Exercise 20 - Basic Data Visualization
# Using the products data frame(Ex. 16):
# Tasks:
# 1. Create a bar plot of quantity for each product.
# 2. Create a scatter plot of price vs quantity.
# 3. Add axis labels and a title to both plots.
# 4. Color the points in the scatter plot based on category.
# 5. Save the scatter plot as a PNG file named price_quantity.png.

library(ggplot2)

# 1. Create a bar plot of quantity for each product.
barplot(products$quantity, 
        names.arg = products$product_id, 
        xlab ="Products",
        ylab ="Quantity", col ="green",
        main ="Products Quantities")

# 2. Create a scatter plot of price vs quantity.
p <- ggplot(products, 
       aes(x=price, 
           y=quantity, 
           color=category,
           size = 3)) +
  geom_point() + 
  labs(title = "Price-Quantity Relationship",
    x = "Price",
    y = "Quantity")
p

# 5. Save the scatter plot as a PNG file named price_quantity.png.
ggsave("price_quantity_ex20.png", plot = p, width = 6, height = 4)

