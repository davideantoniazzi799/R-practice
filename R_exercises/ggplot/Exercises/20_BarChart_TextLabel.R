# Exercise 20 – Combining Geoms (Bar + Text Labels)
# Using the built-in mtcars dataset:
# Tasks:
# 1. Create a bar plot showing the number of cars per cyl.
# 2. Add text labels showing the counts on top of each bar.
# 3. Fill bars by cyl.
# 4. Adjust the position of the text so it is clearly visible.
# 5. Add a title and axis labels.

library(tidyverse)

view(mtcars)

cylinders_table <- as.data.frame(table(mtcars$cyl))
cylinders_table 

cylinders_table %>%
  mutate(Var1=factor(Var1)) %>%
  ggplot(aes(Var1, Freq, fill = Var1))+
  geom_bar(stat = "identity")+
  geom_text(aes(label = Freq), 
            position = position_stack(vjust = 1.05))+
  scale_fill_manual(values =
                       c("4"="#F2EA57",
                         "6"= "#C28C0E",
                         "8"="#B01A07"))+
  labs(title="Number of Cars by Cylinders",
       x="N° Cylinders",
       y="Number of Cars",
       fill = "N° Cyl")+
  theme_bw()+
  theme(legend.position = "none",
        plot.title=
          element_text(size=18,
                       face="bold",
                       color = "steelblue",
                       hjust=0.5),
        axis.text=
          element_text(size=10,
                       color="black"),
        axis.title=
          element_text(size=12,
                       color="steelblue"))
  