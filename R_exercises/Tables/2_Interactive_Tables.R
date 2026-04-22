# DT package and interactive tables

# 1) Add filters in the table
# 2) Controlling page size and menu options
# 3) Custom Column Names
# 4) Adding Colour Bars to Cells
# 5) Using Extensions
# 6) Big example

install.packages("DT")
library(gapminder)
library(tidyverse)
library(DT)
library(dplyr)

view(mtcars)

datatable(mtcars)

# 1) Add filters in the table
mtcars %>%
  select(1:4) %>%
  datatable(filter = "top")

# 2) Controlling page size and menu options
mtcars %>%
  select(1:4) %>%
  datatable(options = list(
    pageLength = 5,
    lengthMenu = c(5, 10, 20, 50)
  ))

# 3) Custom Column Names
datatable(mtcars,
          colnames = c("Miles/Gallon", "Cylinders",
                       "Displacement", "Horsepower",
                       "Rear Axle Ratio", "Weight",
                       "1/4 Mile Team", "V/S", "Transmission",
                       "Gears", "Carburators"))

# 4) Adding Color Bars to Cells
mtcars %>%
  select(1:4) %>%
  datatable() %>%
  formatStyle(
    "mpg", # columns to format
    background = styleColorBar(range(mtcars$mpg), "lightblue"), # bar with range,
    backgroundSize = "100% 90%", # 100% of the width and 90% of the height of the cell
    backgroundRepeat = "no-repeat" # no background repeat
  )

# 5) Using Extensions
mtcars %>%
  select(1:4) %>%
  datatable(extensions = c("Buttons", "ColReorder",
                           "FixedHeader", "Scroller", "KeyTable"),
            options = list(
              dom = 'Bfrtip', # the order od the features on the page
              buttons = c("copy", "csv", "excel", "pdf", "print"), # to add export/copy buttons
              colReorder = TRUE, # lets users drag columns
              fixedHeader = TRUE, # keeps headers visible while scrolling
              scroller = TRUE, # improves performance with large table
              keys = TRUE # enables arrow-key navigation
            ))

# 6) Big example
gap_enhanced <- gapminder %>%
  filter(continent == "Europe") %>%
  mutate(
    year = as.factor(year),
    country_html = paste0("🌍", country)
  ) %>%
  mutate(country_html = as.factor(country_html)) %>% 
  select(country_html, year, lifeExp, pop, gdpPercap)

datatable(
  gap_enhanced,
  colnames = c("Country", "Year", "LifeExp", "Population", "GDP per capita"),
  escape = FALSE,
  extensions = c('Buttons', 'ColReorder', 'FixedHeader', 'Scroller', 'KeyTable'),
  options = list(
    dom = 'Bfrtip',
    buttons = c('copy', 'csv', 'excel', 'pdf', 'print'),
    colReorder = TRUE,
    fixedHeader = TRUE,
    scrollY = 400,
    scroller = TRUE,
    keys = TRUE,
    pageLength = 15,
    order = list(list(1, 'desc')),
    searchCols = list(NULL, list(search = "2007"), NULL, NULL, NULL)
  ),
  filter = 'top',
  rownames = FALSE,
  caption = '📊 Gapminder data for European countries — comparing life expectancy, population, and GDP per capita'
) %>%
  formatStyle(
    'lifeExp',
    background = styleColorBar(range(gap_enhanced$lifeExp), 'lightblue'),
    backgroundSize = '100% 90%',
    backgroundRepeat = 'no-repeat'
  ) %>%
  formatStyle(
    'pop',
    background = styleColorBar(range(gap_enhanced$pop), 'pink'),
    backgroundSize = '100% 90%',
    backgroundRepeat = 'no-repeat'
  ) %>%
  formatStyle(
    'gdpPercap',
    background = styleColorBar(range(gap_enhanced$gdpPercap), 'lightgreen'),
    backgroundSize = '100% 90%',
    backgroundRepeat = 'no-repeat'
  ) %>%
  formatRound(c('lifeExp', 'pop'), digits = c(1, 0)) %>%
  formatCurrency('gdpPercap', currency = '$', digits = 0)