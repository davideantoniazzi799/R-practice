# Exercise 1 - Vectors and Basic Operations

# Create a numeric vector called scores containing the following values:
# 12, 15, 18, 10, 17, 19, 14

# Compute:
# - The mean of the vector
# - The median
# - The standard deviation
# - Create a new vector called passed that is TRUE if the score is greater than or equal to 15 and FALSE otherwise.
# - Extract only the scores that are strictly greater than 16.
# - Replace the lowest score in the vector with 13.

scores <- c(12, 15, 18, 10, 17, 19, 14)
mean(scores)
median(scores)
sd(scores)

passed <- scores >= 15

scores[scores>16]
scores[which.min(scores)] <- 13
print(scores)
