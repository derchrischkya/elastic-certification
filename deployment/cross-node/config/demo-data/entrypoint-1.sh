
#Install curl and unzip
echo "Starting the entrypoint.sh script"
apk add --no-cache curl
apk add --no-cache unzip

cd /demo-data

# Unzip flights.zip
unzip -o flights.zip
if [ $? -ne 0 ]; then
  echo "Failed to unzip flights.zip"
  exit 1
fi
# Import create flights index
curl -s -H "Content-Type: application/json" -XPUT "${ELASTICSEARCH_HOST:-elasticsearch}:9200/flights?pretty" -u elastic:${ELASTIC_PASSWORD} -d @elasticsearch-flights-1.json
if [ $? -ne 0 ]; then
  echo "Failed to create flights index"
  exit 1
else
    echo "The flights index was created successfully"
fi

# Import flights.csv to elasticsearch
curl -s -H "Content-Type: application/x-ndjson" -XPOST "${ELASTICSEARCH_HOST:-elasticsearch}:9200/flights/_bulk" -u elastic:${ELASTIC_PASSWORD} --data-binary "@flights.json"
rm -rf flights.json
if [ $? -ne 0 ]; then
  echo "Failed to import flights.csv"
  exit 1
else
  echo "The flights.json was imported successfully"
fi


# Create Kibana data view
curl -s -H "Content-Type: application/json" -H "kbn-xsrf: reporting" -XPOST "${KIBANA_HOST:-kibana}:5601/api/data_views/data_view" -u elastic:${ELASTIC_PASSWORD} -d @kibana-flights.json
if [ $? -ne 0 ]; then
  echo "Failed to create Kibana data view"
  echo "The error is: $?"
  exit 1
else
  echo "The Kibana data view was created successfully"
fi