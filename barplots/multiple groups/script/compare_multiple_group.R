
#Load librairies
library (tidyverse)
library (ggplot2)

#Groups overlapped
```
goverlap <- moyenne_desf_sev_par_annee %>% 
  gather(Gaz, Moyenne, moyenne_desf , moyenne_sevo) %>%
  ggplot(aes(x = annee, y = Moyenne, fill = Gaz)) + 
  geom_bar(stat="identity" , position = position_dodge(width = 0.4), alpha = 0.8) #position_dodge(width=), permet de régler le décalage entre les barres
```


#Groups stacked
```
gstack <- moyenne_desf_sev_par_annee %>% 
  gather(Gaz, Moyenne, moyenne_desf , moyenne_sevo) %>%
  ggplot(aes(x = annee, y = Moyenne, fill = Gaz)) + 
  geom_bar(stat="identity") 
```
