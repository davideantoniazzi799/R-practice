library(tidyverse) #install.packages("tidyverse")

#3 essential steps:
# 1) Load the data;
# 2) Mapping, which means the aesthetics part;
# 3) Geometric representation

data()
BOD #?BOD

ggplot(data = BOD,
       mapping = aes(x = Time,
                     y = demand)) +
  geom_point(size = 5) + 
  geom_line(colour = "red")

# with data I select the dataset
# aes stands for aesthetics
# usually x is the indipendent variable, y the dependent variable
# with + I kind of add and create layers to the plot

ggplot(BOD, aes(Time, demand))+
  geom_point(size = 3)+
  geom_line(colour = "red")



View(CO2)
names(CO2)

CO2 %>% 
  ggplot(aes(conc, uptake, 
             colour = Treatment)) +
  geom_point(size = 3, alpha = 0.5) +
  geom_smooth(method=lm, se = F) +
  facet_wrap(~Type) +
  labs(title = "Concentration of CO2") +
  theme_bw()

# I can pipe because I'm the tidyverse library
# I do not need to specify the dataset,
# ggplot already which one is.
# Here the points are coloured based on the Treatment
# And by typing it there, it is applied to every layer

# Alpha defines the transpirancy

# geo_smooth creates a smooth linear model over the points
# in geo_smooth we can define the method(=lm means linear model)
# and se stands for standard error(with F it doesn't appear)

# con facet_wrap we can create plots 
# for each value of the selected variable(Type in this case has 2 values)

# labs allows to add the labels and title

# theme allows to add a theme to the plot
# with theme_bw we mean black and white


CO2 %>% 
  ggplot(aes(Treatment, uptake)) +
  geom_boxplot() +
  geom_point(alpha = 0.5,
             aes(size=conc,
                 colour=Plant)) +
  facet_wrap(~Type) +
  coord_flip() +
  theme_bw()+
  labs(title = "Chilled vs Non-chilled")

# geom_boxplot plots boxplot for each value of the x variable

# here, the geom_point aes is applied to the points of only this layer

# coord_flip flips the plot to horizontal



View(mpg)
mpg %>%
  filter(cty < 25) %>%
  ggplot(aes(displ, cty)) +
  geom_point(aes(colour = drv,
                 size = trans),
             alpha = 0.5) +
  geom_smooth(method = lm) +
  facet_wrap(~year, nrow = 1)+
  labs(x="Engine size",
       y="MPG in the city",
       title="Fuel efficiency") +
  theme_bw()

# nrow allows to allign the plots in one row
