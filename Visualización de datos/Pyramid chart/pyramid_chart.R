data=read.csv("macros_dataset.csv")
dataagg=aggregate(proteins_100g~origin,data,mean)
dataagg$carbohydrates_100g=aggregate(carbohydrates_100g~origin,data,mean)$carbohydrates_100g
dataagg$fat_100g=aggregate(fat_100g~origin,data,mean)$fat_100g
# Añadimos lo que no son macronutrientes a la ecuación (agua, fibra, etc.)
dataagg$others_100g=100-(dataagg$proteins_100g+dataagg$carbohydrates_100g+dataagg$fat_100g)
names(dataagg)=c("Origin","Proteins","Carbohydrates","Fats","Others (water, fiber, etc.)")
# Adaptamos el formato de los datos
library(reshape2)
datalong=melt(dataagg,id.vars="Origin")
datalong=datalong[order(datalong$value,decreasing = T),]

# Generamos el código para el pyramid chart, consultado en:
# https://rpubs.com/techanswers88/PyramidChart
library(highcharter)
library(dplyr)

hc <- datalong %>%
  filter(Origin == "Non-animal")%>%
  hchart("pyramid",hcaes(x = variable,y = value))%>%
  hc_title(text = "Non-animal origin meals mean macronutrients") %>%
  #hc_subtitle(text = "Top 10 countries by population <br>techanswers88") %>%
  hc_add_theme(hc_theme_ffx())
hc

hc <- datalong %>%
  filter(Origin == "Animal")%>%
  hchart("pyramid",hcaes(x = variable,y = value))%>%
  hc_title(text = "Animal origin meals mean macronutrients") %>%
  #hc_subtitle(text = "Top 10 countries by population <br>techanswers88") %>%
  hc_add_theme(hc_theme_ffx())
hc

