data=read.csv("macros_dataset.csv")
dataagg=aggregate(proteins_100g~origin,data,mean)
dataagg$carbohydrates_100g=aggregate(carbohydrates_100g~origin,data,mean)$carbohydrates_100g
dataagg$fat_100g=aggregate(fat_100g~origin,data,mean)$fat_100g
# Añadimos lo que no son macronutrientes a la ecuación (agua, fibra, etc.)
dataagg$others_100g=100-(dataagg$proteins_100g+dataagg$carbohydrates_100g+dataagg$fat_100g)
names(dataagg)=c("Origin","Proteins","Carbohydrates","Fats","Others (water, fiber, etc.)")

# Guardamos el nuevo archivo
write.csv(dataagg,"macros_dataset_clean.csv")
