# Example
Create index `weather` with the following requirements:
- Field `temperature` should be of type `float`
- Field `location` should be of type `geo_point`
- Field `timestamp` should be of type `date`

# Reference
https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-create-index.html

# Code
```json
PUT /weather
{ "settings": { 
    "number_of_shards": 1,
    "number_of_replicas": 0
    },
  "mappings": {
    "properties": {
      "temperature": {
        "type": "float"
      },
      "location": {
        "type": "geo_point"
      },
      "timestamp": {
        "type": "date"
      }
    }
  }
}
```
# Output
The health of the index should be green!

#### Check index health
```json
GET /_cat/indices/weather?v
```
```json

health status index   uuid                   pri rep docs.count docs.deleted store.size pri.store.size dataset.size
green  open   weather CAv0XeCzRc6Hf4SDkRp4dA   1   0          0            0       227b           227b         227b
```

#### Check index mapping
```json
GET /weather
```
```json
{
  "weather": {
    "aliases": {},
    "mappings": {
      "properties": {
        "location": {
          "type": "geo_point"
        },
        "temperature": {
          "type": "float"
        },
        "timestamp": {
          "type": "date"
        }
      }
    },
    "settings": {
      "index": {
        "number_of_shards": "1",
        "number_of_replicas": "0",
        "...": "..."
      }
    }
  }
}
```