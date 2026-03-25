# THEMES

# 1) No themes
# 2) bw theme
# 3) Classic theme
# 4) Dark theme
# 5) Light theme
# 6) Linedraw theme
# 7) Minimal theme
# 8) Void theme
# Customize themes:
# 9) Title, axes, ticks, panel and plot background
# EXAMPLE 1: TITLE
# EXAMPLE 2: AXIS TITLE
# EXAMPLE 3: AXIS TICKS TEXT
# EXAMPLE 4: AXIS LINE
# EXAMPLE 5: BOTH AXIS TICKS
# EXAMPLE 6: AXIS TEXT WITH 45° ANGLE
# 10) ASPECT RADIO
# 11) BACKGROUND + PLOT FRAME
# 12) PANEL BACKGROUND + PANEL FRAME
# 13) MAJOR AND MINOR GRID LINES

# Legend
# 1) No theme
# 2) LEGEND BOX: MARGIN, BACKGROUND, FRAME
# 3) LEGEND BOX: FILL COLOR
# 4) LEGEND KEY FILL
# 5) TITLE FONT, ELEMENT TEXT
# 6) POSITION + KEY FILL
# 7) POSITION INSIDE PLOT

# Facets
# 1) No theme
# 2) STRIPS COLOR AND TEXT
# 3) SPACE BETWEEN PANELS
# 4) MAJOR AND MINOR GRID LINES

# SET THE THEME AT THE BEGINNING


library(tidyverse)

# 1) No themes
p <- ggplot(mtcars, aes(wt, mpg))+
  geom_point()+
  ggtitle("Weight vs. MPG")+
  xlab("Weight (1000 lns)")+
  ylab("Miles per Gallon")

p

# 2) bw theme
p +
  ggtitle("bw")+
  theme_bw()

# 3) Classic theme
p +
  ggtitle("Classic")+
  theme_classic()

# 4) Dark theme
p +
  ggtitle("Dark")+
  theme_dark()

# 5) Light theme
p +
  ggtitle("Light")+
  theme_light()

# 6) Linedraw theme
p +
  ggtitle("linedraw")+
  theme_linedraw()

# 7) Minimal theme
p +
  ggtitle("minimal")+
  theme_minimal()

# 8) Void theme
p +
  ggtitle("void")+
  theme_void()

# 9) Title, axis, ticks, panel and plot backgroun
# EXAMPLE 1: TITLE
p+
  theme(plot.title=
          element_text(color="steelblue",
                       family="Comic Sans MS",
                       face="bold",
                       hjust = 0.5,
                       size=rel(2)))

# With plot.SOMETHING we focus on that something
# rel(2) means that the size is related to the other text
# in the plot. In this case it's 2 times bigger that the other text

# EXAMPLE 2: AXIS TITLE
p+
  theme(axis.title.x=
          element_text(color="red",
                       face="bold.italic",
                       size=16),
        axis.title.y = 
          element_text(face="bold.italic",
                       color="red",
                       size=16))

# EXAMPLE 3: AXIS TICKS TEXT
p+
  theme(axis.text.x=
          element_text(color="blue",
                       face="bold.italic",
                       size=22))

# EXAMPLE 4: AXIS LINE
p+
  theme(axis.line.x=
          element_line(color="steelblue",
                       linetype="dotted",
                       size=3),
        axis.line.y = 
          element_line(face="round",
                       color="salmon",
                       size=3))

# EXAMPLE 5: BOTH AXIS TICKS
# It is possible to specify x or y with .x/.y
p+
  theme(axis.ticks=
          element_line(color="hotpink",
                       size=3))

# EXAMPLE 6: AXIS TEXT WITH 45° ANGLE
starwars %>%
  filter(!is.na(homeworld),
         mass < 200) %>%
  ggplot(aes(x=homeworld, y=mass))+
  geom_boxplot()+
  theme_bw()+
  theme(axis.text.x = 
         element_text(angle = 45,
                                  hjust = 1))+
  labs(title="Mass Distribution by Homeworld in Star Wars",
       x="",
       y="Mass")
