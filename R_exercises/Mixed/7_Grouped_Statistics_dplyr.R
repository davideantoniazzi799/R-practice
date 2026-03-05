# Exercise 7 - Grouped Statistics (Using dplyr)
# 
# Using the employees data frame (Ex. 6):
# - Compute the mean salary by department.
# - Compute the number of employees in each department.
# - Compute both mean and standard deviation of salary by department.
# - Arrange the departments by descending mean salary.
# 
# - Filter employees earning more than 60,000 and compute their average age.

library(dplyr)

# Mean salary by department
salary_dep_mean <- employees %>%
  group_by(department) %>%
  summarise(mean_salary = mean(salary))

salary_dep_mean

# Compute the number of employees in each department
employees_department <- employees %>%
  group_by(department) %>%
  summarise(total_count = n(),
               .groups = 'drop')

#Convert tibble to df
employees_department <- employees_department %>% as.data.frame()
employees_department

# Mean and Standard Deviation of salary by department
salary_dep_mean_sd <- employees %>%
  group_by(department) %>%
  summarise(
    mean_salary = mean(salary),
    sd_salary   = sd(salary))

salary_dep_mean_sd <- salary_dep_mean_sd %>% as.data.frame()
salary_dep_mean_sd

# Departments by descending mean salary
arrange(salary_dep_mean_sd, desc(mean_Salary))

# Employees earning more than 60,000 and their average age
salary60k <- filter(employees, salary > 60000)
mean(salary60k$age)