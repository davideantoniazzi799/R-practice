# Exercise 19 - Using dplyr for Data Manipulation
# Load the dplyr package.
# Using the products data frame(Ex. 16):
# Tasks:
# 1. Filter products with category "A".
# 2. Select only product_id and price.
# 3. Create a new column discounted_price that is 10% less than the original price.
# 4. Arrange the products by quantity in ascending order.
# 5. Compute the average price per category using group_by() and summarise().

library(dplyr)

# 1. Filter products with category "A".
products %>% filter(category == "A")

# 2. Select only product_id and price.
products %>% select(product_id, price)

# 3. Create a new column discounted_price that is 10% less than the original price.
products <- products %>% mutate(discounted_price = 0.9 * price)

# 4. Arrange the products by quantity in ascending order.
products %>% arrange(quantity)

# 5. Compute the average price per category using group_by() and summarise()
avg_price_category <- products %>%
  group_by(category) %>%
  summarise(mean_price = mean(price))
avg_price_category
