# =========================================================
# Exercise 7 – Adding Trend + Highlighting Outliers
# Dataset: mtcars
#
# Visual idea:
# Scatter plot with a regression line and one or two
# extreme points clearly labeled.
#
# Sketch:
# - Points in one color
# - One regression line
# - Outliers labeled (e.g., highest mpg or lowest mpg)
#
# Tasks:
# 1. Create a scatter plot of hp vs mpg.
# 2. Add a linear regression line (no confidence interval).
# 3. Identify the car with the highest mpg and lowest mpg.
# 4. Label only those cars using ggrepel.
# 5. Use a clean theme and centered title.
# =========================================================

library(tidyverse)
library(ggrepel)

view(mtcars)

mtcars %>%
  mutate(car = rownames(mtcars),
         max_min_mpg = ifelse(mpg == max(mpg),"Max mpg",
                              ifelse(mpg == min(mpg), "Min mpg", "Other")))%>%
  ggplot(aes(hp, mpg))+
  geom_point(aes(color = max_min_mpg), size = 2)+
  geom_smooth(method = "lm", se = FALSE)+
  geom_text_repel(
    data = . %>% filter(max_min_mpg != "Other"),
    aes(label = car),
    size = 3)+
  scale_color_manual(values = c("Max mpg" = "red",
                                "Min mpg" = "darkgreen",
                                "Other" = "gray"))+
  labs(title="Car Horsepower vs Miles Per Gallon",
       x="Horsepower",
       y="Miles per Gallon",
       color="")+
  theme_bw()+
  theme(plot.title=element_text(hjust = 0.5))
