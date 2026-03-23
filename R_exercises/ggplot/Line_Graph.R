library(tidyverse)

data()

View(Orange)

# Graphs with 2 numeric variables and 1 categorical variable


# Usually, the x-axis is the independent variable
# and the y-axis the dependent variable

# First example
Orange %>%
  filter(Tree != "2") %>%
  ggplot(aes(age, circumference))+
  geom_point()+
  geom_smooth()+
  facet_wrap(~Tree)+
  theme_bw()+
  labs(title="Tree age and circumference")

#facet_wrap creates a plot for each value of the categorical variable

# Second example
Orange %>%
  filter(Tree != "1" & Tree != "2") %>%
  ggplot(aes(age, circumference, colour = Tree))+
  geom_point(size=5, alpha = 0.3)+
  geom_line(size=1)+
  theme_minimal()+
  labs(title="Tree age and circumference")
