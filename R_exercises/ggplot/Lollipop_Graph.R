# Lollipop graph

# Visualization for relationship between a categorical
# variable and a numeric variable

library(tidyverse)
library(forcats)

#We set the theme for every plot
theme_set(theme_bw() + 
            theme(panel.grid = element_blank()))
          
data()
view(msleep)

msleep %>%
  group_by(order) %>%
  summarise(mean_sleep = mean(sleep_total)) %>%
  mutate(order = fct_reorder(order, mean_sleep)) %>%
  ggplot(aes(x=order, y = mean_sleep))+
  geom_point(size = 3, colour = "orange")+
  geom_segment(aes(x=order, 
                   y=mean(msleep$sleep_total), 
                   xend = order, 
                   yend = mean_sleep), 
               colour = "grey")+
  geom_hline(yintercept = mean(msleep$sleep_total),
             colour = "grey",
             size = 1)+
  theme(axis.text.x = element_text(angle = 90))+
  labs(title = "Average sleep time of mammals by order",
       x = "",
       y = "Hours")
  

# GEOM_SEGMENT draws a line. For every line, we need to
# specify 4 points: x and y starting point, x and y end point
# In  this case:
# - starting x point = order;
# - starting y point = mean(msleep$sleep_total) which is the avg for all mammals;
# - ending x point = order;
# - ending y point = mean_sleep which is the avg for a specific mammal
  
# GEOM_HLINE draws an horizontal line. The first argument
# has to specify where the y intercept is(in this case the avg for all mammals)

# With axis.text.x = element_text(angle = 90) we set
# the labels with a vertical position