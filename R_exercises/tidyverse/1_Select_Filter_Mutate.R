# SELECT, FILTER, MUTATE

# SELECT allows to choose, select specific variables
# FILTER allows to manipulate, filter the dataset based on
# the value of a selected variable
# MUTATE allows to define a new variable in the dataset or
# to change an existing one

library(tidyverse)

data()

view(starwars)

starwars %>%
  select(gender, mass, height, species) %>%
  filter(species == "Human") %>%
  na.omit() %>%
  mutate(height = height/100) %>%
  mutate(BMI = mass/height^2) %>%
  group_by(gender) %>%
  summarise(Average_BMI=mean(BMI))

