# Bar charts for TWO CATEGORICAL VARIABLES

# 1) Representations using different POSITION values
# 2) Representations using facet_wrap

library(tidyverse)

data()
View(starwars)

# 1) Representations using different POSITON values
starwars %>%
  filter(hair_color == "black" | 
           hair_color == "brown") %>%
  drop_na(sex) %>%
  ggplot(aes(hair_color, fill = sex))+
  geom_bar(position = "dodge", alpha = 0.5)+
  theme_bw()+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())+
  labs(title = "Gender and Hair Colour",
       x = "Hair Colour",
       y = "Number")

# the theme part removes the grid lines
# it is possible to see that, since we filled by sex,
# for every hair color we have two bars
# representing the gender
# with POSITION="dodge" we put the bars next to each other


starwars %>%
  filter(hair_color == "black" | 
           hair_color == "brown") %>%
  drop_na(sex) %>%
  ggplot(aes(hair_color, fill = sex))+
  geom_bar(position = "fill", alpha = 0.5)+
  theme_bw()+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())+
  labs(title = "Gender and Hair Colour",
       x = "Hair Colour",
       y = "Number")

# with POSITION="fill" it creates a proportion bar
# for each value of the categorical variable

starwars %>%
  filter(hair_color == "black" | 
           hair_color == "brown") %>%
  drop_na(sex) %>%
  ggplot(aes(hair_color, fill = sex))+
  geom_bar(alpha = 0.5)+
  theme_bw()+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())+
  labs(title = "Gender and Hair Colour",
       x = "Hair Colour",
       y = "Number")

# With no positions, it's a count bar



# 2) Representations using facet_wrap
starwars %>%
  filter(hair_color %in% c("black","brown")) %>%
  drop_na(sex) %>%
  ggplot(aes(sex))+
  geom_bar(aes(fill=sex), alpha = 0.5)+
  facet_wrap(~hair_color)+
  theme_bw()+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        legend.position = "None")+
  labs(title = "Gender and Hair Colour",
       x = "Hair Colour",
       y = "Number")