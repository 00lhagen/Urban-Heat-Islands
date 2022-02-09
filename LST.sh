#Preparation of the calculation (IOS)
export PROJ_LIB="/Applications/QGIS-LTR.app/Contents/Resources/proj"
export PATH=/Applications/QGIS-LTR.app/Contents/MacOS/bin:$PATH

district=Rohrbach

# 4. Processing Land Surface Temperature
# 4.1 Reproject and clip Land Surface Temperature layer to the extent of the selected district
echo "Reproject and clip"
gdalwarp -overwrite -t_srs EPSG:25832 -cutline ./Vorbereitung/$district.shp -crop_to_cutline -dstnodata -9999 -dstalpha ./LST/Landsat8_B10_LST.tif ./LST/LST_$district.tif

# 4.2 Import & reklassify in GRASS GIS
echo "Import"
r.import input=./LST/LST_$district.tif output=LST_$district --overwrite
echo "Reclassify"
r.reclass input=LST_$district.1@$district output=LST_reclass_$district@$district rules=./LST/reclass_LST.txt --overwrite

# 4.3 Export result
echo "Export"
r.out.gdal input=LST_reclass_$district@$district output=./LST/LST_reclass_$district format=GTiff --overwrite
