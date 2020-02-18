## ESSAIS / TEST ##
#Currently having problem with getting data directly from dataframe, need to use vectors

#Load librairies
library (tidyverse)
library(waffle)
library(extrafont)

#Load font (+verification)
extrafont::font_import (path="C:/Users/dev_info_med/Downloads", pattern = "awesome", prompt = FALSE)
loadfonts(device = "win")

#DF looks like this:

#pourcentage pour chaque gaz pour l'année 2018 (avec résultats zero_hal181)
repartitiongaz18 <- c("Non Halogéné"=61,  "Sevoflurane"=27, "Desflurane"=12)

# pourcentage pour chaque gaz pour l'année 2018 (avec résultats zero_hal181)
repartitiongaz10 <- c("Non Halogéné"=65,  "Sevoflurane"=28, "Desflurane"=7)

#Create two waffles plot

```
#waffle Répartition gazs anesthésie en 2010

wplot18 <- waffle(repartitiongaz18, rows = 5,  use_glyph = "square", glyph_size = 6, #use_hlyph: value can be changed to any icon availalb eon fontawesome website 
       title = "Répartition des gazs utilisés en anesthésie en 2018",
       xlab="1 carré = 1 %")

wplot18ambulance <- waffle(repartitiongaz18, rows = 5,  use_glyph = "ambulance", glyph_size = 6, #use_hlyph: value can be changed to any icon availalb eon fontawesome website 
       title = "Répartition des gazs utilisés en anesthésie en 2018",
       xlab="1 carré = 1 %")
       
wplot10 <-  waffle(repartitiongaz10, rows = 5,  use_glyph = "square", glyph_size = 6, 
         title = "Répartition des gazs utilisés en anesthésie en 2010",
         xlab="1 carré = 1 %")
  
##Comaparison 2010 vs 2018
iron(wplot10 , wplot18)
```
