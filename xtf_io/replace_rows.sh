#!/bin/bash

echo "======================================================="
echo "Inserts into existing schema. Deletes prexisting data."
echo "Schema: $1"
echo "XTF-File (rel. to working dir): $2"
echo "User: $3"
echo "Pass: [last argument]"
echo "======================================================="

java -jar ~/tools/ili2pg-4.3.2/ili2pg-4.3.2.jar \
--import --deleteData \
--dbhost localhost --dbport 54321 --dbdatabase edit --dbusr $3 --dbpwd $4 \
--dbschema $1 \
$(pwd)/$2

echo "======================================================="
echo "Inserts into existing schema. Deletes prexisting data."
echo "Schema: $1"
echo "XTF-File (rel. to working dir): $2"
echo "User: $3"
echo "Pass: [last argument]"
echo "======================================================="