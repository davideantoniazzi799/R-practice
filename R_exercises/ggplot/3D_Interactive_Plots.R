# 3D PLOTS AND INTERACTIVE PLOTS

# 1) Base plot
# 2) INTERACTIVE plot with ggplotly()
# 3) 3D Scatter Plot with interaction


library(tidyverse)
library(plotly) #very important

# 1) Base plot
p<- starwars %>%
  drop_na(height, mass, eye_color) %>%
  filter(mass < 250) %>%
  filter(eye_color %in% c("blue",
                          "brown",
                          "black",
                          "pink",
                          "red",
                          "orange")) %>%
  ggplot(aes(x=height,
             y=mass,
             color=eye_color))+
  geom_jitter(size=6,
              alpha=.5)+
  scale_color_manual(values=c("blue"="blue",
                              "brown"="brown",
                              "pink"="pink",
                              "black"="black",
                              "pink"="pink",
                              "red"="red",
                              "orange"="orange"))+
  theme_bw()+
  theme(legend.position = c(0.05, 0.98),
        legend.justification = c("left","top"))+
  labs(title="Height, mass and eye color",
       x="Height",
       y="Mass",
       color="Eye Color")

p

# 2) INTERACTIVE plot with ggplotly()
ggplotly(p)

# 3) 3D Scatter Plot with interaction
trees %>%
  plot_ly(x=~Girth,
          y=~Height,
          z=~Volume)

plot_ly(z=volcano, type="surface")
