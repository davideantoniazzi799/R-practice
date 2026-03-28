# ADVANCED 3

# LOLLIPOP GRAPH

library(tidyverse)
library(forcats)

view(msleep)

# Reordering the data based on the average sleeping time
msleep %>%
  group_by(order) %>%
  summarise(mean_sleep = mean(sleep_total)) %>%
  mutate(order = fct_reorder(order, mean_sleep)) %>%
  
  # Base ggplot
  ggplot(aes(order, mean_sleep))+
  
  # Add labels to axis
  labs(title="Sleep time of mammals",
       x="",
       y="Hours")+
  theme(axis.text.x = element_text(angle = 45,
                                   vjust=1,
                                   hjust=1),
        axis.text.y=element_text(face="bold"),
        plot.title=element_text(hjust=0.5,
                                size=25,
                                face="bold"))+
  
  # Set canvas and label colors
  theme(
    axis.text.x = element_text(color = "lightblue"),
    axis.text.y = element_text(color="lightblue"),
    axis.title.y = element_text(color = "lightblue"),
    plot.title = element_text(color="lightblue"),
    axis.line = element_line(color = "lightblue"),
    axis.ticks = element_line(color="lightblue"),
    panel.background = element_rect(fill = "black"),
    plot.background = element_rect(fill="black"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    legend.position = "none"
  ) + 
  
  # Add horizontal line for overall average sleep time
  geom_hline(yintercept = mean(msleep$sleep_total),
             color = "lightblue",
             size = 1)+
  
  # Add segments from the overall average to each group's 
  geom_segment(aes(x=order,
                   y=mean(msleep$sleep_total),
                   xend=order,
                   yend=mean_sleep),
               color="lightblue") +
  
  # Add points for each group's mean sleep time, colored
  geom_point(aes(color=mean_sleep),
             size=5)+
  scale_color_gradient(low="hotpink",
                       high="yellow") +
  
  # Add an annotation text in the top left quadrant
  annotate("text",
           x=4,
           y=max(msleep$sleep_total)-4,
           label = "Average sleep\nfor all mammals",
           color="#f4cccc",
           size =4,
           fontface="bold",
           hjust=0)+
  
  # Add a curved arrow pointing to the horizontal line
  geom_curve(aes(x=3.7,
                 y=max(msleep$sleep_total)-5,
                 xend=1.5,
                 yend=mean(msleep$sleep_total)),
             color="#f4cccc",
             curvature = 0.5,
             linewidth=0.5,
             arrow=arrow(length=unit(0.07,
                                     "npc"),
                         type="open"))
