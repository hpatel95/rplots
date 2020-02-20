##PROTOTYPE##

# Variables quantitatives (pourcentage d'utilisation d'un gaz), en fonction de modalité (année ici)

### Gestion de la dataframe

```{r DF management, warning=FALSE, include=FALSE}

# Création des variables desflurane et sevoflurane.

## A. Enlever NAs, remplacer par la valeur zéro.

hal_data <- hal_data %>% 
  replace_na(list(nb_dese_anesth=0,
                  moy_dese_anesth=0,
                  nb_seve_anesth=0,
                  moy_seve_anesth=0))

### B. Créer variable desflurane, = 0 ou = 1.

hal_data<-hal_data %>%
  mutate(desflurane = ifelse(nb_dese_anesth >= 10 & moy_dese_anesth >= 3.5, 1, 0))


### C. Créer variable sevoflurane, = 0 ou = 1.

hal_data<-hal_data %>%
  mutate(sevoflurane = ifelse(nb_seve_anesth >= 10 & moy_seve_anesth >= 0.8, 1, 0))

### D.Créer variable zero halogène

hal_data<-hal_data %>%
  mutate(zero_hal = ifelse(desflurane == 0 & sevoflurane == 0, 0, ifelse(nb_dese_anesth > nb_seve_anesth, 1, 2)))

# Création des df finales

# A.DF isoler variable zero halogene pour l'année 2018
zero_hal18 <- hal_data %>% filter(annee == "2018") %>% select(annee , zero_hal)

# B.DF isoler variable zero halogene pour l'année 2018
zero_hal10 <- hal_data %>% filter(annee == "2010") %>% select(annee , zero_hal)

## C. DF avoir pourcentage pour chaque gaz pour l'année 2018
zero_hal181 <-  zero_hal18 %>% count(zero_hal) %>% 
                mutate(perc = (n*100) / sum(n))

## D. DF avoir pourcentage pour chaque gaz pour l'année 2010
zero_hal101 <-  zero_hal10 %>% count(zero_hal) %>%  
                mutate(perc = (n*100) / sum(n))

### E.Créer vecteur avec pourcentage pour chaque gaz pour l'année 2018 (avec résultats zero_hal181)
repartitiongaz18 <- c("Non Halogéné"=61,  "Sevoflurane"=27, "Desflurane"=12)

### F.Créer vecteur avec pourcentage pour chaque gaz pour l'année 2018 (avec résultats zero_hal181)
repartitiongaz10 <- c("Non Halogéné"=65,  "Sevoflurane"=28, "Desflurane"=7)


```
