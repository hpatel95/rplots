#The goal is to observe the distribution of one variable : age for each of the other variable : unit, using a statistical tool : boxplot.

#Load librairies
library (tidyverse)
library (ggplot2)
library(plotly)

#Static ggplot2 boxplot

```
gboxplot <- hal_data %>% 
  ggplot( aes(x=as.factor(unit), y=age)) +
  geom_boxplot(na.rm = TRUE)
```
  
#Interactive plotly boxplot

```
pboxplot <-  ggplotly(gboxplot)

```
