# Exercise 15 - Proportions and Binomial Distribution
# A factory claims that 5% of its products are defective.
# You inspect 120 products and find 11 defective items.
# Tasks:
# 1. What is the expected number of defectives under the claim?
# 2. Compute the probability of observing exactly 11 defectives.
# 3. Compute the probability of observing 11 or more defectives.
# 4. Perform a hypothesis test for the true proportion.
# 5. Construct a 95% confidence interval for the true defect rate.
# 6. Interpret the result in a short code comment.

# 1. What is the expected number of defectives under the claim?
p0 <- 0.05
exp_defectives <- p0 * 120
exp_defectives

# 2. Compute the probability of observing exactly 11 defectives.
n <- 120
dbinom(11, size = n, prob = p0)

# 3. Compute the probability of observing 11 or more defectives.
1 - pbinom(10, size = n, prob = p0)

# 4. Perform a hypothesis test for the true proportion.
# H0: p = 0.05
# H1: p != 0.05
x <- 11
prop.test(x, n, p = 0.05, correct = FALSE)

# 5. Construct a 95% confidence interval for the true defect rate.
prop.test(x, n, correct = FALSE)$conf.int

# 6. Interpret the result in a short code comment.
# Since the p-value is less than 0.05, we reject H0.
# There is significant evidence that the true defect rate
# differs from 5%. The observed proportion (~9.2%) is
# substantially higher than the claimed 5%.