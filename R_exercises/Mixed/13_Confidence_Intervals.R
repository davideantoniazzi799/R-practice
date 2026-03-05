# Exercise 13 - Confidence Intervals
# Using the sample from Exercise 12 (size = 30):
# Tasks:
# 1. Compute the sample mean and sample standard deviation.
# 2. Construct a 95% confidence interval manually.
# 3. Construct the same interval using t.test().
# 4. Check whether the true population mean (50) lies inside the interval.
# 5. Explain (in a code comment) what a 95% confidence interval means.

set.seed(100)
data <- rnorm(10000, mean = 50, sd = 12)
sample_size <- 30
random_sample <- sample(x=data, size=sample_size)

# 1. Sample mean and sample standard deviation.
mean(random_sample)
sd(random_sample)

# 2. Construct a 95% confidence interval manually.
t_crit <- qt(0.975, df = sample_size - 1)

low_boundary <- mean(random_sample) - t_crit*sd(random_sample)/sqrt(sample_size)
upp_boundary <- mean(random_sample) + t_crit*sd(random_sample)/sqrt(sample_size)

conf_interval <- c(low_boundary, upp_boundary)
conf_interval

# 3. Construct the same interval using t.test()
result <- t.test(random_sample)
confidence_interval <- result$conf.int
confidence_interval

# 4. Check whether the true population mean (50) lies inside the interval
50 >= low_boundary & 50 <= upp_boundary

# 5. Explain (in a code comment) what a 95% confidence interval means.
# A 95% confidence interval means that if we repeatedly
# took samples of size 30 and constructed intervals in this way,
# approximately 95% of those intervals would contain the true
# population mean. It does NOT mean there is a 95% probability
# that the true mean lies in this specific interval.