# CHI SQUARED TEST

library(tidyverse)
view(Titanic)

# Question:
# did the class ticket that was bought matter in the
# likelihood of surviving the sinking of the titanic?
# In other words:
# did the chance to survive depend on the class of tickets?

# Our null hypothesis is there was no relationship between
# the class ticket and chances of surviving

Titanic %>%
  as_tibble() %>%
  uncount(n) %>% # creates a new row for each frequency value
  select(Class, Survived) %>%
  filter(Class != "Crew") %>%
  table() %>%
  chisq.test()

# The p-value is very very small, so we can reject the null hypothesis