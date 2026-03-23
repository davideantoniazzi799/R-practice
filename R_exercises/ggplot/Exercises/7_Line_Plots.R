# Exercise 7 – Line Plots
# Using the built-in economics dataset (from ggplot2):
# Tasks:
# 1. Create a line plot of unemploy (number of unemployed) over date.
# 2. Add a title and axis labels.
# 3. Change the line color.
# 4. Add a second line for uempmed (median duration of unemployment).
# 5. Add a legend explaining the two lines.

library(tidyverse)

View(economics)
str(economics)

economics%>%
  ggplot(aes(date))+
  geom_line(aes(y=unemploy, colour="Unemployed"))+
  geom_line(aes(y=uempmed, colour = "Median Duration"))+
  scale_color_manual("Legend", 
                     values=c("Unemployed" = "red", 
                              "Median Duration" = "black"))+
  labs(title = "Monthly Unemployed Number over Time",
       x = "Year",
       y = "Unemployed")+
  theme_bw()
