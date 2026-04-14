# 1) EXPLORE
# 1.1) Variable exploration
# 1.2) With tidyverse
# 1.3) Another variable
# 2) CLEAN
# 2.1) Variable types
# 2.2) Factor variable
# 2.3) Check levels for a factor variable
# 2.4) Change levels for a factor variable
# 2.5) Select variables
# 2.6) Filter observations
# 2.7) Missing data
# 2.8) Duplicates
# 2.9) Recoding variables
# 3) MANIPULATE
# 3.1) Rename variable
# 3.2) Reorder variables
# 3.3) Change a variable type
# 3.4) Select variables to work with
# 3.5) Filter and arrange
# 3.6) Change observations (mutate)
# 3.7) Conditional changes (if_else)
# 3.8) Recode data and rename variable
# 3.9) Reshape the data from wide to long or long to wide
# 4) DESCRIBE
# 4.1) Spread, Centrality and Variance 
# 4.2) Summarise selected variables
# 4.3) Create a summary table
# 4.4) Creating contingency tables

# 5) Visualize
# 6) Analyse

library(tidyverse)
?starwars

#EXPLORE###########
# 1) Explore
dim(starwars) # dimension
str(starwars) # structure
glimpse(starwars) # cleaner structure
View(starwars)
head(starwars)
tail(starwars)

attach(starwars)

names(starwars) # names of variables
length(starwars) # number of variables

# 1.1) Variable exploration
class(hair_color)
length(hair_color)
unique(hair_color)
View(sort(table(hair_color), decreasing = TRUE))
barplot(sort(table(hair_color), decreasing = TRUE))

# 1.2) With tidyverse
starwars %>%
  select(hair_color) %>%
  count(hair_color) %>%
  arrange(desc(n)) %>%
  View()

View(starwars[is.na(hair_color),]) #which observations have NA

# 1.3) Another variable
class(height)
length(height)
summary(height)
boxplot(height)
hist(height)

#CLEAN####
# 2) Clean

# 2.1) Variable types
glimpse(starwars)
class(gender)
unique(gender)

# 2.2) Factor variable
starwars$gender <- as.factor(starwars$gender)
class(gender)

# 2.3) Check levels for a factor variable
levels(gender)

# 2.4) Change levels for a factor variable
starwars$gender <- factor((starwars$gender),
                           levels=c("masculine",
                                    "feminine"))
levels(starwars$gender)

# 2.5) Select variables
names(starwars)

starwars %>%
  select(name, height, ends_with("color")) %>%
  names()

# 2.6) Filter observations
unique(starwars$hair_color)

starwars %>%
  select(name, height, ends_with("color")) %>%
  filter(hair_color %in% c("blond", "brown") &
           height < 180)

# 2.7) Missing data
mean(starwars$height)
mean(starwars$height, na.rm = TRUE)

starwars %>%
  select(name, gender, hair_color, height)

starwars %>%
  select(name, gender, hair_color, height) %>%
  na.omit()

starwars %>%
  select(name, gender, hair_color, height) %>%
  filter(!complete.cases(.)) # get observations with NA

starwars %>%
  select(name, gender, hair_color, height) %>%
  filter(!complete.cases(.)) %>%
  drop_na(height)

starwars %>%
  select(name, gender, hair_color, height) %>%
  filter(!complete.cases(.)) %>%
  mutate(hair_color = replace_na(hair_color,"none"))

# 2.8) Duplicates
Names <- c("Peter", "John", "Andrew", "Peter")
Age <- c(22,33,44,22)

friends <- data.frame(Names, Age)

friends[!duplicated(friends),]

friends %>% distinct()

# 2.9) Recoding variables
starwars %>% select(name, gender)

starwars %>% 
  select(name, gender) %>%
  mutate(gender = recode(gender,
                         "masculine"=1,
                         "feminine"=2))


#MANIPULATE####
# 3) MANIPULATE
# 3.1) Rename variable
msleep %>% 
  rename("conserv"="conservation") %>%
  glimpse()

# 3.2) Reorder variables
msleep %>%
  select(vore,name,everything())

# 3.3) Change a variable type
msleep$vore <- as.factor(msleep$vore)
glimpse(msleep)

msleep %>%
  mutate(vore=as.character(vore))%>%
  glimpse()

# 3.4) Select variables to work with
msleep %>%
  select(2:4,
         awake,
         starts_with("sleep"),
         contains("wt")) %>%
  names()

# 3.5) Filter and arrange
msleep %>%
  filter((order=="Carnivora" |
            order == "Primates") &
           sleep_total > 8) %>%
  select(name, order, sleep_total) %>%
  arrange(-sleep_total) %>%
  View

msleep %>%
  filter(order %in% c("Carnivora", 
                      "Primates") &
           sleep_total > 8) %>%
  select(name, order, sleep_total) %>%
  arrange(order) %>%
  View

# 3.6) Change observations (mutate)
msleep %>%
  mutate(brainwt = brainwt * 1000) %>%
  View

msleep %>%
  mutate(brainwt_in_grams = brainwt*1000) %>%
  View()

# 3.7) Conditional changes (if_else)
# Logical vector based on a condition
msleep$brainwt > 0.01

size_of_brain <- msleep %>%
  select(name, brainwt) %>%
  drop_na(brainwt) %>%
  mutate(brain_size = if_else(brainwt > 0.01,
                              "large",
                              "small"))
size_of_brain

# 3.8) Recode data and rename variable
# Change observation of "large" and "small" into 1 and 2
size_of_brain %>%
  mutate(brain_size=recode(brain_size,
                           "large"=1,
                           "small"=2))

# 3.9) Reshape the data from wide to long or long to wide
library(gapminder)
View(gapminder)

data <- select(gapminder, country, year, lifeExp)
View(data)

wide_data <- data %>%
  pivot_wider(names_from = year, 
              values_from = lifeExp)
View(wide_data)

long_data <- wide_data %>%
  pivot_longer(2:13,
               names_to="year",
               values_to="lifeExp")
View(long_data)  
#DESCRIBE####
# 4) Describe
data()
View(msleep)
# 4.1) Spread, Centrality and Variance 
min(msleep$awake)
max(msleep$awake)
range(msleep$awake)
IQR(msleep$awake)
mean(msleep$awake)
median(msleep$awake)
var(msleep$awake)

# 4.2) Summarise selected variables
summary(msleep)
summary(msleep$sleep_total)

msleep %>%
  select(sleep_total, brainwt) %>%
  summary

# 4.3) Create a summary table
# For each category of "vore", 
# show the min, max, difference,
# and average "sleep_total" 
# and arrange data by the average
msleep %>%
  drop_na(vore) %>%
  group_by(vore) %>%
  summarise(Lower = min(sleep_total),
            Average = mean(sleep_total),
            Upper = max(sleep_total),
            Difference =
              max(sleep_total)-min(sleep_total)) %>%
  arrange(Average) %>%
  View()

# 4.4) Creating contingency tables
library(MASS)
attach(Cars93)

glimpse(Cars93)

#Examples
table(Origin)
table(AirBags, Origin)
addmargins(table(AirBags, Origin), 1) # total for each column
addmargins(table(AirBags, Origin), 2) # total for each row
addmargins(table(AirBags, Origin)) # total for each row and column

prop.table(table(AirBags, Origin), 2)*100 
# proportion table with final percentage for each column
round(prop.table(table(AirBags, Origin), 2)*100) #rounded

Cars93 %>%
  group_by(Origin, AirBags) %>%
  summarise(number = n()) %>%
  pivot_wider(names_from = Origin,
              values_from = number)

