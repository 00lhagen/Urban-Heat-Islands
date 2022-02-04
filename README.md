# Urban Heat Islands in Heidelberg 

This project tries to model the distribution of Urban Heat Islands in Heidelberg, Germany via gdal and GRASS GIS. 


## Description

This repository contains the calculation of Urban Heat Islands on the exmaple of Heidelberg in Germany.

Urban Heat Islands describe the difference in air temperature between higher-temperature urban and lower-temperature rural areas. They primarily affect urban and densely populated areas and therefore are an increasing problem in Germany and mainly worldwide, as heat islands are dangerous for the human health. Therefore, there is an urgent need for action, whereby the first step of adapting the cities to the rising temperature is to identify the distribution of Urban Heat Islands. 

Due to the easy customization, the uncomplicated implementation once the scripts are created, and the wide range of possibilities in dealing with vector and raster data, we decided to use a combination of GRASS Gis and gdal - which are also basically in the category of free and open source software, so everyone has access.  

Following the article of Dugord et al., who made a potential heat stress risk analysis in Berlin, Germany, the model considers Land Surface Temperature, Land Cover, near surface air temperatures, vegetation, cold air flows, building density and distance to the city center. 

Until today we only implemented three aspects: The Land Surface Temperature, the Land Cover and the building density. Nevertheless we already faced some challenges, f.e. in calculating the centerpoints of the buildings with GRASS Gis. In the near future we want to ad the other aspects, which are listed above. Latest on the 31.03.2022 the complete calculation will be published here.

  
## Getting Started

### Installing 

**Windows:** 

Download the OSGeo4W Installer from [here](https://trac.osgeo.org/osgeo4w/) and run the installer (choose advanced intall and keep the default values) 

Select at “Choose packages” under the section “Desktop” the following packages for installation  

		qgis: QGis Desktop  

		grass: GRASS GIS 

		saga: SAGA   

You can see the selected packages for the installation if you click on the column “New”  

Under the section “Libs” select 

		qgis-grass-plugin: Grass plugin for QGis  

Complete the intallation 

 

**MacOS:**  

Intall the latest release or long term release version of [QGis](https://www.qgis.org/de/site/forusers/download.html) on your computer.  

Make sure that the path to the GRASS7 folder is set, by going in the menu under prosessing. 

Go into the Terminal and execute the command “gdalinfo”, if the answer is “command not found” execute these two commands so set the path. Make sure to name the right QGis version. 

```shell
export PROJ_LIB="/Applications/QGIS-LTR.app/Contents/Resources/proj" 
export PATH=/Applications/QGIS-LTR.app/Contents/MacOS/bin:$PATH 
```
 
 The MacOS users also need to install GRASS Gis additionally from [here](https://grass.osgeo.org/download/mac/).  

**Linux:** 

Please follow the instructions of the QGIS documentation. Make sure to install both QGIS (qgis) and the QGIS GRASS plugin (qgis-plugin-grass).  

 
**We have used:** 

QGis version 3.16

GRASS GIS version 7.8.6

 

## Executing program

Modications needed to be made to files/folders? -> Erstellung Ordnerstruktur als Empfehlung (Berechnung UHI -> Vorbereitung, Gebaeudedichte, LST, LC, Result) 

  

How to run the program? -> Erstellung GRASS Gis location (Heidelberg) & Mapset (gewünschter Stadtteil) in Ordner Berechnung UHI 

  

### 1.     Preparation 

* Fork and clone the repository to your computer 

* Download the [data](https://heibox.uni-heidelberg.de/d/bc815a4d7cdb4a23bc25/). It contains the following files: 

<details>
	<summary>* stadtteile.shp<summary> 
<br/>	
	klappt das endlich
</details>


	* Gebaeude.shp 

	* Klassen_Gebaeudedichte.txt

	* Vorbereitung.sh 

	* Gebaeudedichte.sh 

	* LST.sh 

	* Land_Cover.sh 

	* Result.sh 

  

### 2.     Run the scripts

a.     Run first script (Vorbereitung.sh in the GRASS GIS Commandline) 

```bash 
$ chmod +x ./Vorbereitung.sh (only Mac/Linux)
$ ./Vorbereitung.sh
```

b.     Run second script (Gebaeudedichte.sh GRASS GIS Commandline) 

c.     Run third script (Land_Cover.sh in the GRASS GIS Commandline) 

d.     Run fourth script (LST.sh in the GRASS GIS Commandline) 

e.     Run fifth script (Result.sh in the normal Commandline) 

 

### 3. Coloring and illustration of the result with QGis 

  

## Help 

Until now, we couldn't detec common errors. If you have problems, do not hesitate to write an issue. We will answer as soon as possible. If common errors come up, we will write them down here. 

  

## Authors
Do not hesitate to contact us with questions, cartwheels and comments at:  

Milena Schnitzler, Milena.Schnitzler@stud.uni-heidelberg.de 

Leila Hagen, Leila.Hagen@stud.uni-heidelberg.de 

  
  

## Acknowledgments 

Dugord, P. A.; Lauf, S.; Schuster, C. & Kleinschmit, B. (2014): “Land use patterns, temperature distribution, and potential heat stress risk–the case study Berlin, Germany”. *Computers, Environment and Urban Systems*, 48, 86-98. 
