# =========================================================
# Exercise 2 – Grouped Bar Chart (Comparison)
# Dataset: ToothGrowth
#
# Visual idea:
# Side-by-side bars comparing supplement types across doses.
#
# Sketch:
# - X-axis: dose
# - Bars grouped by supplement (OJ vs VC)
# - Different colors for each group
#
# Tasks:
# 1. Convert dose to a factor.
# 2. Compute mean tooth length per dose and supplement.
# 3. Create a grouped (dodged) bar chart.
# 4. Use different colors for supplement type.
# 5. Add title, labels, and legend title.
# =========================================================

library(tidyverse)

view(ToothGrowth)

ToothGrowth %>%
  group_by(dose, supp) %>%
  summarise(mean_toothlength = mean(len), .groups = "drop") %>%
  mutate(dose=factor(dose)) %>%
  ggplot(aes(dose, mean_toothlength, fill = supp))+
  geom_bar(stat = "identity",
           position = "dodge", 
           alpha=0.8)+
  scale_fill_manual(values=c("OJ" = "#F0C505",
                             "VC"="#BD1A00"))+
  theme_bw()+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        plot.title = element_text(size=20, 
                                  face="bold"),
        axis.text = element_text(size=10),
        axis.title = element_text(size=11),
        legend.position = "bottom")+
  labs(title="Average Tooth Length by Dose and Supplement",
       x="Dose",
       y="Mean Tooth Length",
       fill="Supplement Type",
       caption = "Source: ToothGrowth dataset")
