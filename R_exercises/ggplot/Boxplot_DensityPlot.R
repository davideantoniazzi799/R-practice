library(tidyverse)

# Visualize a categorical and numeric variable together

# BOXPLOT
msleep %>%
  drop_na(vore) %>%
  ggplot(aes(vore, sleep_total)) +
  geom_boxplot()+
  coord_flip()+
  theme_bw()

# geom_boxplot created the boxplot where we can see
# how the numeric variable distributes based on the different categories


# DENSITY PLOT
# First example
msleep %>%
  drop_na(vore) %>%
  ggplot(aes(sleep_total)) +
  geom_density()+
  facet_wrap(~vore)+
  theme_bw()

# geom_density created a density plot

# Second example without face wrap
msleep %>%
  drop_na(vore) %>%
  #filter(vore == "herbi" | vore == "omni") %>%
  #filter(vore %in% c("carni", "omni")) %>%
  ggplot(aes(sleep_total, fill = vore)) +
  geom_density(alpha = 0.2)+
  theme_bw()

# the fill fills the underlaying space 
# based on the different values of the categorical value