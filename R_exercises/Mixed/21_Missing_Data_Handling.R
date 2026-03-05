# Exercise 21 - Missing Data Handling
# Create a data frame called sales:
# - month: "Jan", "Feb", "Mar", "Apr", "May", "Jun"
# - revenue: 1200, 1500, NA, 1700, 1600, NA
# - expenses: 800, 900, 950, NA, 1100, 1000
# Tasks:
# 1. Display the entire data frame.
# 2. Identify which rows contain missing values.
# 3. Compute the mean revenue, ignoring missing values.
# 4. Replace missing values in revenue with the mean revenue.
# 5. Create a new column profit = revenue - expenses, handling missing values properly.

library(dplyr)

sales <- data.frame(month=c("Jan", "Feb", "Mar", "Apr", "May", "Jun"),
                    revenue=c(1200, 1500, NA, 1700, 1600, NA),
                    expenses=c(800, 900, 950, NA, 1100, 1000))

# 1. Display the entire data frame.
sales

# 2. Identify which rows contain missing values.
row_NA <- sales[!complete.cases(sales), ]
row_NA

# 3. Compute the mean revenue, ignoring missing values.
mean(sales$revenue, na.rm = TRUE)

# 4. Replace missing values in revenue with the mean revenue.
sales <- sales %>% 
  mutate(revenue = ifelse(is.na(revenue), mean(revenue, na.rm = TRUE), revenue))
sales

# 5. Create a new column profit = revenue - expenses, handling missing values properly.
sales <- sales %>% 
  mutate(expenses = ifelse(is.na(expenses), mean(expenses, na.rm = TRUE), expenses))
sales

sales <- sales %>% 
  mutate(profit = revenue - expenses)
sales

sales <- sales %>% 
  mutate(
    revenue = ifelse(is.na(revenue), mean(revenue, na.rm = TRUE), revenue),
    expenses = ifelse(is.na(expenses), mean(expenses, na.rm = TRUE), expenses),
    profit = revenue - expenses
  )
