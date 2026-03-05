# Exercise 4 - Using dplyr
# 
# Load the dplyr package.
# Using the students data frame from Exercise 3:
#   - Use filter() to select students older than 21.
#   - Use select() to keep only name and grade.
#   - Use mutate() to create a new column bonus_grade which adds 1 point to each grade.
#   - Use arrange() to sort students by age.
#   - Use summarise() to compute the mean grade.
# 
# Bonus: Combine multiple operations using the pipe operator %>%.

# Load package
library(dplyr)

df <- data.frame(
  name = c("Anna", "Ben", "Clara", "David", "Eva"),
  age = c(21, 22, 20, 23, 21),
  grade = c(14, 16, 15, 18, 13)
)

#Filter
filter(df, age > 21)

#Select
select(df, name, grade)

#Mutate
mutate(df, bonus_grade = grade + 1)

#Arrange
arrange(df, age)

#Summarise
summarise(df, mean_grade = mean(grade))

# df %>%
#   filter(age > 21) %>%
#   select(name, grade) %>%
#   mutate(bonus_grade = grade + 1) %>%
#   arrange(grade)
# df %>%
#   summarise(mean_grade = mean(grade))