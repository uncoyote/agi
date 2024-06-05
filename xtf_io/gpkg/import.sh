#!/bin/bash

echo "======================================================="
echo Imports from import.xtf into data.gpkg.
echo Assumes the geojson is located in ~/code/agi/xtf_io/gpkg.
echo "Folder with data: $1"
echo "======================================================="

ogr2ogr -f "GPKG" $1/data.gpkg ~/code/agi/xtf_io/gpkg/gpkg_create_dummy.geojson

java -jar ~/tools/ili2gpkg-5.1.0/ili2gpkg-5.1.0.jar \
--import --doSchemaImport \
--dbfile $1/data.gpkg \
$1/import.xtf

echo "======================================================="
echo Imports from import.xtf into data.gpkg.
echo Assumes the geojson is located in ~/code/agi/xtf_io/gpkg.
echo "Folder with data: $1"
echo "======================================================="