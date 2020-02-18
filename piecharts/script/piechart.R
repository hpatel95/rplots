#Get a basic pie chart : two group of one variable (Male vs Female), (here for one specific other variable : Unit C).



#Load librairies
library (ggplot2)


#Basic piechart
```
propF_M_C <- ggplot(aes(x="", y=Freq, fill=Var1)) +
  geom_bar(stat="identity", width=1, color="white") +
  coord_polar("y", start=0) +
  theme_void() +
  theme(legend.position="none")+
  labs(title = "Unité C")
  ```
