#datos
#Atributos
# Fecha
# Hora
# latitud
# longitud
# profundidad
# magnitud
library(chron)

##################DATASET cat_2010_2011##################
date_time_1 = cat_2010_2011$time_value

date_1 = as.Date(date_time_1)
time_1 = format(as.POSIXct(date_time_1), format = "%H:%M:%S")
time_1 = chron(times=time_1)
latitud_1 = cat_2010_2011$latitude_value
longitud_1 = cat_2010_2011$longitude_value
profundidad_1 = cat_2010_2011$depth_value
magnitud_1 = cat_2010_2011$magnitude_value_P

##################DATASET cat_origen_2012_feb2023##################
date_time_2 = cat_origen_2012_feb2023$time_value

date_2 = as.Date(date_time_2)
time_2 = format(as.POSIXct(date_time_2), format = "%H:%M:%S")
time_2 = chron(times=time_2)
latitud_2 = cat_origen_2012_feb2023$latitude_value
longitud_2 = cat_origen_2012_feb2023$longitude_value
profundidad_2 = cat_origen_2012_feb2023$depth_value
magnitud_2 = cat_origen_2012_feb2023$magnitude_value_P

##################DATASET CatalogoHomogenizado##################
date_3 = paste(as.character(CatalogoHomogenizado$AA), "-", as.character(CatalogoHomogenizado$Mes), "-", as.character(CatalogoHomogenizado$Dia))
date_3 = gsub(" ", "", date_3)
date_3 = as.Date(date_3)

time_3 = paste(as.character(CatalogoHomogenizado$Hora), ":", as.character(CatalogoHomogenizado$Minuto), ":", as.character(CatalogoHomogenizado$Segundo))
time_3 = gsub(" ", "", time_3)
time_3 = chron(times=time_3)

latitud_3 = CatalogoHomogenizado$Latitud
longitud_3 = CatalogoHomogenizado$Longitud
profundidad_3 = CatalogoHomogenizado$Profundidad
magnitud_3 = CatalogoHomogenizado$Mw

##################DATASET IGP_datos_sismicos##################
date_4 = as.POSIXct(IGP_datos_sismicos$`fecha UTC`, format = "%d/%m/%Y", tz = "UTC")
date_4 = as.Date(date_4)

time_4 = chron(times=IGP_datos_sismicos$`hora UTC`)

latitud_4 = IGP_datos_sismicos$`latitud (º)`
longitud_4 = IGP_datos_sismicos$`longitud (º)`
profundidad_4 = IGP_datos_sismicos$`profundidad (km)`
profundidad_4 = as.numeric(profundidad_4)
magnitud_4 = IGP_datos_sismicos$`magnitud (M)`
magnitud_4 = as.numeric(magnitud_4)

##################DATASET query_usgs_1900_2023##################
date_time_5 = query_usgs_1900_2023$time

date_5 = as.Date(date_time_5)
time_5 = format(as.POSIXct(date_time_5), format = "%H:%M:%S")
time_5 = chron(times=time_5)

latitud_5 = query_usgs_1900_2023$latitude
longitud_5 = query_usgs_1900_2023$longitude
profundidad_5 = query_usgs_1900_2023$depth
magnitud_5 = query_usgs_1900_2023$mag

##################DATASET earthquakes_2023_05_26_20_56_44_0500_noaa##################
earthquakes_2023_05_26_20_56_44_0500_noaa <- earthquakes_2023_05_26_20_56_44_0500_noaa[!is.na(earthquakes_2023_05_26_20_56_44_0500_noaa$Year),]
earthquakes_2023_05_26_20_56_44_0500_noaa <- earthquakes_2023_05_26_20_56_44_0500_noaa[!is.na(earthquakes_2023_05_26_20_56_44_0500_noaa$Mo),]
earthquakes_2023_05_26_20_56_44_0500_noaa <- earthquakes_2023_05_26_20_56_44_0500_noaa[!is.na(earthquakes_2023_05_26_20_56_44_0500_noaa$Dy),]
earthquakes_2023_05_26_20_56_44_0500_noaa <- earthquakes_2023_05_26_20_56_44_0500_noaa[!is.na(earthquakes_2023_05_26_20_56_44_0500_noaa$Hr),]
earthquakes_2023_05_26_20_56_44_0500_noaa <- earthquakes_2023_05_26_20_56_44_0500_noaa[!is.na(earthquakes_2023_05_26_20_56_44_0500_noaa$Mn),]
earthquakes_2023_05_26_20_56_44_0500_noaa <- earthquakes_2023_05_26_20_56_44_0500_noaa[!is.na(earthquakes_2023_05_26_20_56_44_0500_noaa$Sec),]
earthquakes_2023_05_26_20_56_44_0500_noaa <- earthquakes_2023_05_26_20_56_44_0500_noaa[!is.na(earthquakes_2023_05_26_20_56_44_0500_noaa$Latitude),]
earthquakes_2023_05_26_20_56_44_0500_noaa <- earthquakes_2023_05_26_20_56_44_0500_noaa[!is.na(earthquakes_2023_05_26_20_56_44_0500_noaa$Longitude),]
earthquakes_2023_05_26_20_56_44_0500_noaa <- earthquakes_2023_05_26_20_56_44_0500_noaa[!is.na(earthquakes_2023_05_26_20_56_44_0500_noaa$`Focal Depth (km)`),]
earthquakes_2023_05_26_20_56_44_0500_noaa <- earthquakes_2023_05_26_20_56_44_0500_noaa[!is.na(earthquakes_2023_05_26_20_56_44_0500_noaa$Mag),]

