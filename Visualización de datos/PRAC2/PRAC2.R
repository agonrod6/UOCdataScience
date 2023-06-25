games=read.csv("games.grivg.csv",sep = "\t")
names(games)[1]="Game"
unique(games$Country)
games$Continent=ifelse(games$Country%in%c("USA","CAN"),"North America",NA)
games$Continent=ifelse(games$Country%in%c("SWE","FIN","GBR","AUT","POL","DNK","NOR","BEL","FRA"),"Europe",games$Continent)
games$Continent=ifelse(games$Country%in%c("AUS"),"Oceania",games$Continent)
games$Continent=ifelse(games$Country%in%c("JPN"),"Asia",games$Continent)
games$Year=NA

for (x in 1:nrow(games)) {
  games[x,"Year"]=2000+as.numeric(strsplit(games[x,"Release"],"-")[[1]][2])
}

games$count=1
aggregate(count~Year,games,sum)
games$Last5Years=ifelse(games$Year>2017,1,0)


characters=read.csv("characters.grivg.csv")
sexualization=read.csv("sexualization.grivg.csv")
names(sexualization)[1]="Id"
alldata=games
alldata=merge(alldata,characters,by="Game")
alldata=merge(alldata,sexualization,by="Id")

#write.csv(alldata,"Merged data gender videogames.csv")
