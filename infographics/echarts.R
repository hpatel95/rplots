## ESSAIS / TEST ##
#Currently having multiple problems, just a prototype.
# [TEST] Variables quantitatives (nombre d'équivalent A/R PAR-NY) en fonction de modalité (unité ici)

#Load librairies
library(echarts4r)
library (tidyverse)


# Gestion de la dataframe

```
# Création DF Nombre anesthesie utilisant desf/unit en 2018

nbr_desf_par_unit_18 <- aggregate(x=hal_data$desflurane,
                                      by=list(unit = hal_data$unit , annee = hal_data$annee),
                                      FUN=sum) %>%
  filter(annee == "2018") %>% 
  rename (sum_desf = x)

#########

#On pose 1 desflurane = 1 Paris-Lyon
## 7 Paris-Lyon = 1 Paris-NY <=> 7 A/R Paris-Lyon = 1 A/R Paris-NY  (source : https://eco-calculateur.dta.aviation-civile.gouv.fr/)

### Création variable arparis_ny :
nbr_desf_par_unit_18 <- nbr_desf_par_unit_18 %>% mutate(arparis_ny = round(sum_desf/14 , digits = 2))
```


## Création infographie équivalent carbone desf

```
#echarts4r - Equivalent impact CO2 en A/R Paris-NY  utilisation  desflurane / unit en 2018

infogr<- nbr_desf_par_unit_18 %>% 
  arrange(arparis_ny) %>%
  e_charts(unit) %>% 
  e_pictorial(arparis_ny, symbol = paste0("image://","https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Airplane_silhouette.svg/400px-Airplane_silhouette.svg.png"), 
              symbolRepeat = TRUE, z = -1,
              symbolSize = c(30, 30)) %>% 
  e_theme("westeros") %>%
  e_title("Equivalent carbone utilisation desflurane par unité (2018)" , right = 'middle') %>% 
  e_flip_coords() %>%
  # Hide Legend
  e_legend(show = FALSE) %>%
  # Remove Gridlines
  e_x_axis(splitLine=list(show = FALSE) , name = "Nombre A/R Paris-New-York" , nameLocation = 'center') %>%
  e_y_axis(splitLine=list(show = FALSE), name = "Unité" , nameLocation = 'end') %>%
  # Format Label
  e_labels(fontSize = 16, fontWeight ='bold', position = "right", offset=c(10, 0)) 

infogr
```
