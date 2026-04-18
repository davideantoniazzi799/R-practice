# EFFECT MODIFIERS AND INTERACTION

# If the relatioship between as explanatory variable and
# the outcome variable changes due to the value of a third variable,
# that third variable is called "Effect Modifier" and there has been
# an "interaction"

library(tidyverse)

view(mtcars)

mtcars %>%
  lm(hwy ~ displ * drv, data = .)%>%
  summary()
