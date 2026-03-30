# =========================================================
# Exercise 5 – Highlighting a Category
# Dataset: mpg (from ggplot2)
#
# Visual idea:
# Bar chart where one category is highlighted,
# and the rest are muted.
#
# Sketch:
# - All bars gray
# - One category (e.g., "suv") in strong color
#
# Tasks:
# 1. Count number of cars per class.
# 2. Create a new variable to highlight one class (e.g., "suv").
# 3. Create a bar chart.
# 4. Color bars conditionally (highlight vs others).
# 5. Add title and clean theme.
# =========================================================

library(tidyverse)

view(mpg)

class_table <- as.data.frame(table(mpg$class))
class_table

class_table %>%
  rename(class=Var1) %>%
  arrange(desc(Freq)) %>%
  mutate(highlight = ifelse(class =="suv",
                            "highlighted",
                            "other")) %>%
  ggplot(aes(x=reorder(class, Freq),
             y=Freq,
             fill=highlight))+
  geom_col(width=0.8)+
  geom_text(aes(label=Freq),
            vjust=-0.5,
            size=3)+
  scale_fill_manual(values=c("highlighted" = "darkgreen",
                             "other"="grey"))+
  coord_cartesian(ylim = c(0, max(class_table$Freq) * 1.2)) +
  labs(title="Cars by Class",
       x="Class",
       y="Count",
       caption ="Data Source: mpg dataset")+
  theme_minimal()+
  theme(legend.position="none",
        plot.title = element_text(size=20, 
                                  face="bold", 
                                  hjust = 0.5),
        axis.text = element_text(size=10),
        axis.title = element_text(size=11))
  
  
  