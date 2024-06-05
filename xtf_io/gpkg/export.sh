#!/bin/bash

echo "======================================================="
echo Exports from data.gpkg into export.xtf
echo "Folder with data: $1"
echo "Model to export: $2"
echo "======================================================="

java -jar ~/tools/ili2gpkg-5.1.0/ili2gpkg-5.1.0.jar \
--export \
--models $2 \
--dbfile $1/data.gpkg \
$1/export.xtf

echo "======================================================="
echo Exports from data.gpkg into export.xtf
echo "Folder with data: $1"
echo "Model to export: $2"
echo "======================================================="