# with hjust = 1, the x label stops where the tick is

# 10) ASPECT RADIO
p+
  theme(aspect.ratio=1)
# represents the x-y ratio

# 11) BACKGROUND + PLOT FRAME
p+
  theme(plot.background =
          element_rect(fill = "lightblue",
                       color= "white",
                       size=5))
# size and color represents the frame
# fill is the color of the rectangle

# 12) PANEL BACKGROUND + PANEL FRAME
p+
  theme(panel.background =
          element_rect(fill = "lightyellow",
                       color= "lightblue",
                       size=5))

# 13) MAJOR AND MINOR GRID LINES
p+
  theme(panel.grid.major.x=
          element_line(size=3,
                       color="steelblue"),
        panel.grid.minor.y=
          element_line(color="darkblue"))


# LEGEND
# 1) No theme
p_legend<- ggplot(mtcars, 
                  aes(wt, mpg,
                      color=factor(cyl)))+
  geom_point()+
  labs(title="Weight vs. MPG by Cyl",
       x="Weight of cars",
       y="Miles per Gallon")
p_legend

# 2) LEGEND BOX: MARGIN, BACKGROUND, FRAME
p_legend+
  theme(legend.box.margin=margin(30,5,30,5),
        legend.box.background=
          element_rect(fill="lightblue",
                       color="black",
                       size=1))

# 3) LEGEND BOX: FILL COLOR
p_legend+
  theme(legend.background=
          element_rect(fill="lightyellow",
                       color="black",
                       size=0.5))

# 4) LEGEND KEY FILL
p_legend+
  theme(legend.background=
          element_rect(fill="lightyellow",
                       color="black",
                       size=0.8),
        legend.key = 
          element_rect(fill="lightyellow",
                       color = "black",
                       size = 0.2))

# 5) TITLE FONT, ELEMENT TEXT
p_legend+
  theme(legend.background=
          element_rect(fill="lightyellow",
                       color="black",
                       size=0.8),
        legend.key = 
          element_rect(fill="lightyellow",
                       color = "black",
                       size = 0.2),
        legend.key.size = unit(1,"cm"),
        legend.title = 
          element_text(face="bold.italic"),
        legend.text = 
          element_text(family="Comic Sans MS",
                       face ="bold",
                       color = "steelblue"))

# 6) POSITION + KEY FILL
p_legend +
  theme(legend.key = 
          element_rect(fill="white"),
        legend.position="top")

# 7) POSITION INSIDE PLOT
p_legend +
  theme(panel.background =
          element_rect(fill="white"),
        plot.background = 
          element_rect(fill="lightgrey"),
        legend.background = 
          element_rect(color="grey"),
        legend.position=c(0.9, 0.8))


# FACETS
# 1) No theme
p_facet <- ggplot(mtcars, aes(wt, mpg))+
  geom_point()+
  facet_wrap(~cyl)+
  ggtitle("Weight vs MPG by Cylinders")

p_facet

# 2) STRIPS COLOR AND TEXT
p_facet +
  theme(strip.background = 
          element_rect(fill="lightblue",
                       color="steelblue",
                       size=2),
        strip.text=
          element_text(size=14,
                       face="bold",
                       color="steelblue"))

# 3) SPACE BETWEEN PANELS
p_facet+
  theme(panel.spacing=
                unit(2,unit="lines"))

# 4) MAJOR AND MINOR GRID LINES
p_facet +
  theme(panel.grid.major=
          element_line(color="black",
                       size=0.5),
        panel.grid.minor = 
          element_line(color="steelblue",
                       size=0.3))


# SET THE THEME AT THE BEGINNING
theme_set(
  theme(plot.title=
          element_text(size=15,
                       face="bold",
                       family = "Comic Sans MS",
                       color="steelblue4",
                       hjust = 0.5),
        panel.background = 
          element_rect(fill="white"),
        plot.background=
          element_rect(fill="lightsteelblue2"))
  
)