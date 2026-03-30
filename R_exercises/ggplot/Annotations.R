# ANNOTATIONS

# 1) Filtering dataset
# 2) Create the bar chart

library(tidyverse)
library(gapminder)

# 1) Filtering dataset
europe_lift <- gapminder %>%
  filter(continent=="Europe",
         year==2007)%>%
  arrange(desc(lifeExp))%>%
  mutate(highlight = ifelse(country =="Ireland",
                            "highlighted",
                            "normal"))

# 2) Create the bar chart
ggplot(europe_lift,
       aes(x=reorder(country, lifeExp),
           y=lifeExp,
           fill=highlight))+
  geom_col(width=0.8)+
  # Add values to each bar
  geom_text(aes(label=round(lifeExp,1)),
            vjust=-0.5,
            size=3)+
  # Custom colors: Ireland green, the others blue
  scale_fill_manual(values=c("highlighted" = "#196f3d",
                             "normal"="#6699CC"))+
  # Add annotation to the left with more extensive
  annotate("text",
           x=6,
           y=80,
           label="Life Expectancy\nin Ireland",
           size=5,
           color="#196f3d",
           fontface="bold")+
  # Add a curved arrow pointing to Ireland's bar
  annotate("curve",
           x=8.5,
           y=81,
           xend="Ireland",
           yend=79.5,
           arrow=arrow(length = unit(0.3, "cm")),
           color="#196f3d",
           size=1.2,
           curvature=-0.25)+
  # Formatting
  labs(title="Life Expectancy in European Countries (2007)",
       x="",
       y="Life Expectancy (Years)",
       caption ="Data Source: gapminder package")+
  theme_minimal()+
  theme(legend.position="none",
        plot.title = element_text(size=20, face="bold"),
        plot.subtitle = element_text(size=12, color="grey"),
        axis.text = element_text(size=10),
        axis.title = element_text(size=11),
        axis.text.x = element_text(size = 8, angle=45, hjust=1))+
  coord_cartesian(ylim = c(70, max(europe_lift$lifeExp)))
             