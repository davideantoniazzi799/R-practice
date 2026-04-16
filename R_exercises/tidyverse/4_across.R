# ACROSS() FUNCTION

library(tidyverse)

glimpse(mpg)

mpg %>%
  mutate(across(where(is.character),
                as.factor)) %>%
  glimpse()


mpg %>%
  group_by(manufacturer) %>%
  summarise(across(where(is.numeric)
                         & contains("y"),
                         mean))
            