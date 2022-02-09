#preparation of the calculation (IOS)
export PROJ_LIB="/Applications/QGIS-LTR.app/Contents/Resources/proj"
export PATH=/Applications/QGIS-LTR.app/Contents/MacOS/bin:$PATH

district=Rohrbach

# 2. Processing building density
# 2.1 Import & clip in GRASS Gis
echo "Import building layer"
v.import --overwrite input=./Gebaeudedichte/Gebaeude.shp output=Gebaeude
#import building layer
echo "Clip building layer"
v.clip --overwrite input=Gebaeude clip=$district output=Gebaeude_$district
#clip building layer to selected district

# 2.2 Calculate the building density in GRASS Gis
echo "Calculation of building density"
v.kernel --overwrite input=Gebaeude_$district output=Gebaeudedichte_$district radius=200
#calculate the building density with a radius of 200m

# 2.3 Reclassify the building density
echo "Transformation in integers"
r.mapcalc expression="Gebaeudedichte_integer_$district = Gebaeudedichte_$district@$district * 100000000"
#turn floating point raster into integer data set
echo "Reklassification of building density"
r.reclass --overwrite input=Gebaeudedichte_integer_$district@$district output=Gebaeudedichte_reclass_$district rules=./Gebaeudedichte/Klassen_Gebaeudedichte.txt
#reclassify the building density

# 2.4 Export the interim result
echo "Export of building density"
r.out.gdal input=Gebaeudedichte_reclass_$district@$district output=./Gebaeudedichte/Gebaeudedichte_reclass_$district format=GTiff
#export Gebaeudedichte_final_$district (Raster) as GTiff
