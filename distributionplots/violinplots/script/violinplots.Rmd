#The aim here is to observe the distribution of one variable : age for each of the other variable : unit.
#The violin plot, is a similar statistical tool as the boxplot, but it also offer density information (kde = kernel denisty estimation) for a better visulaisation of your data.

```
#Load librairies
library (tidyverse)
library (ggplot2)
library(plotly)
```

#Basic static ggplot2 boxplot

```
#age/année
gviolin <- hal_data %>%
  ggplot(aes(x=as.factor(annee), y=age, fill=as.factor(annee))) + #fill=name allow to automatically dedicate a color for each group
  geom_violin()
  
#age/unité
gviolin <- hal_data %>%
  ggplot(aes(x=as.factor(unit), y=age, fill=as.factor(unit))) + #fill=name allow to automatically dedicate a color for each group
  geom_violin()
```

#Basic interactive plotly boxplot

```
pviolin <- hal_data %>%
  plot_ly(
    x = ~as.factor(unit),
    y = ~age,
    split = ~as.factor(unit), #séparer disctinctement les groupes (ici unités)
    type = 'violin',
    box = list(visible = T),       #ajout du boxplot
    meanline = list(visible = T),   #ligne en pointillé au niveau de la moyenne
    spanmode = "hard" #Définit espace de données où la fonction de densité sera calculée (hard : prend les valeur min et max de la df)
   ) %>% 
  layout(
     title = "Répartition de l'âge par unité ",
    xaxis = list(title = "Unité"),
    yaxis = list(title = "Âge",  zeroline = F) #Enlève la ligne à zéro
                 
    )
```

#Advanced interactive plotly boxplot

```
##Add a custom logo to the plot

pviolinlogo <- hal_data %>%
  plot_ly(
    x = ~as.factor(unit),
    y = ~age,
    split = ~as.factor(unit), #séparer disctinctement les groupes (ici unités)
    type = 'violin',
    box = list(visible = T),                        #ajout du boxplot
    meanline = list(visible = T)   #ligne pointillé au niveau de la moyenne
   ) %>% 
  layout(
    xaxis = list(title = "Unité"),
    yaxis = list(title = "Âge",  zeroline = F), #Enlève la ligne à zéro
    images = list(
      list(source = "https://upload.wikimedia.org/wikipedia/fr/7/76/CHU_Lille_Logo.png",
           xref = "paper",
           yref = "paper",
           x= 0,
           y= 1,
           sizex = 0.2,
           sizey = 0.2,
           opacity = 0.2)
                 
    ))

##Display two different group separately (here Male vs Female)

pviolingroup <- hal_data %>%
  plot_ly(type = 'violin') %>%
  add_trace(
    x = ~as.factor(unit)[hal_data$sexe == 'M'],
    y = ~age[hal_data$sexe == 'M'],
    legendgroup = 'M',
    scalegroup = 'M',
    name = 'M',
    box = list(visible = T),
    meanline = list(visible = T),
    color = I("blue")
  ) %>%
  add_trace(
    x = ~as.factor(unit)[hal_data$sexe == 'F'],
    y = ~age[hal_data$sexe == 'F'],
    legendgroup = 'F',
    scalegroup = 'F',
    name = 'F',
    box = list(visible = T),
    meanline = list(visible = T),
    color = I("pink")
  ) %>% 
  layout(
    yaxis = list(zeroline = F),
    violinmode = 'group'
  )

##Display two different group on the same violin, splitted (here Male vs Female)

pviolinsplit <- hal_data %>%
  plot_ly(type = 'violin') %>%
  add_trace(
    x = ~as.factor(unit)[hal_data$sexe == 'M'],
    y = ~age[hal_data$sexe == 'M'],
    legendgroup = 'M',
    scalegroup = 'M',
    name = 'M',
    side = 'negative',
    box = list(visible = T),
    meanline = list(visible = T),
    color = I("blue")
  ) %>%
  add_trace(
    x = ~as.factor(unit)[hal_data$sexe == 'F'],
    y = ~age[hal_data$sexe == 'F'],
    legendgroup = 'F',
    scalegroup = 'F',
    name = 'F',
    side = 'positive',
    box = list(visible = T),
    meanline = list(visible = T),
    color = I("pink")
  ) %>% 
  layout(
    xaxis = list(title = ""),
    yaxis = list(title = "", zeroline = F),
    violingap = 0,
    violingroupgap = 0,
    violinmode = 'overlay'
  )

```
