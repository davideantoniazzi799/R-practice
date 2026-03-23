# Exercise 18 – Reordering Factors in Plots
# Using the built-in ToothGrowth dataset:
# Tasks:
# 1. Create a boxplot of len (tooth length) by dose.
# 2. Convert dose to a factor.
# 3. Reorder dose levels in increasing order.
# 4. Fill boxes by supp (supplement type).
# 5. Add labels and a theme.

library(tidyverse)

view(ToothGrowth)

ToothGrowth %>% 
  mutate(dose = factor(dose, levels = c(0.5, 1, 2))) %>%
  ggplot(aes(dose, len, fill = supp))+
  geom_boxplot()+
  labs(title = "Tooth Length by Dose and Supplement Type",
       x = " Dose",
       y= "Length",
       fill = "Suppl. Type")+
  theme_bw()+
  theme(legend.position=c(0.85, 0.2),
        legend.box.background = element_rect(color="black", linewidth=1),
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

