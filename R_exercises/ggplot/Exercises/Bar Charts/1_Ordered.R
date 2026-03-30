# =========================================================
# Exercise 1 – Ordered Bar Chart (Top Categories)
# Dataset: diamonds
#
# Visual idea:
# A clean horizontal bar chart showing the most frequent cuts,
# ordered from highest to lowest.
#
# Sketch:
# - Bars sorted descending
# - Horizontal layout
# - Single clean color
#
# Tasks:
# 1. Count the number of diamonds by cut.
# 2. Reorder the bars from highest to lowest count.
# 3. Create a horizontal bar chart.
# 4. Use a single clean color.
# 5. Add a clear title and axis labels.
# =========================================================

library(tidyverse)

view(diamonds)

diamonds %>%
  ggplot(aes(fct_infreq(cut)))+
  geom_bar(fill="#C21363")+
  coord_flip()+
  theme_bw()+
  labs(title = "Number of Diamonds by Cut",
       x="Cut",
       y=NULL,
       caption = "Data Source: diamonds dataset")+
  theme(plot.title = element_text(hjust = 0.5,
                                  size = 14,
                                  face="bold",
                                  color = "steelblue"))
