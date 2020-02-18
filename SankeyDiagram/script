#Load librairies
library (tidyverse)
library(networkD3)


# PART 1 : Data management

```
# Arrangement pour le diagramme : ligne -> colonne

moyenne_gaz_par_unit <- tidyr::gather(moyenne_gaz_par_unit, gaz, freq, -unit) 


## Créer les "noeuds"

#Rendre les noms des unités en caractère correspondant à un numéro
unite <- unique(as.character(moyenne_gaz_par_unit$unit))  

##Créer les noeuds

noeuds <- data.frame(node = c(0:13), 
                     name = c(unite,"Non_Halogene" , "Sevoflurane", "Desflurane")) 

### Rajouter les noeuds associés aux unités

moyenne_gaz_par_unit <- merge(moyenne_gaz_par_unit, noeuds, by.x = "unit", by.y = "name")

### Rajouter les noeuds associé au type de gaz

moyenne_gaz_par_unit <- merge(moyenne_gaz_par_unit, noeuds, by.x = "gaz", by.y = "name")


#### Garder que les noeuds et leur valeurs associés (liens)

liens <- moyenne_gaz_par_unit[ , c("node.x", "node.y", "freq")]


##### Renommer les colonnes de la df (en source, target et value, pour le diag)  

colnames(liens) <- c("source", "target", "value")
```

# PART 2 : Plotting

```
# Création diagramme de sankey

sank <- networkD3::sankeyNetwork(Links = liens, Nodes = noeuds, 
                         Source = 'source', 
                         Target = 'target', 
                         Value = 'value', 
                         NodeID = 'name',
                         units = 'freq')
```
