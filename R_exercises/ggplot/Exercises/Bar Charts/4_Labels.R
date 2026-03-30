# =========================================================
# Exercise 4 – Bar Chart with Labels
# Dataset: mtcars
#
# Visual idea:
# Bar chart with counts and values displayed on top.
#
# Sketch:
# - Bars for number of cars per cylinder
# - Value labels above bars
# - Clean and minimal
#
# Tasks:
# 1. Count number of cars per cyl.
# 2. Convert cyl to factor.
# 3. Create a bar chart using geom_col().
# 4. Add text labels showing counts above bars.
# 5. Adjust text position and improve theme.
# =========================================================

library(tidyverse)

view(mtcars)

cyl_table <- as.data.frame(table(mtcars$cyl))
cyl_table 

cyl_table %>%
  rename(cyl=Var1)%>%
  mutate(cyl=factor(cyl)) %>%
  ggplot(aes(cyl, Freq, fill = cyl))+
  geom_col()+
  geom_text(aes(label = Freq), 
            vjust=-0.5)+
  scale_fill_manual(values =
                      c("4"="#F2EA57",
                        "6"= "#C28C0E",
                        "8"="#B01A07"))+
  labs(title="Number of Cars by Cylinders",
       x="Cylinders",
       y="Number of Cars",
       caption="Source: mtcars dataset")+
  ylim(0, max(cyl_table$Freq) * 1.2) +
  theme_bw()+
  theme(legend.position = "none",
        plot.title=
          element_text(size=18,
                       face="bold",
                       hjust=0.5),
        axis.text= element_text(size=10),
        axis.title= element_text(size=12),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())
  