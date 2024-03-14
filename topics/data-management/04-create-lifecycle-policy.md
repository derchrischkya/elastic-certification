# Example
Create an index `weather` with following lifecycle policy:
- `warm` phase: 30 days
    - `forcemerge` action
- `cold` phase: 60 days
    - `readonly` action
    - `frozen` action
- `delete` phase: 90 days
    - `delete` action


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
            "readonly": {},
            "frozen": {}
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

#### Create index
```json
PUT /weather
{
  "settings": {
    "index.lifecycle.name": "my_policy",
    "number_of_shards": 1,
    "number_of_replicas": 0
  }
}
```

# Prove of work
The health of the index should be green!

#### Check index
```json
GET /weather
```

```
{
  "weather": {
    "aliases": {},
    "mappings": {},
    "settings": {
      "index": {
        "lifecycle": {
          "name": "my_policy"
        },
        "routing": {
          "allocation": {
            "include": {
              "_tier_preference": "data_content"
            }
          }
        },
        "number_of_shards": "1",
        "provided_name": "weather",
        "creation_date": "1710365847257",
        "number_of_replicas": "0",
        "uuid": "jYxlk-NbT7WK9kmkK_JLMQ",
        "version": {
          "created": "8500010"
        }
      }
    }
  }
}
```

#### Check lifecycle policy assigned to index
```json
GET /weather/_ilm/explain
```

```json
{
  "indices": {
    "weather": {
      "index": "weather",
      "managed": true,
      "policy": "my_policy",
      "index_creation_date_millis": 1710365847257,
      "time_since_index_creation": "21.16m",
      "lifecycle_date_millis": 1710365847257,
      "age": "21.16m",
      "phase": "new",
      "phase_time_millis": 1710365847945,
      "action": "complete",
      "action_time_millis": 1710365847945,
      "step": "complete",
      "step_time_millis": 1710365847945,
      "phase_execution": {
        "policy": "my_policy",
        "version": 1,
        "modified_date_in_millis": 1710365668869
      }
    }
  }
}
```