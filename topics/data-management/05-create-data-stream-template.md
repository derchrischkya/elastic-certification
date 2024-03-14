# Example
Create an data-stream `weather_stream` with following lifecycle policy:
- `warm` phase: 30 days
- `cold` phase: 60 days
- `delete` phase: 90 days


# Reference
- https://www.elastic.co/guide/en/elasticsearch/reference/current/set-up-lifecycle-policy.html
- https://www.elastic.co/guide/en/elasticsearch/reference/current/ilm-put-lifecycle.html

# Code
#### Create lifecycle policy
```json
PUT _ilm/policy/my_policy
{
  "policy": {
    "_meta": {
      "description": "used for weather data",
      "project": {
        "name": "Weather",
        "department": "Testing"
      }
    },
    "phases": {
      "warm": {
        "min_age": "30d",
        "actions": {
          "forcemerge": {
            "max_num_segments": 1
          }
        }
      },
        "cold": {
            "min_age": "60d",
            "actions": {
            "readonly": {}
            }
        },
      "delete": {
        "min_age": "90d",
        "actions": {
          "delete": {}
        }
      }
    }
  }
}
```
#### Create index template 
```json
PUT /_index_template/template_weather
{
  "index_patterns": [
    "weather_stream"
  ],
  "data_stream": {},
  "template": {
    "settings": {
      "index.lifecycle.name": "my_policy",
      "number_of_shards": 1,
      "number_of_replicas": 0
    }
  }
}
```

#### Create data stream
```json
PUT /_data_stream/weather_stream
```

# Prove of work
The health of the index should be green!

#### Check data stream
```json
GET /_data_stream/weather_stream
```

```json
{
  "data_streams": [
    {
      "name": "weather_stream",
      "timestamp_field": {
        "name": "@timestamp"
      },
      "indices": [
        {
          "index_name": ".ds-weather_stream-2024.03.14-000001",
          "index_uuid": "1bS7o7gUS3GipoqEWf9V5A",
          "prefer_ilm": true,
          "ilm_policy": "my_policy",
          "managed_by": "Index Lifecycle Management"
        }
      ],
      "generation": 1,
      "status": "GREEN",
      "template": "template_weather",
      "ilm_policy": "my_policy",
      "next_generation_managed_by": "Index Lifecycle Management",
      "prefer_ilm": true,
      "hidden": false,
      "system": false,
      "allow_custom_routing": false,
      "replicated": false
    }
  ]
}
```