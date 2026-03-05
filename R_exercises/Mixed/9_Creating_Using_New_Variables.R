# Exercise 9 - Creating and Using New Variables
# 
# Using the employees data frame(Ex. 6):
# - Create a new variable salary_k representing salary in thousands.
# - Create a categorical variable salary_level:
#   "Low" if salary < 40,000
#   "Medium" if salary between 40,000 and 70,000
#   "High" if salary > 70,000
#   
# - Display the number of employees in each salary level.
# - Compute the average salary for each salary level.
# - Create a boxplot of salary by department.

library(dplyr)

#  Create a new variable salary_k
employees$salary_k <- employees$salary / 1000

# Create a categorical variable salary_level
employees$salary_level <- ifelse(employees$salary < 40000, "Low",
                          ifelse(employees$salary <= 70000, "Medium", "High"))

# Number of employees in each salary level
table(employees$salary_level)

# Average salary for each salary level
salary_level_mean <- employees %>%
  group_by(salary_level) %>%
  summarise(mean_salary = mean(salary))

salary_level_mean

# Boxplot of salary by department
boxplot(salary ~ department, data = employees,
        main = "Salary by Department",
        xlab = "Department",
        ylab = "Salary")
