# MULTIPLE REGRESSION
# 1) Adding variables
# 2) Adding a categorical variable with two categories
# 3) Adding a categorical variable with more than two categories
# 4) Selecting variables to include for the model

library(tidyverse)
library(MASS)
library(palmerpenguins)

view(trees)
# 1) Adding variables
lm(Volume ~ Girth + Height, data = trees) %>%
  summary()

# The singular coefficient are statistically significant,
# the same for the whole model

# 2) Adding a categorical variable with two categories
view(mpg)

# Example 1
lm(hwy ~ displ, data=mpg) %>%
  summary()

# Example 2
mpg %>%
  mutate(drv=fct_recode(drv,"2"="f", "2"="r"))%>%
  lm(hwy~displ+drv, data = .) %>%
  summary()


# 3) Adding a categorical variable with more than two categories
view(penguins)

lm(bill_length_mm ~ bill_depth_mm + species, data = penguins) %>%
  summary()


# 4) Selecting variables to include for the model
view(swiss)

lm(Fertility ~ ., data = swiss) %>%
  step(direction="backward", trace = 0) %>%
  summary()

# With direction backward we start from the model with
# all the variables and we go backwards
# With trace = 0 we say to not show every step of the 
# direction command
