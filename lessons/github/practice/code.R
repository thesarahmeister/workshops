write.csv(airquality, "data/airquality.csv")

names(airquality)

head(airquality)

summary(airquality)

lm(Ozone ~ Wind, data=airquality)

