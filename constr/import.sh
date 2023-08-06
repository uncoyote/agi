java -jar ~/tools/ili2gpkg-4.9.1/ili2gpkg-4.9.1.jar \
--import --dbfile $(pwd)/tmp/constraints.gpkg --modeldir "$(pwd);http://models.interlis.ch/" --models Constraints \
$(pwd)/data.xtf