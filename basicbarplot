#The goal here is to compare two variables : Year and age with bar plots

#Load libraries

```
library (tidyverse)
library (ggplot2)
library(plotly)
```

##Create plot

#Basic static barplot

```
gbar <- hal_data %>% 
  group_by (year) %>% 
  summarise(mmoyenne_annee = mean(age, na.rm = TRUE)) %>% #(na.rm Pas compter les NAs)
  ggplot( aes(x=annee, y=moyenne_age)) +
  geom_bar(stat="identity")
```

#Static barplot with axis flipped and labels

```
gbarrec <- hal_data %>% 
  group_by (annee) %>% 
  summarise(moyenne_age = mean(age, na.rm = TRUE)) %>% #(na.rm Pas compter les NAs)
  ggplot( aes(x=annee, y=moyenne_age)) + 
  geom_bar(stat="identity" , fill="#2A03C5" , alpha = 0.8) + #fill = coloration de l'intérieur de la barre, alpha pour la transparence
  coord_flip() + #Inverser les axes
  labs(title = "Moyenne d'âge par année") + #titre du graph
  labs (y = "Moyenne d'âge") + #titre de l'axe y
  labs (x = "Année") #titre de l'axe x
```

#Basic interactive barplot

```
pbar <- hal_data %>% 
  group_by (annee) %>% 
  summarise(moyenne_age = mean(age, na.rm = TRUE)) %>% #(na.rm Pas compter les NAs)
  plot_ly(x = ~annee,
          y = ~moyenne_age,
          name = "Moyenne age/annee",
          type = "bar")
```
