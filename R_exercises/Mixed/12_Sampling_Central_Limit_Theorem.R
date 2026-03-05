# Exercise 12 - Sampling and the Central Limit Theorem
# Set a seed for reproducibility.
# Generate a population of 10,000 observations from a normal distribution:
# - mean = 50
# - sd = 12
# Tasks:
# 1. Compute the population mean and standard deviation.
# 2. Take a random sample of size 30 and compute its mean.
# 3. Repeat the sampling process 1,000 times and store the sample means.
# 4. Compute the mean and standard deviation of the sample means.
# 5. Compare:
#   - The population mean
#   - The mean of the sample means
# 6. Compute the theoretical standard error and compare it with the
# standard deviation of the simulated sample means.

# Set a seed
set.seed(100)

# Generate 10,000 observations from a normal distribution (mean = 50, sd = 12)
data <- rnorm(10000, mean = 50, sd = 12)

# 1. Population mean and standard deviation.
mean(data)
sd(data)

# 2. Random sample of size 30 and compute its mean.
sample_size <- 30
random_sample <- sample(x=data, size=sample_size)
mean(random_sample)

# 3. Repeat the sampling process 1,000 times and store the sample means.
n_repeats <- 1000
samples_list_means <- numeric(n_repeats)

for (i in 1:n_repeats) {
  samples_list_means[i] <- mean(sample(data, sample_size))
}

# 4. Mean and standard deviation of the sample means.
mean(samples_list_means)
sd(samples_list_means)

# 5. Compare the population mean and the mean of the sample means
mean(data)
mean(samples_list_means)

# 6. Compute the theoretical standard error and compare it with the
# standard deviation of the simulated sample means.
theoretical_se <- 12 / sqrt(sample_size)
theoretical_se
sd(samples_list_means)
