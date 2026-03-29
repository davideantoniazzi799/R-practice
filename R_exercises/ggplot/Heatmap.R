# HEATMAPS

# 1) Dataframe in pivot long format
# 2) Heatmap plot

library(tidyverse)

view(volcano)

# 1) Dataframe in pivot long format
volcano_df <- as.data.frame(volcano) %>%
  mutate(X=row_number()) %>%
  pivot_longer(
    cols=starts_with("V"),
    names_to="Y",
    names_prefix = "V",
    values_to="Elevation"
  ) %>%
  mutate(
    X=as.numeric(X),
    Y=as.numeric(Y)
  )

view(volcano_df)

# 2) Heatmap plot
ggplot(volcano_df, aes(x=Y, y=X, fill=Elevation))+
  geom_tile()+ # KEY function for a heatmap
  scale_fill_viridis_c(
    option="magma",
    name="Elavation\n(meters)")+
  labs(
    title="Maunga Whau Volcano Topography",
    x="East-West Grid Line",
    y="North-South Grid Line")+
  theme_minimal()+
  theme(panel.grid = element_blank())+
  coord_fixed()
