# Los datos han sido obtenidos desde el repositorio de Kaggle:
# https://www.kaggle.com/datasets/sudalairajkumar/cryptocurrencypricehistory
# https://www.kaggle.com/datasets/rohanrao/nifty50-stock-market-data?select=NESTLEIND.csv
bitcoin=read.csv("coin_Bitcoin.csv")
bitcoin$Date=substr(bitcoin$Date,1,11)
bitcoin=subset(bitcoin,Date>="2020-01-01" & Date<="2021-01-01")
bitcoin=bitcoin[,c("Date","Open","High","Low","Close")]

for (x in 2:5) {
  bitcoin[,x]=as.integer(bitcoin[,x])
}

plot(bitcoin$Open)

nestle=read.csv("NESTLEIND.csv")
nestle$Date=substr(nestle$Date,1,11)
nestle=subset(nestle,Date>="2020-01-01" & Date<="2021-01-01")
nestle=nestle[,c("Date","Open","High","Low","Close")]
for (x in 2:5) {
  nestle[,x]=as.integer(nestle[,x])
}

plot(nestle$Open)

# Guardamos los nuevos archivos
library(xlsx)

write.xlsx(bitcoin,"bitcoin_dataset_clean.xlsx")
write.xlsx(nestle,"nestle_dataset_clean.xlsx")
