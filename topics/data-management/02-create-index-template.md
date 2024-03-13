# Example
Create index template for the `weather` indicies with the following requirements:
- Field `temperature` should be of type `float`
- Field `location` should be of type `geo_point`
- Field `timestamp` should be of type `date`
- Add Runtime field `day_of_week` should be of type `keyword`

# Reference
https://www.elastic.co/guide/en/elasticsearch/reference/current/index-templates.html

# Code
```json
PUT /_index_template/template_weather
{
  "index_patterns": [
    "weather*"
  ],
  "template": {
    "settings": {
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
      },
      "runtime": {
        "day_of_week": {
          "type": "keyword",
          "script": {
            "source": "emit(doc['@timestamp'].value.dayOfWeekEnum.getDisplayName(TextStyle.FULL, Locale.ROOT))"
          }
        }
      }
    }
  }
}
```
# Output
The health of the index should be green!

#### Check the index template exists

```json
GET /_index_template/template_weather
```
```json
{
  "index_templates": [
    {
      "name": "template_weather",
      "index_template": {
        "index_patterns": [
          "weather*"
        ],
        "template": {
          "settings": {
            "index": {
              "number_of_shards": "1",
              "number_of_replicas": "0"
            }
          },
          "mappings": {
            "runtime": {
              "day_of_week": {
                "type": "keyword",
                "script": {
                  "source": "emit(doc['@timestamp'].value.dayOfWeekEnum.getDisplayName(TextStyle.FULL, Locale.ROOT))"
                }
              }
            },
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
        },
        "composed_of": []
      }
    }
  ]
}
```

#### Create indices (last one with typo)
```json
PUT /weather-1
PUT /weather-2
PUT /waether-3
```


#### Check the index is effected by the template

The index template works fine for the first two indices, but the REGEX `weather*` is not matching `waether-3` index.

```json
GET /weather-1
```
```json
{
  "weather-1": {
    "aliases": {},
    "mappings": {
      "runtime": {
        "day_of_week": {
          "type": "keyword",
          "script": {
            "source": "emit(doc['@timestamp'].value.dayOfWeekEnum.getDisplayName(TextStyle.FULL, Locale.ROOT))"
          }
        }
      }
    }
  }
  ...
}
```

```json
GET /weather-2
```
```json
{
  "weather": {
    "aliases": {},
    "mappings": {
      "runtime": {
        "day_of_week": {
          "type": "keyword",
          "script": {
            "source": "emit(doc['@timestamp'].value.dayOfWeekEnum.getDisplayName(TextStyle.FULL, Locale.ROOT))",
            "lang": "painless"
          }
        }
      }
    }
  }
  ...
}
```

```json
GET /waether-3
```
```json
{
  "waether-3": {
    "aliases": {},
    "mappings": {},
    "settings": {
      "index": {
        "routing": {
          "allocation": {
            "include": {
              "_tier_preference": "data_content"
            }
          }
        }
      }
    }
  }
  ...
}
```

#### Check day_of_week runtime field is working

Create one document in `weather-1` index and check the `day_of_week` field is created.

```json
POST /weather-1/_doc/1
{
  "@timestamp": "2022-01-01T00:00:00",
  "temperature": 20,
  "location": "40.12, -71.34"
}
```

```json
GET /weather-1/_search
{
  "query": {
    "terms": {
      "_id": [ "1" ] 
    }
  },
  "fields": [
    "@timestamp",
    "day_of_week"
  ]
}
```
```json
{
  "took": 7,
  "timed_out": false,
  "_shards": {
    "total": 1,
    "successful": 1,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": {
      "value": 1,
      "relation": "eq"
    },
    "max_score": 1,
    "hits": [
      {
        "_index": "weather-1",
        "_id": "1",
        "_score": 1,
        "_source": {
          "@timestamp": "2022-01-01T00:00:00",
          "temperature": 20,
          "location": "40.12, -71.34"
        },
        "fields": {
          "@timestamp": [
            "2022-01-01T00:00:00.000Z"
          ],
          "day_of_week": [
            "Saturday"
          ]
        }
      }
    ]
  }
}
```

