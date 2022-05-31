#!/bin/bash

echo "======================================================="
echo "Exports the schema into ./.gitignored/export.xtf"
echo "Schema: $1"
echo "Model: $2"
echo "User: $3"
echo "Pass: [last argument]"
echo "======================================================="

java -jar ~/tools/ili2pg-4.3.2/ili2pg-4.3.2.jar \
--export \
--dbhost localhost --dbport 54321 --dbdatabase edit --dbusr $3 --dbpwd $4 \
--dbschema $1 --models $2 \
$(pwd)/.gitignored/export.xtf

echo "======================================================="
echo "Exports the schema into ./.gitignored/export.xtf"
echo "Schema: $1"
echo "Model: $2"
echo "User: $3"
echo "Pass: [last argument]"
echo "======================================================="