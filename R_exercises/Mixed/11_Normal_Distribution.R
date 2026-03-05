# Exercise 11 - Working with the Normal Distribution
# Assume test scores are normally distributed with:
# - mean = 70
# - standard deviation = 10
# Tasks:
# 1. Compute the probability that a student scores above 85.
# 2. Compute the probability that a student scores between 60 and 80.
# 3. Find the score corresponding to the 90th percentile.
# 4. Standardise a score of 82 (compute its z-score).
# 5. Verify your answer in (1) using the z-score and pnorm().

# 1. Probability that a student scores above 85.
(1 - pnorm(85, mean = 70, sd = 10)) * 100

# 2. Probability that a student scores between 60 and 80.
(pnorm(80, mean = 70, sd = 10) - pnorm(60, mean = 70, sd = 10)) * 100

# 3. Score corresponding to the 90th percentile.
qnorm(0.90, mean = 70, sd = 10)

# 4. Standardise a score of 82 (compute its z-score).
z_score <- (82-70)/10

# 5. Verify your answer in (1) using the z-score and pnorm().
z_score <- (85-70)/10
pnorm(z_score, lower.tail = FALSE) * 100
