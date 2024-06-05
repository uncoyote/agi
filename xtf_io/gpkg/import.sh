#!/bin/bash

echo "======================================================="
echo Imports from import.xtf into data.gpkg
echo "Folder with data: $1"
echo "======================================================="

java -jar ~/tools/ili2gpkg-5.1.0/ili2gpkg-5.1.0.jar \
--import --doSchemaImport \
--dbfile $1/data.gpkg \
$1/import.xtf

echo "======================================================="
echo Imports from data.xtf into data.gpkg
echo "Folder with data: $1"
echo "======================================================="