library(gtExtras)
library(tidyverse)

# Create summary of the data 
iris %>%
  gt_plt_summary()

# Insert icons ad graphics into tables
mtcars %>%
  group_by(cyl) %>%
  summarize(Median = round(median(mpg), 1),
            Mean = round(mean(mpg), 1),
            Distribution = list(mpg)) %>%
  gt() %>%
  gt_plt_dist(Distribution) %>%
  gt_theme_guardian() %>%
  tab_header(title = "Miles per gallon statistics by car cylinder number")
  