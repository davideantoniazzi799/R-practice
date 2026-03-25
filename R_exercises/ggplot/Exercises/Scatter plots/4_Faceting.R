# =========================================================
# Exercise 4 – Faceting Scatter Plots
# Dataset: mtcars
#
# Visual idea:
# Multiple small plots (one per cylinder group)
#
# Tasks:
# 1. Create a scatter plot of wt vs mpg.
# 2. Color points by gear.
# 3. Use facet_wrap() to create one plot per cyl.
# 4. Add a title and axis labels.
# 5. Apply theme_bw() and adjust legend position.
# =========================================================

library(tidyverse)

view(mtcars)

mtcars %>%
  mutate(cyl=factor(cyl),
         gear=factor(gear))%>%
  ggplot(aes(wt, mpg, color=gear))+
  geom_point(size=2, alpha=0.7)+
  facet_wrap(~cyl, labeller = label_both)+
  labs(title="Car Weight vs Miles per Gallon by Cylinder",
       x="Weight",
       y="Miles per Gallon",
       color="Gear")+
  theme_bw()+
  theme(legend.position = "bottom",
        legend.background=
          element_rect(fill="white",
                       color="black",
                       size=0.5),
        plot.title=
          element_text(color="steelblue",
                       face="bold",
                       hjust = 0.5),
        panel.spacing=
          unit(1,unit="lines"))
