# Exercise 8 - Correlation and Covariance
# 
# Using the employees data frame (Ex. 6):
# - Compute the correlation between age and salary.
# - Compute the covariance between age and salary.
# - Create a scatter plot of age vs salary.
# - Add a linear regression line to the plot.
# 
# - Comment (in a code comment) whether the relationship appears positive, 
#   negative, or weak.

# Correlation between age and salary
cor(employees$age, employees$salary)

# Covariance between age and salary
cov(employees$age, employees$salary)

# Scatter plot of age vs salary
plot(x=employees$age, 
     y=employees$salary, 
     xlab="Age", 
     ylab="Salary",
     main="Age-Salary Relationship")

# Add a linear regression line
model <- lm(employees$salary ~ employees$age, data = employees)
abline(model, col = "red", lwd = 2)

# Comment
# The linear relationship between the age and salary is positive, as we can notice
# both from the correlation(0.99), the visualization and the regression line.
# As the age increases, so does the salary.