# gtExtras part 2

library(tidyverse)
library(RColorBrewer)
library(gtExtras)
library(gapminder)

# Base table
plot <- gapminder %>%
  rename(Country = country) %>%
  filter(continent=="Europe") %>%
  group_by(Country) %>%
  summarise(`GDP pc` = round(mean(gdpPercap)),
            `Pop size` = round(mean(pop)),
            `Life expectancy` = list(lifeExp)) %>%
  arrange(-`GDP pc`) %>%
  head(10) %>%
  gt() %>%
  gt_plt_dist(`Life expectancy`) %>%
  tab_header(title = "The GPD and Pop Size of Europe") %>%
  cols_align(align="left")

plot

# Themes
plot %>%
  gt_theme_538()

plot %>%
  gt_theme_dark()

plot %>%
  gt_theme_espn()

plot %>%
  gt_theme_excel()

plot %>%
  gt_theme_guardian()

plot %>%
  gt_theme_nytimes()

plot %>%
  gt_theme_pff()

plot <- plot %>% gt_theme_pff()

# Highlighting specific rows
plot %>%
  gt_highlight_rows(rows = Country %in% c("Iceland",
                                          "Belgium"),
                    fill = "lightpink")

# Creating bars for a specific column
plot %>%
  gt_plt_bar_pct(`GDP pc`,
                 fill = "steelblue",
                 height = 15,
                 width = 100)

# Set a palette color to the cells of a specific column
plot %>%
  gt_theme_pff() %>%
  gt_color_rows(column = `Pop size`,
                palette = "Pastel1") %>%
  gt_plt_bar_pct(`GDP pc`,
                 fill = "steelblue",
                 height = 15,
                 width = 120)
