#!/bin/sh
export PROJ_LIB="/Applications/QGIS-LTR.app/Contents/Resources/proj"
export PATH=/Applications/QGIS-LTR.app/Contents/MacOS/bin:$PATH

district=Rohrbach

# 5. Results calculated with the raster calculator of gdal
# 5.1 Result No1 without weighting
echo "Result1"
gdal_calc.py -A ./LST/LST_reclass_$district -B ./LandCover/LC_reclass_$district -C ./Gebaeudedichte/Gebaeudedichte_reclass_$district --outfile=./Result/result1.tif --calc="A+B+C" --overwrite

#5.2 Resuklt No2 weighting: LST*2 + LC*1.5 + Gebäudedichte
echo "Result2"
gdal_calc.py -A ./LST/LST_reclass_$district -B ./LandCover/LC_reclass_$district -C ./Gebaeudedichte/Gebaeudedichte_reclass_$district --outfile=./Result/result2.tif --calc="A*2+B*1.5+C" --overwrite

#5.3 Result No3 weighting: LST*2 + LC*1.5 + Gebäudedichte*2
echo "Result3"
gdal_calc.py -A ./LST/LST_reclass_$district -B ./LandCover/LC_reclass_$district -C ./Gebaeudedichte/Gebaeudedichte_reclass_$district --outfile=./Result/result3.tif --calc="A*2+B*1.5+C*2" --overwrite

# 5.4 Result No4 weighting: LST + LC*2.5 + Gebäudedichte*2
echo "Result4"
gdal_calc.py -A ./LST/LST_reclass_$district -B ./LandCover/LC_reclass_$district -C ./Gebaeudedichte/Gebaeudedichte_reclass_$district --outfile=./Result/result4.tif --calc="A+B*2.5+C*2" --overwrite

# 5.5 Result No5 weighting: LST + LC*2 + Gebäudedichte
echo "Result5"
gdal_calc.py -A ./LST/LST_reclass_$district -B ./LandCover/LC_reclass_$district -C ./Gebaeudedichte/Gebaeudedichte_reclass_$district --outfile=./Result/result5.tif --calc="A+B*2+C" --overwrite
