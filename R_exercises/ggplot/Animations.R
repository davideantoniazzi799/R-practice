# ANIMATIONS

# 1) CREATING A GIF
# 2) CHANGE TITLE OF THE PLOT AT EVERY FRAME
# 3) CHANGE TITLE OF THE PLOT AT EVERY FRAME WITH FACETING
# 4) ANIMATED BAR PLOT

library(tidyverse)
library(gganimate) 
library(babynames) #to get the data
library(gapminder) # to get dots(?)
library(viridis) #for colors
library(RColorBrewer)
library(gifski)

# 1) CREATING A GIF
anim <- babynames %>%
  filter(name %in% c("James", "Paul", "Andrew", "John")) %>%
  filter(sex=="M") %>%
  ggplot(aes(year, n, 
             group = name, 
             color =name))+
  geom_line(linewidth = 1.5)+
  theme_bw()+
  scale_color_viridis(discrete = TRUE)+
  labs(title = "Popularity of American names in the previous years",
       x="",
       y="",
       color="Names")+
  theme(plot.title=
          element_text(size=10, 
                       color = "steelblue"))+
  transition_reveal(year)

# If we do not consider transition_reveal(year),
# we have a line graph.
# TRANSITION_REVEAL() creates the frames for the animation,
# based on a specified variable

anim_rendered <- animate(anim, renderer = gifski_renderer())

anim_save("Plots_output/Animations/smooth_animation.gif", 
          animation = anim_rendered)
# Save as a GIF


# 2) CHANGE TITLE OF THE PLOT AT EVERY FRAME
anim2 <- gapminder %>%
  ggplot(aes(gdpPercap,
             lifeExp,
             size = pop,
             color = continent))+
  geom_point()+
  scale_x_log10()+
  theme_bw()+
  labs(title="Year: {frame_time}",
       x="GDP per capita",
       y="Life Expectancy")+
  theme(plot.title=element_text(size=60,
                                hjust=0.5,
                                color="steelblue"))+
  transition_time(year)

# With title="Year: {frame_time}" and transition_time(year)
# we put the year of that specific frame in the title

anim2_rendered <- animate(anim2, renderer = gifski_renderer())

anim_save("Plots_output/Animations/smooth_animation2.gif", 
          animation = anim2_rendered)


# 3) CHANGE TITLE OF THE PLOT AT EVERY FRAME WITH FACETING
anim3 <- gapminder %>%
  filter(continent != "Oceania") %>%
  ggplot(aes(gdpPercap,
             lifeExp,
             size = pop,
             color = country))+
  geom_point(alpha = 0.7,
             show.legend = FALSE)+
  scale_color_manual(values=country_colors)+
  scale_size(range = c(2,12))+
  scale_x_log10()+
  facet_wrap(~continent)+ #facing here
  theme_bw()+
  labs(title="Year: {frame_time}",
       x="GDP per capita",
       y="Life Expectancy")+
  theme(plot.title=element_text(size=60,
                                hjust=0.5,
                                color="steelblue"))+
  transition_time(year)

anim3_rendered <- animate(anim3, renderer = gifski_renderer())

anim_save("Plots_output/Animations/smooth_animation3.gif", 
          animation = anim3_rendered)


# 4) ANIMATED BAR PLOT
anim4 <- ChickWeight %>%
  ggplot(aes(x=factor(Diet),
             weight,
             fill = Diet))+
  geom_bar(stat = "identity")+
  theme_bw()+
  scale_fill_brewer(palette = "Set2")+
  labs(title="Time: {frame_time}",
       x="Diet",
       y="Weight")+
  theme(plot.title=element_text(size=20,
                                color="steelblue"))+
  transition_time(Time)

anim4_rendered <- animate(anim4, renderer = gifski_renderer())

anim_save("Plots_output/Animations/smooth_animation4.gif", 
          animation = anim4_rendered)
