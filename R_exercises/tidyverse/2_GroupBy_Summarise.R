# GROUP BY AND SUMMARISE

library(tidyverse)

view(msleep)
names(msleep)

msleep %>%
  drop_na(sleep_rem, vore) %>%
  group_by(vore) %>%
  summarise('Average total sleep' =
              mean(sleep_total),
            'Maximun rem sleep' = 
              max(sleep_rem)) %>%
  view
