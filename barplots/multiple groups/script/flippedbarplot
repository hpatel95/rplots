#The aim here is to compare the evolution (delta/difference) of one variable : desflurane in time : year (2018-2010) for each of one variable : unit.

#Load librairies
library (tidyverse)
library (ggplot2)

#Flipped advanced barplot

```
gflbarplot <- diff1810_moyenne_desf_par_unit %>%
  mutate(unit = fct_reorder(unit, difference)) %>% #classement des unités par ordre croissant delta desf
  ggplot( aes(x=unit, y=difference , fill=difference)) + #fill : coloration pour chaque groupe
  geom_bar(stat="identity",width=.4) +
  coord_flip() + #inversement des axes
  scale_fill_gradient2(low = "#00CC00", mid = "#CCCC00", high = "#CC0000") + #gradient de couleur
  theme_bw() +
  labs(title = "Différence entre la moyenne de Desflurane utilisé (2018 - 2010) par unité") +
  labs (y = "Différence entre la moyenne de Desflurane utilisé (par intervention) en 2018 et 2010") +
  labs (x = "Unité") +
  labs(fill = "Différence")
```
  