date_6 = paste(as.character(earthquakes_2023_05_26_20_56_44_0500_noaa$Year), "-", as.character(earthquakes_2023_05_26_20_56_44_0500_noaa$Mo), "-", as.character(earthquakes_2023_05_26_20_56_44_0500_noaa$Dy))
date_6 = gsub(" ", "", date_6)
date_6 = as.Date(date_6)

time_6 = paste(as.character(earthquakes_2023_05_26_20_56_44_0500_noaa$Hr), ":", as.character(earthquakes_2023_05_26_20_56_44_0500_noaa$Mn), ":", as.character(earthquakes_2023_05_26_20_56_44_0500_noaa$Sec))
time_6 = gsub(" ", "", time_6)
time_6 = chron(times=time_6)

latitud_6 = earthquakes_2023_05_26_20_56_44_0500_noaa$Latitude
longitud_6 = earthquakes_2023_05_26_20_56_44_0500_noaa$Longitude
profundidad_6 = earthquakes_2023_05_26_20_56_44_0500_noaa$`Focal Depth (km)`
magnitud_6 = earthquakes_2023_05_26_20_56_44_0500_noaa$Mag

##################DATOS TOTALES##################

date_t = c(date_1, date_2, date_3, date_4, date_5, date_6)
time_t = c(time_1, time_2, time_3, time_4, time_5, time_6)
latitud_t = c(latitud_1, latitud_2, latitud_3, latitud_4, latitud_5, latitud_6)
longitud_t = c(longitud_1, longitud_2, longitud_3, longitud_4, longitud_5, longitud_6)
profundidad_t = c(profundidad_1, profundidad_2, profundidad_3, profundidad_4, profundidad_5, profundidad_6)
magnitud_t = c(magnitud_1, magnitud_2, magnitud_3, magnitud_4, magnitud_5, magnitud_6)

data_sismos = data.frame(
  "fecha" = date_t,
  "hora" = time_t,
  "latitud" = latitud_t,
  "longitud" = longitud_t,
  "profundidad" = profundidad_t,
  "magnitud" = magnitud_t
)

data_sismos = data_sismos[order(as.Date(data_sismos$fecha, format = "%Y-%m-%d")),]

library(ggplot2)

ggplot(data=data_sismos, aes(x=c(1:length(magnitud)), y=magnitud)) +
  geom_line() +
  xlab("Sismo") +
  ylab("Magnitud") +
  ggtitle("Magnitud de sismos")

ggplot(data=data_sismos, aes(x=c(1:length(profundidad)), y=profundidad)) +
  geom_line() +
  xlab("Sismo") +
  ylab("Profundidad") +
  ggtitle("Profundidad de sismos")

ggplot(data=data_sismos, aes(x=magnitud, y=profundidad)) +
  geom_line() +
  xlab("Magnitud") +
  ylab("Profundidad") +
  ggtitle("Magnitud vs Profundidad")

ggplot(data=data_sismos, aes(x=fecha, y=magnitud))+
  geom_line() +
  xlab("Fecha") +
  ylab("Magnitud") +
  ggtitle("Magnitud de sismos por fecha")

write.csv(data_sismos, "data_sismos.csv", row.names = FALSE)

#############MAPA################
library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)
map <- map_data("world", "ecuador")
ggplot() + geom_polygon(data = map, aes(x=long, y = lat, group = group)) + 
  geom_point(data = data_sismos, aes(x = longitud, y = latitud), color = "green") +
  coord_fixed(1.3) +
  xlab("Longitud") +
  ylab("Latitud") +
  ggtitle("Mapa Histórico Sismos Ecuador 1901-01-07 | 2023-05-21")