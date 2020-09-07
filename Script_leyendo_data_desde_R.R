#------------- LEYENDO DATA DESDE R---------

#------------- 1.Data de 'proprietary software'----------

#------------  1.1.Data desde STATA------------

install.packages("rio")
library(rio)
lkDTA="https://github.com/PoliticayGobiernoPUCP/estadistica_anapol2/raw/master/DATA/lapop2012.dta"
dataStata=import(lkDTA)
dim(dataStata)

#------------- 1.2.Data desde SPSS---------------

lkSAV="https://github.com/PoliticayGobiernoPUCP/estadistica_anapol2/raw/master/DATA/lapop2012.sav"
dataSpss=import(lkSAV)
dim(dataSpss)

#------------- 1.3.Data desde Excel-----------

lkXLSX="https://github.com/PoliticayGobiernoPUCP/estadistica_anapol2/raw/master/DATA/lapop2012.xlsx"
dataExcel=import(lkXLSX)
dim(dataExcel)

#------------- 1.4.Data CSV------

lkCSV="https://github.com/PoliticayGobiernoPUCP/estadistica_anapol2/raw/master/DATA/lapop2012.csv"
dataCSV=import(lkCSV)
dim(dataCSV)

#------------- 1.5.Datos espaciales-----------

install.packages("sp")
library(sp)
install.packages("geojsonio")
library(geojsonio)
install.packages("rgdal")
library(rgdal)
fromGit="https://github.com/Edsonfernandez123/Leyendo-data-desde-R.git" 
wazipMap <- rgdal::readOGR(fromGit,stringsAsFactors = FALSE)
plot(wazipMap)

#------------- 2.Uso de APIS--------------

miLLAVE='loxaOHFwm9VZPnv0PuNfPjOvmNAQfhmhldT0crHb'
GUID='http://api.datosabiertos.msi.gob.pe/api/v2/datastreams/INTER-DE-SEREN-2016/'
FORMATO='data.json/'
request=paste0(GUID,FORMATO,'?auth_key=',miLLAVE)

install.packages("jsonlite")
library(jsonlite)
request=paste0(GUID,FORMATO,'?auth_key=',miLLAVE)
serenosSI = fromJSON(request)
FORMATO2='data.pjson/'
request2=paste0(GUID,FORMATO2,'?auth_key=',miLLAVE)
serenosSI2 = fromJSON(request2)
str(serenosSI2)
head(serenosSI2$result)
dim(serenosSI2$result)

Parametros='&from=01/01/2010'
request3=paste0(GUID,FORMATO2,'?auth_key=',miLLAVE,Parametros)
serenosSI_all = fromJSON(request3)$result
dim(serenosSI_all)

#------------- 3.'Scraping' tablas de datos----------

#------------- 3.1. Scraping desde tabla-------------
linkPage="https://www.nationsonline.org/oneworld/corruption.htm" 
linkPath = "/html/body/table[3]" #ojo este es el codigo de la tabla
install.packages("htmltab")
library(htmltab)
corrupcion = htmltab(doc = linkPage, which =linkPath)
head(corrupcion)
tail(corrupcion)

#------------- 3.2.Scraping desde body-------------

linkPath1 = "/html/body"
corrupcion1 = htmltab(doc = linkPage, which = linkPath1)
head(corrupcion1)
tail(corrupcion1)

linkPath2 = "/html/body/table[3]"
corrupcion2 = htmltab(doc = linkPage, which = linkPath2)
head(corrupcion2)
tail(corrupcion2)
