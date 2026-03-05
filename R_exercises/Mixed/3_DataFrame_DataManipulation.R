# Exercise 3 - Data Frames and Data Manipulation
# 
# Create a data frame called students with the following columns:
#   name: "Anna", "Ben", "Clara", "David", "Eva"
#   age: 21, 22, 20, 23, 21
#   grade: 14, 16, 15, 18, 13
# 
# - Display:
#   - The first 3 rows
#   - The structure of the data frame
#   - Add a new column passed that is TRUE if grade ??? 15.
#   
# - Calculate:
#   - The average grade
#   - The average grade of students who passed
# 
# - Sort the data frame by grade in descending order.

#Create the dataframe
df <- data.frame(
  name = c("Anna", "Ben", "Clara", "David", "Eva"),
  age = c(21, 22, 20, 23, 21),
  grade = c(14, 16, 15, 18, 13)
)

#Displaying
head(df, 3)
str(df)

#Add column
df$passed <- df$grade >= 15
head(df, 3)

#Average grade 
print(mean(df$grade))

#Average passed grade
print(mean(df$grade[df$passed == TRUE]))

#Ordering
df_order <- df[order(df$grade, decreasing = TRUE), ]
head(df_order, 3)
