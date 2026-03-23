library(tidyverse)

data()
?msleep
View(msleep)

names(msleep)

# Usually, when we plot a single categorical variable
# in ggplot we get a BAR CHART and

# when we plot a singular numeric variable 
# we get a HISTOGRAM


#Single categorical + BAR CHART
msleep %>%
  drop_na(vore) %>% #vore represents what the animals eat
  ggplot(aes(vore))+
  geom_bar(fill = "#97B3C6")+ 
  #coord_flip()+
  theme_bw()+
  labs(x = "Vore",
       y = NULL, 
       title = "Number of observations per order")

# geom_bar defines that we want a bar chart
# coord_flip() flips the visualization, 
# good if there are many values for that variable

# Ordering the variables
msleep %>%
  drop_na(vore) %>%
  ggplot(aes(fct_infreq(vore)))+ 
  geom_bar(fill = "#97B3C6")+ 
  #coord_flip()+
  theme_bw()+
  labs(x = "Vore",
       y = NULL, 
       title = "Number of observations per order")

# with fct_infreq() we can order the values in the chart


# Single numeric + HISTOGRAM
msleep %>%
  ggplot(aes(awake))+
  geom_histogram(binwidth = 2, fill = "#97B3C6")+
  theme_bw()+
  labs(x="Total Sleep",
       y=NULL,
       title="Histogram of total sleep")

# binwith sets the bins for the observation:
# the first bin contains observations between 0-2(because we set 2),
# the second bin contains observations between 2-4(something similar),
# and so on.
# If the binwith is 1, than the range is 1
