#Preparation of the calculation (IOS)
export PROJ_LIB="/Applications/QGIS-LTR.app/Contents/Resources/proj"
export PATH=/Applications/QGIS-LTR.app/Contents/MacOS/bin:$PATH

district=Rohrbach

# 3. Processing Land Cover
# 3.1 Reproject and clip Land Cover layer to the extent of the selected district
echo "Reproject and clip"
gdalwarp -overwrite -t_srs EPSG:25832 -cutline ./Vorbereitung/$district.shp -crop_to_cutline -dstnodata -9999 -dstalpha ./LandCover/Land_Cover_DE_2015.tif ./LandCover/Land_cover_$district.tif

# 3.2 Import & reclassify in GRASS GIS
echo "Import and reclassify"
r.import input=./LandCover/Land_cover_$district.tif output=Land_cover_$district --overwrite
r.reclass input=Land_cover_$district.1@$district output=LC_reclass_$district@$district rules=./LandCover/reclass_LC.txt --overwrite

# 3.3 Export the result
echo "Export"
r.out.gdal input=LC_reclass_$district@$district output=./LandCover/LC_reclass_$district format=GTiff --overwrite
