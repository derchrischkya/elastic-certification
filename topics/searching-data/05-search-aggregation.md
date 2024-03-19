# Deployment 

- Check out the [deployment](../../deployment/single-node/README.md) section to spin up an Elasticsearch cluster.

# Example
When spinning up the `single-node` cluster, the index `flights` was created with sample data. Now lets search for some data!

- Create a bucket aggregation to group documents by the `UNIQUE_CARRIER`.

- Create a metric aggregation to calculate the average,min, max, count and sum `DISTANCE` for all documents.

- Create a pipeline aggregation to accumulate the `DISTANCE` for a histogram based on `DISTANCE` with an interval of 500.



# Theory

- Bucket aggregations
  - A bucket aggregation groups documents into buckets based on the value of a field or expression and then applies sub-aggregations to each bucket. 
- Metric aggregations
  - A metric aggregation calculates and returns a metric on the values extracted from the aggregated documents.
- Pipeline aggregations
  - A pipeline aggregation performs an aggregation across the values of many buckets. The input to the aggregation is the output of a previous aggregation.

# Reference
- https://www.elastic.co/guide/en/elasticsearch/reference/8.13/search-aggregations.html

# Code
#### Bucket aggregation 
```json
GET /flights/_search?size=0 
{
  "aggs": {
    "types": {
      "terms": {
        "field": "UNIQUE_CARRIER"
      }
    }
  }
}
```

```json
{
  "took": 6,
  "timed_out": false,
  "_shards": {
    "total": 1,
    "successful": 1,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": {
      "value": 5000,
      "relation": "eq"
    },
    "max_score": null,
    "hits": []
  },
  "aggregations": {
    "types": {
      "doc_count_error_upper_bound": 0,
      "sum_other_doc_count": 2231,
      "buckets": [
        {
          "key": "SY",
          "doc_count": 644
        },
        {
          "key": "09Q",
          "doc_count": 363
        },
        {
          "key": "3FQ",
          "doc_count": 267
        },
        {
          "key": "04Q",
          "doc_count": 263
        },
        {
          "key": "DL",
          "doc_count": 241
        },
        {
          "key": "VJT",
          "doc_count": 216
        },
        {
          "key": "6F",
          "doc_count": 209
        },
        {
          "key": "LF",
          "doc_count": 192
        },
        {
          "key": "8E",
          "doc_count": 187
        },
        {
          "key": "G4",
          "doc_count": 187
        }
      ]
    }
  }
}
```

#### Metric aggregation
```json
GET /flights/_search?size=0
{
  "aggs": {
    "distance_stats": { "stats": { "field": "DISTANCE" } }
  }
}
```

```json
{
  "took": 2,
  "timed_out": false,
  "_shards": {
    "total": 1,
    "successful": 1,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": {
      "value": 5000,
      "relation": "eq"
    },
    "max_score": null,
    "hits": []
  },
  "aggregations": {
    "distance_stats": {
      "count": 5000,
      "min": 0,
      "max": 9552,
      "avg": 912.2368,
      "sum": 4561184
    }
  }
}
```

#### Pipeline aggregation
```json
POST /flights/_search
{
  "size": 0,
  "aggs": {
    "test": {
      "histogram": {
        "field": "DISTANCE",
        "interval": 500
      },
      "aggs": {
        "distance_passed": {
          "sum": {
            "field": "DISTANCE"
          }
        },
        "cumulative_distance": {
          "cumulative_sum": {
            "buckets_path": "distance_passed"
          }
        }
      }
    }
  }
}
```

```json
{
  "took": 16,
  "timed_out": false,
  "_shards": {
    "total": 1,
    "successful": 1,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": {
      "value": 5000,
      "relation": "eq"
    },
    "max_score": null,
    "hits": []
  },
  "aggregations": {
    "test": {
      "buckets": [
        {
          "key": 0,
          "doc_count": 2429,
          "distance_passed": {
            "value": 500664
          },
          "cumulative_distance": {
            "value": 500664
          }
        },
        {
          "key": 500,
          "doc_count": 1145,
          "distance_passed": {
            "value": 836358
          },
          "cumulative_distance": {
            "value": 1337022
          }
        },
        {
          "key": 1000,
          "doc_count": 603,
          "distance_passed": {
            "value": 727913
          },
          "cumulative_distance": {
            "value": 2064935
          }
        },
        {
          "key": 1500,
          "doc_count": 277,
          "distance_passed": {
            "value": 473637
          },
          "cumulative_distance": {
            "value": 2538572
          }
        },
        {
          "key": 2000,
          "doc_count": 168,
          "distance_passed": {
            "value": 376062
          },
          "cumulative_distance": {
            "value": 2914634
          }
        },
        {
          "key": 2500,
          "doc_count": 59,
          "distance_passed": {
            "value": 156564
          },
          "cumulative_distance": {
            "value": 3071198
          }
        },
        {
          "key": 3000,
          "doc_count": 58,
          "distance_passed": {
            "value": 192457
          },
          "cumulative_distance": {
            "value": 3263655
          }
        },
        {
          "key": 3500,
          "doc_count": 62,
          "distance_passed": {
            "value": 234900
          },
          "cumulative_distance": {
            "value": 3498555
          }
        },
        {
          "key": 4000,
          "doc_count": 36,
          "distance_passed": {
            "value": 153570
          },
          "cumulative_distance": {
            "value": 3652125
          }
        },
        {
          "key": 4500,
          "doc_count": 56,
          "distance_passed": {
            "value": 268217
          },
          "cumulative_distance": {
            "value": 3920342
          }
        },
        {
          "key": 5000,
          "doc_count": 38,
          "distance_passed": {
            "value": 199183
          },
          "cumulative_distance": {
            "value": 4119525
          }
        },
        {
          "key": 5500,
          "doc_count": 33,
          "distance_passed": {
            "value": 190059
          },
          "cumulative_distance": {
            "value": 4309584
          }
        },
        {
          "key": 6000,
          "doc_count": 10,
          "distance_passed": {
            "value": 62512
          },
          "cumulative_distance": {
            "value": 4372096
          }
        },
        {
          "key": 6500,
          "doc_count": 13,
          "distance_passed": {
            "value": 87890
          },
          "cumulative_distance": {
            "value": 4459986
          }
        },
        {
          "key": 7000,
          "doc_count": 8,
          "distance_passed": {
            "value": 58765
          },
          "cumulative_distance": {
            "value": 4518751
          }
        },
        {
          "key": 7500,
          "doc_count": 1,
          "distance_passed": {
            "value": 7585
          },
          "cumulative_distance": {
            "value": 4526336
          }
        },
        {
          "key": 8000,
          "doc_count": 2,
          "distance_passed": {
            "value": 16126
          },
          "cumulative_distance": {
            "value": 4542462
          }
        },
        {
          "key": 8500,
          "doc_count": 0,
          "distance_passed": {
            "value": 0
          },
          "cumulative_distance": {
            "value": 4542462
          }
        },
        {
          "key": 9000,
          "doc_count": 1,
          "distance_passed": {
            "value": 9170
          },
          "cumulative_distance": {
            "value": 4551632
          }
        },
        {
          "key": 9500,
          "doc_count": 1,
          "distance_passed": {
            "value": 9552
          },
          "cumulative_distance": {
            "value": 4561184
          }
        }
      ]
    }
  }
}
```