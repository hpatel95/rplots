#The lollipop visualisation is sometime easier to read than a basic barplot. 
#Here we are displaying the mean age for each year (annee)

#Load librairies
library (tidyverse)
library (ggplot2)
library(plotly)


#Lollipop plot

```
glollipop <- hal_data %>% 
  group_by (annee) %>% 
  summarise(moyenne_age = mean(age, na.rm = TRUE)) %>% #(na.rm Pas compter les NAs)
  ggplot(aes(x=annee, y=moyenne_age)) +
  geom_segment( aes(x=annee, xend=annee, y=0, yend=moyenne_age), color="skyblue") +
  geom_point( color="blue", size=4, alpha=0.6) +
  theme_light() +
  coord_flip() +
  theme(
    panel.grid.major.y = element_blank(),
    panel.border = element_blank(),
    axis.ticks.y = element_blank()
  )
```
