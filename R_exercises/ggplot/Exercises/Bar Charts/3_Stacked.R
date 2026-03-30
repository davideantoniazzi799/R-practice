# =========================================================
# Exercise 3 – Stacked Bar Chart (Composition)
# Dataset: diamonds
#
# Visual idea:
# Stacked bars showing composition of clarity within each cut.
#
# Sketch:
# - Each bar = one cut
# - Segments = clarity levels
# - Shows proportions visually
#
# Tasks:
# 1. Create a bar plot of cut.
# 2. Fill bars based on clarity.
# 3. Use position = "fill" to show proportions.
# 4. Apply a color palette (viridis or brewer).
# 5. Add labels and a descriptive title.
# =========================================================

library(tidyverse)
library(RColorBrewer)

display.brewer.all(colorblindFriendly = TRUE)

view(diamonds)

diamonds %>%
  ggplot(aes(cut))+
  geom_bar(aes(fill=clarity),
           position = "fill")+
  scale_fill_brewer(palette = "Dark2")+
  labs(title="Proportion of Diamonds by Cut and Clarity",
       x="Cut",
       y="",
       fill="Clarity",
       caption="Source: diamonds dataset")+
  theme_bw()+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        plot.caption = element_text(hjust = 1))
