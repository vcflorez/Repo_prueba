datos::clima
library(datos)
library(forcats)
install.packages("EDAWR")
devtools::
storm
dplyr::storms
a <- arrange(storms,pressure,wind)
View(storms)
b <- select(storms, name, pressure, everything())

#parte 3: fct_count, fct_collapse y cambio de clases de variables
#Usamos el dataset encuesta 
#En este ejemplo, que las personas colocaban su estado civil, queremos dejarlo solo en dos niveles
#que sea Soltero o casado
#metemos la base de datos en un objeto
datos <- encuesta
View(datos)
#Lo que hago es meter todos los niveles de la variable estado civil 
#que no sean casados, meterlos en solteros
#Los argumentos que tenemos son: la variable, el nombre del nivel que quiero
#Los que voy a colapsar en ese nivel 
datos$estado_civil <- fct_collapse(datos$estado_civil,"Soltero"=c("Sin respuesta","Nunca se ha casado","Separado","Divorciado","Viudo"))

#Si ahora quiero comprobar que ese cambio se hizo bien, puedo ayudarme de fct_count
#Recuerdo que antes tenía 6 niveles para el estado civil, ahora puedo ver cuantos hay
#Con fct_count puedo contar cuantas observaciones de cada nivel tengo
fct_count(datos$estado_civil)

#Otra funcion util es str y glimpse, que me permite ver la estructura de los datos:
#Con esta también puedo comprobar que el cambio se haya realizado correctamente
str(datos)
#Puedo ver que estructura tiene cada variable: entero, factor, numerico; etc
#glimpse tambien es util 
dplyr::glimpse(datos)
#si yo quisiera pasar el año a factor, puedo usar la función as.factor
datos$anio <- as.factor(datos$anio)
#compruebo
str(datos)

#Parte 4: solución ejercicios recomendados 
# Crea un nuevo data frame que muestre el nombre y la velocidad del viento de aquellas
#tormentas que ocurrieron del año 1974 a 1976 y fueron clasificadas como depresión tropical.
dplyr::storms
library(dplyr)
a <- storms
b <- (a %>%
    filter(year==1974:1976) %>%
    filter(status=="tropical depression") %>%
    select(name, wind))
#organizar la velocidad del viento de mayor a menor 
b %>%
  arrange(desc(wind))

z <- filter(storms, wind>=30 | wind>50)
dplyr::st
#punto 3
storms <- mutate(storms,
                 tiempo_dia=if_else(hour<=12,"Mañana","Tarde"))

