#!/bin/bash

java -jar ~/tools/ili2pg-4.3.2/ili2pg-4.3.2.jar \
--import \
--dbhost localhost --dbport 54321 --dbdatabase edit --dbusr ddluser --dbpwd ddluser \
--dbschema afu_gewaesser_v1 \
$(pwd)/.gitignored/gewisso2.xtf