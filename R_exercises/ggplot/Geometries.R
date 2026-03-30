# GEOMETRIES

# 1) GEOM AREA
# 2) RASTER PLOTS

library(tidyverse)

# 1) GEOM AREA
ggplot(mpg, aes(x=displ))+
  geom_area(aes(y=hwy, fill="Highway"))+
  geom_area(aes(y=cty, fill="City"))+
  labs(title="Highway vs City driving",
       x="Engine Displacement (L)",
       y="Miles per Gallon",
       fill="")+
  theme_bw()

# 2) RASTER PLOTS
faithfuld %>%
  ggplot(aes(x=waiting,
             y=eruptions,
             fill=density))+
  geom_raster()+
  labs(title = "Old Faithful Geyser",
       x="Waiting time between erruptions",
       y="Duration of erruptions",
       fill="Density")+
  theme_bw()
