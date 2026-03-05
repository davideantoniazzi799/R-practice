# Exercise 14 - One-Sample Hypothesis Test
# Suppose a company claims that the average waiting time
# in their service center is 15 minutes.
# You collect a sample of 40 customers with:
# - sample mean = 17.2 minutes
# - sample standard deviation = 5.4 minutes
# Tasks:
# 1. State the null and alternative hypotheses.
# 2. Perform a one-sample t-test at alpha = 0.05.
# 3. Compute the test statistic manually.
# 4. Compute the p-value manually.
# 5. Compare your manual result with t.test().
# 6. Conclude whether the company's claim is supported.

# 1. Null and alternative hypotheses.
#H0 : mu = 15
#H1 : mu != 15

# 2. One-sample t-test at alpha = 0.05.
#No raw data

# 3. Compute the test statistic manually.
sample_mean <- 17.2
sample_sd <- 5.4
sample_size <- 40
t_test_manual <- (sample_mean - 15)/(sample_sd/sqrt(sample_size))
t_test_manual

# 4. Compute the p-value manually.
df <- sample_size - 1
p_value <- 2 * pt(-abs(t_test_manual), df = df)
p_value

# 5. Compare your manual result with t.test().
# No raw data

# 6. Conclude whether the company's claim is supported.
# Since p-value < 0.05, we reject the null hypothesis.
# There is statistically significant evidence that the
# true mean waiting time differs from 15 minutes.
# The sample suggests the average waiting time is higher than claimed.