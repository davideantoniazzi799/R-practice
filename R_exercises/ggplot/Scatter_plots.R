library(tidyverse)

data()

# First example
?mpg
names(mpg)
View(mpg)

mpg %>%
  filter(hwy < 35) %>%
  ggplot(aes(x = displ, 
             y= hwy, 
             colour = drv))+ #this applies to every layer
  geom_point()+
  geom_smooth(method = lm, se = F)+
  labs(x = "Engine Size", 
       y = "MPG on the Highway", 
       title = "Fuel efficiency")+
  theme_minimal()+
  ggsave("Plots_output/MPH_hwy.png", bg = "white")

mpg %>%
  filter(hwy < 35) %>%
  ggplot(aes(x = displ, 
             y= hwy))+
  geom_point(aes(colour = drv))+ #difference from above
  geom_smooth()+
  labs(x = "Engine Size", 
       y = "MPG on the Highway", 
       title = "Fuel efficiency")+
  theme_minimal()+
  ggsave("Plots_output/MPH_hwy_2.png", bg = "white")


# Another example
# Focus on MULTIPLE NUMERIC VARIABLES
names(msleep)
View(msleep)

msleep %>%
  filter(bodywt < 2) %>%
  ggplot(aes(bodywt, brainwt))+
  geom_point(aes(color = sleep_total, 
                 size = awake))+ #we use two variables here
  geom_smooth(method = lm, 
              se = F)+
  labs(x="Body Weight", 
       y="Brain Weight", 
       title="Brain and Body Weight") +
  theme_minimal()

