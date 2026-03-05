# Exercise 22 - Merging Data Frames
# Create two data frames:
#   employees1:
# - id: 1, 2, 3, 4
# - name: "Anna", "Ben", "Clara", "David"
# - department: "HR", "IT", "IT", "Management"
# employees2:
# - id: 3, 4, 5, 6
# - salary: 50000, 60000, 55000, 62000
# Tasks:
# 1. Merge the two data frames by id (inner join).
# 2. Merge the two data frames by id (full outer join).
# 3. Extract only employees who are in IT and have a salary.
# 4. Sort the merged data frame by salary descending.
# 5. Count how many employees have salary greater than 55000.

library(dplyr)

employees1 <- data.frame(id=c(1, 2, 3, 4),
                         name=c("Anna", "Ben", "Clara", "David"),
                         department=c("HR", "IT", "IT", "Management"))

employees2 <- data.frame(id=c(3, 4, 5, 6),
                         salary=c(50000, 60000, 55000, 62000))

# 1. Merge the two data frames by id (inner join).
inner_join_merge <- inner_join(employees1, employees2, by='id')
inner_join_merge

# 2. Merge the two data frames by id (full outer join).
full_join_merge <- full_join(employees1, employees2, by='id')
full_join_merge

# 3. Extract only employees who are in IT and have a salary.
sub1 <- subset(full_join_merge, 
               department == "IT" & !is.na(salary))
sub1

# 4. Sort the merged data frame by salary descending.
data_sorted <- full_join_merge[order(full_join_merge$salary, decreasing = TRUE), ]
data_sorted

# 5. Count how many employees have salary greater than 55000.
sum(full_join_merge$salary > 55000, na.rm = TRUE)
