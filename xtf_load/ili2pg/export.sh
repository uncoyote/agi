#!/bin/bash

java -jar ~/tools/ili2pg-4.9.1/ili2pg-4.9.1.jar \
--export \
--dbhost localhost --dbport 54322 --dbdatabase pub --dbusr ddluser --dbpwd ddluser \
--dbschema afu_igel_pub_v1 --models SO_AFU_Igel_Publikation_20211116 \
--disableValidation \
$(pwd)/build/export.xtf

