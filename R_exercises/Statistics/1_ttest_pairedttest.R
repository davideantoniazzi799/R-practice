# T-TEST AND PAIRED T-TEST

# 1) INDIPENDENT T-TEST
# 2) PAIRED T-TEST

library(tidyverse)
library(palmerpenguins)

View(penguins)

# Question: 
# is the average length(or average of a different numeric varible)
# the same for two categorical values of the same variable?

# In other words, if there is a difference in the average,
# is it statistically significant? Or might it due to chance?


summary(penguins) #check NA


# 1) INDIPENDENT T-TEST
# Let's compare TWO values for the variable species
penguins %>%
  filter(species %in% c("Adelie", "Chinstrap")) %>%
  drop_na(bill_length_mm) %>%
  t.test(bill_length_mm ~ species, data = .)


# in t.test():
# - 1st argument: the applied numeric variable(bill_length_mm)
# - 2nd argument: the categorical variable from which we get the values to compare(species)
# - 3rd argument: specification from which dataset the data is (in this case,
#                 data=. because we piped in the functions)


# We usually start with a null hypothesis which assumed that averages of the
# two observations are equal or no difference.
# The p-value represents the probability or the chances that a sample
# represents such difference or inequility.
# In this case, the p-value is really really small. So, if H0 was true,
# it is very unluckily that we get a sample represents the difference
# Therefore, we can have confidence that the difference that we see is
# statistically significant
# As we can see, our example has a confidence interval that does not include 0


# 2) PAIRED T-TEST
# The difference is that we compare the averages of the same group measured twice

view(sleep)

# Important for paired t-test
sleep_wide <-sleep %>%
  pivot_wider(names_from = group,
              values_from = extra,
              names_prefix = "drug_")

View(sleep_wide)

t.test(sleep_wide$drug_1, sleep_wide$drug_2,
       paired = TRUE)

# the p-value in our test is pretty small,
# therefore we can reject the null hypothesis
# so the difference is statistically significant



