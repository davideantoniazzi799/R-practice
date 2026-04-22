# gtEXTRAS package

library(tidyverse)
library(gtExtras)
library(gt)

mpg %>%
  filter(year==2008) %>%
  group_by(class) %>%
  summarise(
    count=n(),
    avg_cty=mean(cty),
    avg_hwy=mean(hwy),
    efficiency_rating= case_when(
      mean(cty) >= 20 ~ "High",
      mean(cty) >= 15 ~ "Medium",
      TRUE ~ "Low"
    ),
    .groups = "drop"
  ) %>%
  arrange(desc(avg_cty)) %>%
  mutate(
    efficiency_icon = case_when(
      efficiency_rating == "High" ~ "\u25B2",
      efficiency_rating == "Medium" ~ "\u25A0",
      efficiency_rating == "Low" ~ "\u25BC"
    )
  ) %>%
  # Make the table into a gt output  
  
  gt() %>% # we could already have a table here
  cols_hide(columns = efficiency_rating) %>% # to hide specific columns
  tab_header(
    title = "2008 Vehicle Efficiency",
    subtitle = "Efficiency ratings shown with colored indicators"
  ) %>%
  fmt_number(columns = c(avg_cty, avg_hwy),
             decimals = 1) %>% # this is to format numbers for specific columns
  cols_label(count="Models",
             avg_cty="City MPG",
             avg_hwy="Highway MPG",
             efficiency_icon = "Efficiency") %>% # to change the label of specific columns
  cols_align(
    align = "center",
    columns = efficiency_icon
  ) %>% # to center align the efficiency icon column
  tab_footnote(
    footnote = "Color intensity represents relative performance within each column",
    locations = cells_column_labels(columns = c(avg_cty, avg_hwy))
  ) %>% # to add footnotes
  tab_footnote(
    footnote = "\u25B2 High (>= 20 MPG) | \u25A0 Medium (15-19 MPG) | \u25BC Low (< 15 MPG)",
    location = cells_column_labels(columns = efficiency_icon)
  ) %>%
  gt_theme_pff() %>%
  # Add color boxes
  gt_color_box(
    columns = avg_cty, # which variable
    domain = c(10,25), # apply the palette to range where R can find numbers
    palette = "viridis"
  ) %>%
  gt_color_box(
    columns = avg_hwy,
    domain = c(15, 35),
    palette = "viridis"
  ) %>%
  # Style the high efficiency icons (green triangles)
  tab_style( # to add some style do this things
    style = cell_text(
      color = "#28a745",
      size = px(20),
      weight = "bold"
    ),
    locations = cells_body( # we specify where to style
      columns = efficiency_icon,
      rows = efficiency_rating == "High")
    ) %>%
  # Style medium efficiency icons (orange triangles)
  tab_style(
    style = cell_text(
      color = "#ff9800",
      size = px(20),
      weight = "bold"
    ),
    locations = cells_body(
      columns = efficiency_icon,
      rows = efficiency_rating == "Medium")
    ) %>%
  # Style low efficiency icons (red triangles)
  tab_style(
    style = cell_text(
      color = "#dc3546",
      size = px(20),
      weight = "bold"
    ),
    locations = cells_body(
      columns = efficiency_icon,
      rows = efficiency_rating == "Low")
    )















