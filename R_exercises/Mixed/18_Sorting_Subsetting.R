# Exercise 18 - Sorting and Subsetting
# Using the products data frame(Ex. 16):
# Tasks:
# 1. Sort the data frame by price in descending order.
# 2. Sort the data frame by category (ascending) and price (descending).
# 3. Extract the product_id and price columns only.
# 4. Extract all products where price > 40 and quantity >= 5.
# 5. Remove the quantity column from the data frame.

# 1. Sort the data frame by price in descending order
df_ordered <- products[order(products$price, decreasing = TRUE), ]
df_ordered

# 2. Sort the data frame by category (ascending) and price (descending)
df_ordered <- products[with(products, order(category, -price)), ]
df_ordered

# 3. Extract the product_id and price columns only.
products[c("product_id", "price")]

# 4. Extract all products where price > 40 and quantity >= 5.
filtered <- subset(products, price > 40 & quantity >= 5)
filtered

# 5. Remove the quantity column from the data frame.
filtered <- subset(products, select = -quantity)
filtered
