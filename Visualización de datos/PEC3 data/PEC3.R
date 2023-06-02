datos=read.csv2("Life_Expectancy_00_15.csv")

for (x in 4:ncol(datos)) {
  datos[,x]=as.numeric(datos[,x])
}
names(datos)
datosagg=aggregate(Life.Expectancy~Continent+Year,datos,mean,na.rm=T)
datosagg$Population=aggregate(Population~Continent+Year,datos,mean,na.rm=T)$Population
datosagg$CO2.emissions=aggregate(CO2.emissions~Continent+Year,datos,mean,na.rm=T)$CO2.emissions
datosagg$Electric.power.consumption=aggregate(Electric.power.consumption~Continent+Year,datos,mean,na.rm=T)$Electric.power.consumption
datosagg$Health.expenditure=aggregate(Health.expenditure~Continent+Year,datos,mean,na.rm=T)$Health.expenditure
datosagg$GDP.per.capita=aggregate(GDP.per.capita~Continent+Year,datos,mean,na.rm=T)$GDP.per.capita
datosagg$Individuals.using.the.Internet=aggregate(Individuals.using.the.Internet~Continent+Year,datos,mean,na.rm=T)$Individuals.using.the.Internet
datosagg$Military.expenditure=aggregate(Military.expenditure~Continent+Year,datos,mean,na.rm=T)$Military.expenditure
datosagg$People.practicing.open.defecation=aggregate(People.practicing.open.defecation~Continent+Year,datos,mean,na.rm=T)$People.practicing.open.defecation
datosagg$People.using.at.least.basic.drinking.water.services=aggregate(People.using.at.least.basic.drinking.water.services~Continent+Year,datos,mean,na.rm=T)$People.using.at.least.basic.drinking.water.services
datosagg$Obesity.among.adults=aggregate(Obesity.among.adults~Continent+Year,datos,mean,na.rm=T)$Obesity.among.adults
datosagg$Beer.consumption.per.capita=aggregate(Beer.consumption.per.capita~Continent+Year,datos,mean,na.rm=T)$Beer.consumption.per.capita

datosaggyear=aggregate(Life.Expectancy~Year,datos,mean,na.rm=T)
datosaggyear$Population=aggregate(Population~Year,datos,mean,na.rm=T)$Population
datosaggyear$CO2.emissions=aggregate(CO2.emissions~Year,datos,mean,na.rm=T)$CO2.emissions
datosaggyear$Electric.power.consumption=aggregate(Electric.power.consumption~Year,datos,mean,na.rm=T)$Electric.power.consumption
datosaggyear$Health.expenditure=aggregate(Health.expenditure~Year,datos,mean,na.rm=T)$Health.expenditure
datosaggyear$GDP.per.capita=aggregate(GDP.per.capita~Year,datos,mean,na.rm=T)$GDP.per.capita
datosaggyear$Individuals.using.the.Internet=aggregate(Individuals.using.the.Internet~Year,datos,mean,na.rm=T)$Individuals.using.the.Internet
datosaggyear$Military.expenditure=aggregate(Military.expenditure~Year,datos,mean,na.rm=T)$Military.expenditure
datosaggyear$People.practicing.open.defecation=aggregate(People.practicing.open.defecation~Year,datos,mean,na.rm=T)$People.practicing.open.defecation
datosaggyear$People.using.at.least.basic.drinking.water.services=aggregate(People.using.at.least.basic.drinking.water.services~Year,datos,mean,na.rm=T)$People.using.at.least.basic.drinking.water.services
datosaggyear$Obesity.among.adults=aggregate(Obesity.among.adults~Year,datos,mean,na.rm=T)$Obesity.among.adults
datosaggyear$Beer.consumption.per.capita=aggregate(Beer.consumption.per.capita~Year,datos,mean,na.rm=T)$Beer.consumption.per.capita

nrows=nrow(datosagg)

datosagg[(nrows+1):(nrows+nrow(datosaggyear)),2:ncol(datosagg)]=datosaggyear
datosagg[(nrows+1):(nrows+nrow(datosaggyear)),1]="World Average"

#write.csv(datosagg,"Continent data.csv")
listcors=list()
for (x in unique(datos$Year)) {
  useddf=subset(datos,Year==x)
  cordf=cor(useddf[4:ncol(useddf)])
  cordf=as.data.frame(cordf)
  cordf$Year=x
  listcors[[paste(x)]]=cordf
}

coryears=data.frame()
countrow=1
for (x in unique(datos$Year)) {
  for (y in 1:nrow(listcors[[paste(x)]])) {
    coryears[countrow,"Year"]=x
    coryears[countrow,"Variable"]=rownames(listcors[[paste(x)]])[y]
    coryears[countrow,"Rvalue"]=listcors[[paste(x)]][y,2]
    countrow=countrow+1
  }
  
}


#write.csv(coryears,"coryears.csv")
