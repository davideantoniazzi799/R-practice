# Exercise 19 – Custom Colors and Themes
# Using the iris dataset:
# Tasks:
# 1. Create a scatter plot of Sepal.Length vs Petal.Length.
# 2. Color points by Species.
# 3. Manually set custom colors using scale_color_manual().
# 4. Increase point size and adjust transparency (alpha).
# 5. Apply a theme and customize the title appearance.

library(tidyverse)

view(iris)

iris %>%
  ggplot(aes(Sepal.Length, Petal.Length, 
             color=Species))+
  geom_point(size = 2, alpha = 0.5)+
  scale_color_manual(values =
                       c("setosa"="#263596",
                         "versicolor"= "#A81452",
                         "virginica"="#92A805"))+
  labs(title="Sepal vs. Petal Length by Species",
       x = "Sepal Length",
       y = "Petal Length",
       color = "Species:")+
  theme_bw()+
  theme(legend.position="bottom",
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
