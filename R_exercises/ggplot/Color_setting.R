# Using color EFFECTIVELY

# 1) Using RColorBrewer
# 2) Color specification
# 3) Set colors manually
# 4) Set colors using hex(?) code

library(tidyverse)
library(RColorBrewer) #install.packages("RColorBrewer")

#Set of colors
display.brewer.all(colorblindFriendly = TRUE)

view(mpg)

# Example 1
mpg %>%
  ggplot(aes(displ, hwy, color = drv))+
  geom_jitter(size = 5)+
  scale_color_brewer(palette = "Set2")+
  theme_minimal()

# Color palette from the uploaded package
# In case we would need to fill the space with a color,
# then we would say fill = drv and then set the palette


# Example 2
mpg %>%
  ggplot(aes(displ, hwy))+
  geom_jitter(color = "steelblue", size = 5)+
  theme_minimal()

# Here the color is specificied


# Example 3
mpg %>%
  ggplot(aes(displ, hwy, color = drv))+
  geom_jitter(size = 5)+
  scale_color_manual(values =
                       c("4"="darkblue",
                         "f"= "darkred",
                         "r"="darkgreen"))+
  theme_minimal()

# SCALE_COLOR_MANUAL manually sets the colors 



# Example 4
mpg %>%
  ggplot(aes(displ, hwy, color = drv))+
  geom_jitter(size = 5)+
  scale_color_manual(values =
                       c("4"="#719AC9",
                         "f"= "#75B99C",
                         "r"="#C98D71"))+
  theme_minimal()
