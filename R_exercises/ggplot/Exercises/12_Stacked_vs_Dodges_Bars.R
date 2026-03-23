# Exercise 12 – Position Adjustments (Stacked vs Dodged Bars)
# Using the built-in diamonds dataset (from ggplot2):
# Tasks:
# 1. Create a bar plot showing the count of diamonds by cut.
# 2. Fill bars based on clarity.
# 3. Create a stacked bar plot (default).
# 4. Create a dodged bar plot using position = "dodge".
# 5. Add title and axis labels.

library(tidyverse)

view(diamonds)

diamonds %>%
  ggplot(aes(cut, fill = clarity))+
  geom_bar()+
  labs(x="Type of Cut",
       y ="Quantity",
       title = "Total Diamonds by Cut",
       fill = "Clarity")+
  theme_bw()

# STACKED BAR PLOT
diamonds %>%
  ggplot(aes(x=cut, fill = clarity))+
  geom_bar(position = "stack")+
  labs(x="Type of Cut",
       y ="Quantity",
       title = "Total Diamonds by Cut",
       fill = "Clarity")+
  theme_bw()


# DODGE BAR PLOT
diamonds %>%
  ggplot(aes(x=cut, fill = clarity))+
  geom_bar(position = "dodge")+
  labs(x="Type of Cut",
       y ="Quantity",
       title = "Total Diamonds by Cut",
       fill = "Clarity")+
  theme_bw()
