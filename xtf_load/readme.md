# Transferzeiten in Sekunden

|Variante|Anzahl Objekte|Export|Import|Total|
|---|---|---|---|---|
|XTF|300'000|10|300|310|
|Db2Db|300'000|-|-|30|
|Shp|300'000|-|-|-|
|XTF|6'000'000|?|?|?|
|Db2Db|6'000'000|-|-|700|

# Aufrufe

## Schema

./start-gretl.sh --docker-image sogis/gretl:latest --docker-network host --topic-name afu_igel --schema-dirname schema_pub createSchema configureSchema 

Erstellen Schema für Shapefie via ddl.sql

## Jobs

### Xtf und Db2Db

./start-gretl.sh --docker-image sogis/gretl:latest --docker-network host --job-directory $PWD/../agi/xtf_load/xtf_db

### Shp

./start-gretl.sh --docker-image sogis/gretl:latest --docker-network host --job-directory $PWD/../agi/xtf_load/shp



