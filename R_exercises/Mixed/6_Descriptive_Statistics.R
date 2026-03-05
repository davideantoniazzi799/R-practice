# Exercise 6 - Descriptive Statistics
# 
# Create the following data frame called employees:
# - id: 1 to 10
# - age: 25, 32, 28, 45, 50, 29, 41, 38, 27, 36
# - salary: 30000, 42000, 35000, 80000, 95000, 37000, 72000, 68000, 33000, 59000
#  - department: "HR", "IT", "HR", "Management", "Management", "IT", "IT", "Management", "HR", "IT"
# 
# Tasks:
# - Display summary statistics of the entire data frame.
# - Compute:
#   - Mean salary
#   - Median salary
#   - Standard deviation of salary
#   - Compute the minimum and maximum age.
#   - Calculate the salary range.
# - Create a frequency table of the department variable.

employees <- data.frame(id = seq(1,10), 
                        age = c(25, 32, 28, 45, 50, 29, 41, 38, 27, 36),
                        salary = c(30000, 42000, 35000, 80000, 95000, 37000, 
                                  72000, 68000, 33000, 59000),
                        department = c("HR", "IT", "HR", "Management", 
                                      "Management", "IT", "IT", "Management", 
                                      "HR", "IT"))

# Summary statistics
summary(employees)

# Mean, Median and Standard Deviation of salary
mean(employees$salary)
median(employees$salary)
sd(employees$salary)

# Minimum and Maximum age
min(employees$age)
max(employees$age)

# Salary range
range(employees$salary)

# Frequency table of the department variable
table(employees$department)