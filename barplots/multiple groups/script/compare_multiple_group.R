#The goal here is to compare the evolution of multiple group (linked to one variable) by a time variable (annee) or gas variable (desflurane)

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

#########################
#Variables qualitatives (classes d'IMC ici), en fonction d'une autre variable quantitative (moyenne de desflurane ici)

##Barplot


```{r Graph à barre2, echo=TRUE}

g2barre <- hal_data %>% 
  group_by (imc_classe) %>% 
  summarise(moyenne_desf = mean(moy_dese_anesth, na.rm = TRUE)) %>% #(na.rm Pas compter les NAs)
  filter(!imc_classe %in% c("")) %>%
  ggplot( aes(x=imc_classe, y=moyenne_desf)) +
  geom_bar(stat="identity")

##Interactiv barplot
```{r Graph à barre2 plotly, echo=TRUE}

p2barre <- hal_data %>% 
  group_by (imc_classe) %>% 
  summarise(moyenne_desf = mean(moy_dese_anesth, na.rm = TRUE)) %>% #(na.rm Pas compter les NAs)
  filter(!imc_classe %in% c("")) %>%
  plot_ly(x = ~imc_classe,
          y = ~moyenne_desf,
            name = "Moyenne desf/classe_imc",
          type = "bar")
