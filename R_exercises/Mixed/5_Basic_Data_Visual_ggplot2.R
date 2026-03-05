# Exercise 5 - Basic Data Visualization with ggplot2
# 
# Load the ggplot2 package.
# Using the students data frame:
#   - Create a scatter plot of age (x-axis) vs grade (y-axis).
#   - Add appropriate axis labels and a title.
#   - Change the color of the points.
# 
# Create a bar plot showing the grade of each student.
# Add a horizontal line representing the average grade.
# 
# Bonus: Change the theme of the plot.
# 
# Save one of the plots as a PNG file.

#Load package
library(ggplot2)

df <- data.frame(
  name = c("Anna", "Ben", "Clara", "David", "Eva"),
  age = c(21, 22, 20, 23, 21),
  grade = c(14, 16, 15, 18, 13)
)

# Create scatter plot
ggplot(df, aes(x = age, y = grade)) +
  geom_point(color = "yellow") +
  labs(
    title = "Age-Grade Relationship",
    x = "Age",
    y = "Grade"
  ) + theme_classic()

#Bar plot
mean_grade <- mean(df$grade)
ggplot(df, aes(x = name, y = grade)) +
  geom_bar(stat = "identity", fill = "#1b98e0") +
  geom_hline(yintercept = mean_grade, linetype = "dashed") +
  labs(
    title = "Grades by Student",
    x = "Student",
    y = "Grade"
  ) + theme_classic()


# Save file
p <- ggplot(df, aes(x = name, y = grade)) +
  geom_bar(stat = "identity", fill = "#1b98e0") +
  theme_classic()

ggsave("barplot.png", plot = p, width = 6, height = 4)
