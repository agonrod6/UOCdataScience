# Los datos han sido obtenidos desde el repositorio de Kaggle:
# https://www.kaggle.com/datasets/brianmcabee/us-powerlifting-competition-data-2015now?select=usa_sbd_data_2020-10-16.csv
powerlifting=read.csv("usa_sbd_data_2020-10-16.csv")
powerlifting=powerlifting[,c("Date","Sex","Best3BenchKg","Best3SquatKg","Best3DeadliftKg")]
powerlifting$Date=substr(powerlifting$Date,1,11)
powerlifting2015male=subset(powerlifting,Date>="2015-01-01" & Date<="2015-12-31" & Sex=="M")
powerlifting2015female=subset(powerlifting,Date>="2015-01-01" & Date<="2015-12-31" & Sex=="F")
powerlifting2020male=subset(powerlifting,Date>="2020-01-01" & Date<="2020-12-31" & Sex=="M")
powerlifting2020female=subset(powerlifting,Date>="2020-01-01" & Date<="2020-12-31" & Sex=="F")


bestlifts=data.frame(Year=NA,Sex=NA,Bench=NA,Squat=NA,Deadlift=NA)

bestlifts[1,"Year"]=2015
bestlifts[1,"Sex"]="M"
bestlifts[1,"Bench"]=powerlifting2015male$Best3BenchKg[
  which(powerlifting2015male$Best3BenchKg==max(powerlifting2015male$Best3BenchKg,na.rm=T))[1]
]
bestlifts[1,"Squat"]=powerlifting2015male$Best3SquatKg[
  which(powerlifting2015male$Best3SquatKg==max(powerlifting2015male$Best3SquatKg,na.rm=T))[1]
]
bestlifts[1,"Deadlift"]=powerlifting2015male$Best3DeadliftKg[
  which(powerlifting2015male$Best3DeadliftKg==max(powerlifting2015male$Best3DeadliftKg,na.rm=T))[1]
]
bestlifts[2,"Year"]=2020
bestlifts[2,"Sex"]="M"
bestlifts[2,"Bench"]=powerlifting2020male$Best3BenchKg[
  which(powerlifting2020male$Best3BenchKg==max(powerlifting2020male$Best3BenchKg,na.rm=T))[1]
]
bestlifts[2,"Squat"]=powerlifting2020male$Best3SquatKg[
  which(powerlifting2020male$Best3SquatKg==max(powerlifting2020male$Best3SquatKg,na.rm=T))[1]
]
bestlifts[2,"Deadlift"]=powerlifting2020male$Best3DeadliftKg[
  which(powerlifting2020male$Best3DeadliftKg==max(powerlifting2020male$Best3DeadliftKg,na.rm=T))[1]
]

bestlifts[3,"Year"]=2015
bestlifts[3,"Sex"]="F"
bestlifts[3,"Bench"]=powerlifting2015female$Best3BenchKg[
  which(powerlifting2015female$Best3BenchKg==max(powerlifting2015female$Best3BenchKg,na.rm=T))[1]
]
bestlifts[3,"Squat"]=powerlifting2015female$Best3SquatKg[
  which(powerlifting2015female$Best3SquatKg==max(powerlifting2015female$Best3SquatKg,na.rm=T))[1]
]
bestlifts[3,"Deadlift"]=powerlifting2015female$Best3DeadliftKg[
  which(powerlifting2015female$Best3DeadliftKg==max(powerlifting2015female$Best3DeadliftKg,na.rm=T))[1]
]
bestlifts[4,"Year"]=2020
bestlifts[4,"Sex"]="F"
bestlifts[4,"Bench"]=powerlifting2020female$Best3BenchKg[
  which(powerlifting2020female$Best3BenchKg==max(powerlifting2020female$Best3BenchKg,na.rm=T))[1]
]
bestlifts[4,"Squat"]=powerlifting2020female$Best3SquatKg[
  which(powerlifting2020female$Best3SquatKg==max(powerlifting2020female$Best3SquatKg,na.rm=T))[1]
]
bestlifts[4,"Deadlift"]=powerlifting2020female$Best3DeadliftKg[
  which(powerlifting2020female$Best3DeadliftKg==max(powerlifting2020female$Best3DeadliftKg,na.rm=T))[1]
]


# Guardamos el nuevo archivo
write.csv(bestlifts,"powerlifting_clean.csv")
