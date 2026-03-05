# Exercise 10 - Basic Statistical Testing
# 
# Using the employees data frame (Ex. 6):
# - Perform a t-test to compare the salaries of employees in:
#   - IT vs HR departments
# - Check whether the mean salaries differ significantly.
# - Extract and print:
#   - The p-value
#   - The confidence interval
# 
# Compute the overall 95% confidence interval for the mean salary.
# 
# Briefly interpret (as a code comment) the result of the t-test.

library(dplyr)

employees <- data.frame(id = seq(1,10), 
                        age = c(25, 32, 28, 45, 50, 29, 41, 38, 27, 36),
                        salary = c(30000, 42000, 35000, 80000, 95000, 37000, 
                                   72000, 68000, 33000, 59000),
                        department = c("HR", "IT", "HR", "Management", 
                                       "Management", "IT", "IT", "Management", 
                                       "HR", "IT"))

# t-test 
salary_IT <- employees %>%
  filter(department == "IT") %>%
  pull(salary)

salary_HR <- employees %>%
  filter(department == "HR") %>%
  pull(salary)

result_ttest <- t.test(salary_IT, salary_HR)

# p-value
result_ttest$p.value

# confidence interval
result_ttest$conf.int

# 95% confidence interval for the mean salary
salary_mean <- mean(employees$salary)
sd_salary <- sd(employees$salary)
n <- nrow(employees)

margin <- qt(0.975,df=n-1)*sd_salary/sqrt(n)

lowerinterval <- salary_mean - margin
upperinterval <- salary_mean + margin

lowerinterval 
upperinterval 

# Comment
# The t-test compares the mean salaries of IT and HR employees.
# If the p-value is below 0.05, we reject the null hypothesis 
# and conclude that the mean salaries differ significantly.
# Given the dataset, IT salaries appear higher than HR salaries.