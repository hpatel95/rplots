#The goal is to observe the evolution of one variable : age, throughout a time variable, year (annee).

#Load librairies
library (tidyverse)
library (ggplot2)
library(plotly)


#Static ggplot2 line plot

```
gline <- hal_data %>% 
  group_by (annee) %>% 
  summarise(moyenne_age = mean(age, na.rm = TRUE)) %>% #(na.rm Pas compter les NAs)
  ggplot( aes(x=annee, y=moyenne_age)) +
  geom_line(stat="identity")
```
  
#Interactive plotly line plot

```
pline <- hal_data %>% 
  group_by (annee) %>% 
  summarise(moyenne_age = mean(age, na.rm = TRUE)) %>% #(na.rm Pas compter les NAs)
  plot_ly(x = ~annee,
          y = ~moyenne_age,
          type = "scatter",
          mode = "lines")
```
