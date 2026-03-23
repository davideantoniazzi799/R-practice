# Exercise 17 – Using Facet Wrap with Two Variables
# Using the mtcars dataset:
# Tasks:
# 1. Convert cyl and am (transmission) to factors.
# 2. Create a scatter plot of hp vs mpg.
# 3. Use facet_wrap() combining cyl and am.
# 4. Color points by am.
# 5. Add labels and a theme.

library(tidyverse)

view(mtcars)

mtcars %>%
  mutate(cyl = as.factor(cyl),
         am = as.factor(am))%>%
  ggplot(aes(hp, mpg, colour = am))+
  geom_point()+
  scale_color_manual(values =
                       c("0"="#D9C229",
                         "1"= "#AB1F09"))+
  facet_grid(cyl ~ am)+
  labs(title = "Horsepower vs. Miles per Gallon \nby N° Cylinders and Transmission",
       x = "Horsepower",
       y = "Miles per Gallon",
       color = "Transmission")+
  theme_bw()+
  theme(panel.border = element_rect(fill = "transparent",
                                    color = "black", 
                                    linewidth = 1))


# With facet_wrap
mtcars %>%
  mutate(cyl = factor(cyl),
         am = factor(am)) %>%
  ggplot(aes(x = hp, y = mpg, color = am)) +
  geom_point() +
  scale_color_manual(values = c("0" = "#D9C229",
                                "1" = "#AB1F09")) +
  facet_wrap(~ cyl + am) +
  labs(title = "Horsepower vs Miles per Gallon\nby Cylinders and Transmission",
    x = "Horsepower",
    y = "Miles per Gallon",
    color = "Transmission") +
  theme_bw() +
  theme(panel.border = 
          element_rect(fill = "transparent", 
                       color = "black", 
                       linewidth = 1))
