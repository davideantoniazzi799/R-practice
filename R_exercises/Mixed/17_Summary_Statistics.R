# Exercise 17 - Summary Statistics
# Using the products data frame (Ex. 16):
# Tasks:
# 1. Compute the mean, median, and standard deviation of price.
# 2. Compute the total quantity of all products.
# 3. Compute the average price per category.
# 4. Identify the most expensive product.
# 5. Count how many products have a quantity less than 10.

# 1. Compute the mean, median, and standard deviation of price.
mean(products$price)
median(products$price)
sd(products$price)

# 2. Compute the total quantity of all products.
sum(products$quantity)

# 3. Compute the average price per category.
tapply(products$price, products$category, mean)

# 4. Identify the most expensive product.
max_price <- products[products$price == max(products$price),]
products[which.max(products$price), ]
max_price

# 5. Count how many products have a quantity less than 10.
nrow(subset(products, quantity < 10))
sum(products$quantity < 10)
