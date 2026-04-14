# TEXT AND CHARACTER VARIABLES
# 1) str_c()
# 2) str_detect()
# 3) str_sub()
# 4) str_to_upper()

library(tidyverse)

view(iris)

# 1) str_c()
iris %>%
  select(Species, Sepal.Length) %>%
  mutate(Description =
           str_c(Species,
                 ": ",
                 Sepal.Length,
                 " cm")) %>%
  head(10)

# We create a new string variable called Description
# using the function str_c()
# The function takes some things and puts them together
# In this case, 
# takes the value from the variable Species
# then puts ": ", 
# then takes the value from the variable Sepal.Length
# then puts " cm"

# 2) str_detect()
view(mtcars)
mtcars %>%
  rownames_to_column(var="model")%>%
  mutate(has_M=str_detect(model, "M"))%>%
  filter(has_M==TRUE)%>%
  select(model, mpg, cyl, disp)%>%
  head(10)

# str_detect() creates a logical vector made out of
# the observations that fulfill the criteria
# In this case, if the observation in the variable model
# starts with "M", its value in the logical vector is TRUE

# 3) str_sub()
mtcars %>%
  rownames_to_column(var="model")%>%
  mutate('short name'=str_sub(model, 1, 3))%>%
  select(model, 'short name', mpg, cyl, disp)%>%
  head(10)

# str_sub() can extract out some text from a specified text
# In this case, we extract text from the variable model
# starting from the first characther (1) up to the third (3)

# 4) str_to_upper()
starwars %>%
  select(name, species) %>%
  mutate(species = str_to_upper(species)) %>%
  head(10)

# str_to_upper() rewrites a character variable in uppercase