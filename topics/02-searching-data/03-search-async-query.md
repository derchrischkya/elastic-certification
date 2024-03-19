# Deployment 

- Check out the [deployment](../../deployment/single-node/README.md) section to spin up an Elasticsearch cluster.

# Example
When spinning up the `single-node` cluster, the index `flights` was created with sample data. Now lets search for some data!

Sometimes an search needs time to be executed. This is the case when the data is too large or the query is too complex. In this case, we can use the `_async_search` API to execute the search query asynchronously. 

Lets use the combined search queries from the previous example and execute it asynchronously.

The method of the searches changes from `GET` to `POST` and the endpoint from `_search` to `_async_search`.

# Reference
- https://www.elastic.co/guide/en/elasticsearch/reference/current/async-search.html

# Code
#### Combinate `term and match` query

```json
POST /flights/_async_search?wait_for_completion_timeout=0
{
  "size": 0,
  "query": {
    "bool": {
      "must": [
          {"match": {
            "UNIQUE_CARRIER_NAME": "Delta"
          }
          },
          {
            "term": { 
              "ORIGIN_STATE_NM": "Arizona"
            }
          }
      ]
    }
  }
}
```

- id is `FjlDNldRMExOU2dHb3RxMFJSaUl2UkEdTGlPc0xTbk1TOENpakNHZ0RCWWU2QToxMDMyNzY=`
```json
{
  "id": "FjlDNldRMExOU2dHb3RxMFJSaUl2UkEdTGlPc0xTbk1TOENpakNHZ0RCWWU2QToxMDMyNzY=",
  "is_partial": true,
  "is_running": true,
  "start_time_in_millis": 1710424522505,
  "expiration_time_in_millis": 1710856522505,
  "response": {
    "took": 29,
    "timed_out": false,
    "terminated_early": false,
    "num_reduce_phases": 0,
    "_shards": {
      "total": 1,
      "successful": 0,
      "skipped": 0,
      "failed": 0
    },
    "hits": {
      "total": {
        "value": 0,
        "relation": "gte"
      },
      "max_score": null,
      "hits": []
    }
  }
}
```

#### Check the status of the async search

```
GET /_async_search/FjlDNldRMExOU2dHb3RxMFJSaUl2UkEdTGlPc0xTbk1TOENpakNHZ0RCWWU2QToxMDMyNzY=
```

```json
{
  "id": "FjlDNldRMExOU2dHb3RxMFJSaUl2UkEdTGlPc0xTbk1TOENpakNHZ0RCWWU2QToxMDMyNzY=",
  "is_partial": false,
  "is_running": false,
  "start_time_in_millis": 1710424522505,
  "expiration_time_in_millis": 1710856522505,
  "completion_time_in_millis": 1710424522540,
  "response": {
    "took": 35,
    "timed_out": false,
    "_shards": {
      "total": 1,
      "successful": 1,
      "skipped": 0,
      "failed": 0
    },
    "hits": {
      "total": {
        "value": 5,
        "relation": "eq"
      },
      "max_score": null,
      "hits": []
    }
  }
}
```

#### Delete the async search

```json
DELETE /_async_search/FjlDNldRMExOU2dHb3RxMFJSaUl2UkEdTGlPc0xTbk1TOENpakNHZ0RCWWU2QToxMDMyNzY=
```

```json
{
  "acknowledged": true
}
```
