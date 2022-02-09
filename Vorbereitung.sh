#Preparation of the calculation (IOS)
export PROJ_LIB="/Applications/QGIS-LTR.app/Contents/Resources/proj"
export PATH=/Applications/QGIS-LTR.app/Contents/MacOS/bin:$PATH

district=Rohrbach
#define the desired region

# 1. Preparation

# 1.1 Preparation of the selected region
echo "extract region"
ogr2ogr -f "ESRI Shapefile" ./Vorbereitung/0_$district.shp -sql "SELECT * FROM stadtteile WHERE name = '$district'" ./Vorbereitung/stadtteile.shp
#extraction of the selected region and storage of this as Shapefile
echo "reproject region"
ogr2ogr -s_srs EPSG:4326 -t_srs EPSG:25832 -f "ESRI Shapefile" ./Vorbereitung/$district.shp ./Vorbereitung/0_$district.shp
#reprojection of the selected region

# 1.2 Preparation in GRASS Gis
echo "set mapset"
g.mapset mapset=$district location=Heidelberg
#change in the mapset of the selected region
echo "request geographic region"
g.region -p
#names the borders of the current region
echo "import region"
v.import --overwrite input=./Vorbereitung/$district.shp
#imports vectordata of the selected region
echo "set geographic region"
g.region vector=$district@$district
#sets geographic region to the extent of th selected region
