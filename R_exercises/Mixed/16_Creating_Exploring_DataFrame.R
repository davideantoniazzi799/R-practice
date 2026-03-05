# Exercise 16 - Creating and Exploring a Data Frame
# Create a data frame called products with the following columns:
# - product_id: 101, 102, 103, 104, 105
# - category: "A", "B", "A", "C", "B"
# - price: 25.5, 40.0, 35.0, 50.0, 45.0
# - quantity: 10, 5, 12, 7, 9
# Tasks:
# 1. Display the first 3 rows of the data frame.
# 2. Display the structure of the data frame.
# 3. Compute the total inventory value for each product (price * quantity).
# 4. Add a new column in_stock that is TRUE if quantity > 8.
# 5. Extract only the rows where category is "B".

products <- data.frame(product_id = c(101, 102, 103, 104, 105),
                       category = c("A", "B", "A", "C", "B"),
                       price = c(25.5, 40.0, 35.0, 50.0, 45.0),
                       quantity = c(10, 5, 12, 7, 9))


# 1. First 3 rows of the data frame.
head(products, 3)

# 2. Structure of the data frame.
str(products)

# 3. Total inventory value for each product (price * quantity).
products$inventory_value <- products$price * products$quantity
products

# 4. Add a new column in_stock that is TRUE if quantity > 8.
products$in_stock <- products$quantity > 8
head(products, 3)

# 5. Extract only the rows where category is "B".
categoryB <- products[products$category == "B",]
categoryB <- subset(products, category == "B")
categoryB
