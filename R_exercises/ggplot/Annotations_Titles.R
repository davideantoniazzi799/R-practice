# ANNOTATIONS AND TITLES

install.packages("ggplot2")
library(tidyverse)

view(mtcars)

mtcars %>%
  ggplot(aes(wt, 
             mpg, 
             color = factor(gear)))+
  geom_point(size = 3, alpha = 0.6)+
  labs(title = "Weight vs Miles per Gallon",
       x="Weight",
       y="Miles per Gallon",
       color= "Gears")+
  theme_bw()+
  theme(plot.title=
          element_text(size=18,
                       face="bold",
                       color = "steelblue",
                       hjust=0.5),
        axis.text=
          element_text(size=10,
                       color="grey",
                       face="bold"),
        axis.title=
          element_text(size=12,
                       color="steelblue"))+
  theme(legend.position=c(0.9,0.8))+
  annotate("text", x=4, y=30,
           label = "Notice the difference \n
           between cars with \n three and four gears",
           color = "black",
           face = "bold",
           size = 4)+
  geom_segment(x=4.5, y=27,
               xend=5, yend=17,
               arrow = arrow(length=unit(0.7, "cm")),
               color="darkred",
               size = 1.5)+
  geom_segment(x=3.4, y=30,
               xend=2.4, yend=30,
               arrow = arrow(length=unit(0.7, "cm")),
               color="darkgreen",
               size = 1.5)


# With THEME we tell R what to do with the labels
# PLOT_TITLE refers to the title and ELEMENT_TEXT specifies how to plot it
# hjuts is horizontal adjustment, with 0.5 is in the middle

# AXIS_TEXT refers to the tip marks of the axis (the small numbers)

# AXIS_TITLE refers to the title of the axis

# LEGEND_POSITION is set at 90% to the right and 80% at the top,
# so this set the position using a sort of cartesian method.
# If it is c(0,0) the legend is in the lower-left angle.
# With this concatenation, the legend will be inside the plot.
# If we write = "top-left" then the legend will be outside the plot.

# ANNOTATE creates text/label. 
# With x=4 and y=30 we say: "Start the annotation from the middle of those points"
# With the label we specify the text.

# GEOM_SEGMENT creates a line, where we set the
# starting point(x, y) and the ending point(xend, yend)
# with ARROW we draw the arrow
