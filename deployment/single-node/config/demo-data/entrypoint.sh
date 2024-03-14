
#Install curl and unzip
apk add --no-cache curl
apk add --no-cache unzip

cd /demo-data
# Unzip flights.zip
unzip -o flights.zip

# Import create flights index
curl -H "Content-Type: application/json" -XPUT "elasticsearch:9200/flights?pretty" -u elastic:${ELASTIC_PASSWORD} -d @elasticsearch-flights.json


# Import flights.csv to elasticsearch
curl -H "Content-Type: application/x-ndjson" -XPOST "elasticsearch:9200/flights/_bulk" -u elastic:${ELASTIC_PASSWORD} --data-binary "@flights.json"
rm -rf flights.json

# Create Kibana data view
curl -H "Content-Type: application/json" -H "kbn-xsrf: reporting" -XPOST "kibana:5601/api/data_views/data_view" -u elastic:${ELASTIC_PASSWORD} -d @kibana-flights.json