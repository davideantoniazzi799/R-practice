# ADVANCED 4

library(tidyverse)
library(nycflights13)

view(flights)
view(airlines)

# Flights data
flights <- flights %>%
  select(carrier, time_hour, arr_delay)

flights %>% head(10)

# Airlines data
airlines %>% head(10)

# Join
flights <- flights %>%
  left_join(airlines, by = "carrier")

flights %>% head(10)

# Filter
flights <- flights %>% filter(name %in% c(
  "American Airlines Inc.",
  "Delta Air Lines Inc.",
  "JetBlue Airways",
  "United Air Lines Inc."))

flights %>% head(10)

# Extract month
flights <- flights %>% 
  mutate(month=month(time_hour,
                     label = TRUE,
                     abbr = FALSE))

flights %>% head(10)

# Summarize
delay_monthly <- flights %>%
  group_by(name, month) %>%
  summarise(avg_arr_delay = mean(arr_delay, na.rm = TRUE))

delay_monthly %>% head(10)

# Color
delay_monthly <- delay_monthly %>%
  mutate(delay_color = ifelse(avg_arr_delay < 0, "darkgreen", "darkred"))

delay_monthly %>% head(10)

# Plot
delay_monthly %>%
  ggplot(aes(month, avg_arr_delay, fill = delay_color))+
  geom_col(alpha = 0.6) +
  facet_wrap(~name)+
  scale_fill_identity()+
  labs(title = "Arrival Delay per Month by Carrier (2013)",
       x = "",
       y = "Average Arrival Delay (minutes)")+
  theme_bw()+
  theme(axis.text = element_text(angle = 45,
                                 hjust = 1))


# Annotation
annotation_text <- data.frame(
  x = 8,
  y = 15,
  name = "American Airlines Inc.")

annotation_arrow <- data.frame(
  x=9.1,
  y=11,
  xend = 9,
  yend = 0.2,
  name = "American Airlines Inc.")

ggplot(delay_monthly, 
       aes(month, avg_arr_delay, 
           fill = delay_color))+
  geom_col(alpha = 0.6) +
  facet_wrap(~name)+
  scale_fill_identity()+
  labs(title = "Arrival Delay per Month by Carrier (2013)",
       x = "",
       y = "Average Arrival Delay (minutes)")+
  theme_bw()+
  theme(axis.text = element_text(angle = 45,
                                 hjust = 1))+
  geom_text(data=annotation_text,
            aes(x=x, y = y,
                label = "Good month\n to travel"),
                color="darkgreen",
                fontface = "bold",
                size = 3.5,
                inherit.aes = FALSE)+
  geom_curve(data=annotation_arrow,
             aes(x=x, y=y,
                 xend=xend,
                 yend=yend),
                 arrow=arrow(length=
                               unit(0.33, "cm")),
                 color="darkgreen",
                 curvature=-0.25,
                 linewidth = 1.2,
                 inherit.aes=FALSE)
