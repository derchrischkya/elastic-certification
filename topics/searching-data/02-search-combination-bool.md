# Example
When spinning up the single node cluster, the index `flights` was created with sample data. Now lets search for some data!

We want to combine the `term` and `match` query to find all flights from Delta in Arizona.

# Code
#### Combinate `term and match` query

```json
GET /flights/_search
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

- 5 documents found
```
{
  "took": 3,
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
```

#### Combinate `term or match` query

```json
GET /flights/_search
{
  "size": 0,
  "query": {
    "bool": {
      "should": [
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

```
{
  "took": 3,
  "timed_out": false,
  "_shards": {
    "total": 1,
    "successful": 1,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": {
      "value": 357,
      "relation": "eq"
    },
    "max_score": null,
    "hits": []
  }
}
```

#### Combination `term or match with must_not` query

```json
{
  "took": 5,
  "timed_out": false,
  "_shards": {
    "total": 1,
    "successful": 1,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": {
      "value": 4643,
      "relation": "eq"
    },
    "max_score": null,
    "hits": []
  }
}
```