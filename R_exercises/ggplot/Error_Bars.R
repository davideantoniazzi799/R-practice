# How to add ERROR BARS to the graph

library(tidyverse)

# 1) WITH POINTS
# 2) WITH BARS

View(ToothGrowth)

theme_set(theme_bw()+
            theme(panel.grid.major = element_blank()))
#we set the theme, by doing this initially it will apply
#to all the foloowing graphs

# 1) WITH POINTS
ToothGrowth %>%
  filter(supp == "VC") %>%
  mutate(dose = as.factor(dose)) %>%
  group_by(dose) %>%
  summarise(mean_len = mean(len),
            sd_len = sd(len)) %>%
  ggplot(aes(dose, mean_len))+
  geom_point(size=3, colour="blue")+
  geom_errorbar(aes(x=dose, 
                    ymin = mean_len - sd_len,
                    ymax = mean_len + sd_len,
                    width = 0.05))+
  labs(title = "Average tooth growth for VC supplement group")+
  xlab("Dose")+
  ylab("Average tooth growth")
       
# We can plot the error bars thorugh the geom_errorbar function
# The function takes the x-axes with the associated variable
# then we define the length of the error bar by
# defining ymin and ymax


# 2) WITH BARS
ToothGrowth %>%
  filter(supp == "VC") %>%
  mutate(dose = as.factor(dose)) %>%
  group_by(dose) %>%
  summarise(mean_len = mean(len),
            sd_len = sd(len)) %>%
  ggplot(aes(dose, mean_len))+
  geom_bar(stat="identity", 
           fill="skyblue", 
           alpha = 0.7)+
  geom_errorbar(aes(x=dose, 
                    ymin = mean_len - sd_len,
                    ymax = mean_len + sd_len,
                    width = 0.05))+
  labs(title = "Average tooth growth for VC supplement group")+
  xlab("Dose")+
  ylab("Average tooth growth")
