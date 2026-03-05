# Exercise 23 - Using apply Functions
# Using the following data frame scores:
# - student: "Alice", "Bob", "Charlie", "Diana"
# - math: 80, 90, 70, 85
# - english: 75, 95, 80, 90
# - science: 88, 85, 78, 92
# Tasks:
# 1. Compute the average score for each student using apply.
# 2. Compute the average score for each subject using apply.
# 3. Add a column total_score = sum of all subjects for each student using rowSums.
# 4. Identify the student with the highest total score.
# 5. Compute the standard deviation of each subject using sapply.

scores <- data.frame(student=c("Alice", "Bob", "Charlie", "Diana"),
                     math=c(80, 90, 70, 85),
                     english=c(75, 95, 80, 90),
                     science=c(88, 85, 78, 92))

# 1. Compute the average score for each student using apply
row.avg <- apply(X = scores[, 2:4], MARGIN = 1, FUN = mean)
row.avg

# 2. Compute the average score for each subject using apply.
col.avg <- apply(X = scores[, 2:4], MARGIN = 2, FUN = mean)
col.avg

# 3. Add a column total_score = sum of all subjects for each student using rowSums.
scores$total_score <- rowSums(scores[, 2:4])
scores

# # 4. Identify the student with the highest total score.
scores[which.max(scores$total_score),]

# 5. Compute the standard deviation of each subject using sapply.
sapply(scores[, 2:5], sd)
