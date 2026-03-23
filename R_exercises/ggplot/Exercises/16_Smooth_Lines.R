# Exercise 16 – Adding Smooth Lines and Groups
# Using the mtcars dataset:
# Tasks:
# 1. Create a scatter plot of wt vs mpg.
# 2. Color the points by cyl (convert to factor).
# 3. Add a smoothing line (linear model) for each group.
# 4. Remove the confidence interval shading.
# 5. Add a title and axis labels.

library(tidyverse)

view(mtcars)

mtcars %>%
  mutate(cyl = as.factor(cyl)) %>%
  ggplot(aes(wt, mpg, color = cyl))+
  geom_point()+
  geom_smooth(method = "lm", se = FALSE)+
  scale_color_manual(values =
                       c("4"="#D9C229",
                         "6"= "#AB1F09",
                         "8"="#080200"))+
  labs(title = "Weight vs. Miles per Gallon by Cylinders",
       x = "Weight",
       y = "Miles per Gallon",
       color = "N° Cyl")+
  theme_bw()+
  theme(legend.position=c(0.9,0.8),
        plot.title=
          element_text(size=18,
                       face="bold",
                       color = "steelblue",
                       hjust=0.5),
        axis.text=
          element_text(size=10,
                       color="grey",
                       face="bold"),
        axis.title=
          element_text(size=12,
                       color="steelblue"))
