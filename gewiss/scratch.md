# Schema anlegen

./start-gretl.sh --docker-image sogis/gretl:latest --docker-network host --topic-name afu_gewaesser --schema-dirname schema dropSchema


./start-gretl.sh --docker-image sogis/gretl:latest --docker-network host --topic-name afu_gewaesser --schema-dirname schema createSchema configureSchema

# CSV-Job starten

./start-gretl.sh --docker-image sogis/gretl:latest --docker-network host --job-directory $PWD/afu_oekomorphologie_csvimport
