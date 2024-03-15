#Install curl and unzip
echo "Starting the entrypoint.sh script"
apk add --no-cache curl
apk add --no-cache unzip

# Unzip flights.zip
unzip -o flights.zip
if [ $? -ne 0 ]; then
  echo "Failed to unzip flights.zip"
  exit 1
fi
# Import create flights index
curl -k -s -H "Content-Type: application/json" -XPUT "https://${ELASTICSEARCH_HOST:-elasticsearch}:9200/flights?pretty" -u elastic:${ELASTIC_PASSWORD} -d @elasticsearch-flights-2.json
if [ $? -ne 0 ]; then
  echo "Failed to create flights index"
  exit 1
else
    echo "The flights index was created successfully"
fi

curl -k -s -H "Content-Type: application/x-ndjson" -XPOST "https://${ELASTICSEARCH_HOST:-elasticsearch}:9200/flights/_bulk" -u elastic:${ELASTIC_PASSWORD} --data-binary @dummy.json
if [ $? -ne 0 ]; then
  echo "Failed to import dummy data"
  exit 1
else
  echo "The dummy data was imported successfully"
fi
