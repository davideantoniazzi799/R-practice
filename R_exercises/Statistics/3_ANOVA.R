# ANOVA (Analysis of Variance)

# The anova tests if the means of three or more
# gropus are statistically different from each other.
# It uses variances by comparing them between groups
# to the variance within groups

# If the between-group variance is way larger that the within-group
# variace, there is evidence that at least one group mean differs
# from the others

library(tidyverse)
library(gapminder)

# Question:
# do the continents have different life expectancy 
# or are they all the same?


gapminder %>%
  filter(year == 2007) %>%
  aov(lifeExp ~ continent, data = .) %>%
  summary()

# the p-value is very very small.
# So there is a very low probability that, if it were the case
# that all the continents had the same life expectancy, our sample
# would end up with the differences that we see.
# This allows us to reject the null hypothesis




