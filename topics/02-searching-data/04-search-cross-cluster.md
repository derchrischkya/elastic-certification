# Deployment 

- Check out the [deployment](../../deployment/cross-node/README.md) section to spin up an Elasticsearch cluster.

# Example
When spinning up the `cross-node` cluster, the index `flights` was created on node `elasticsearch-1` with sample data. But on node `elasticsearch-2` and `elasticsearch-3` there is some weird data. Lets search for some data and find out what is going on!

# Reference
- https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-cross-cluster-search.html
- https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-cross-cluster-search.html#_searching_across_clusters
# Code
#### Connect to remote cross-cluster
```json
PUT /_cluster/settings
{
"persistent": {
    "cluster": {
      "remote": {
        "cluster-node-2": {
          "proxy_address": "elasticsearch-2:9300",
          "mode": "proxy"
        }
      }
    }
}
}
```

```json
PUT /_cluster/settings
{
"persistent": {
    "cluster": {
      "remote": {
        "cluster-node-3": {
          "proxy_address": "elasticsearch-3:9300",
          "mode": "proxy"
        }
      }
    }
}
}
```

#### Check the state of the search remote-cluster
```
GET /_remote/info
```
```json
{
  "cluster-node-2": {
    "connected": true,
    "mode": "proxy",
    "proxy_address": "elasticsearch-2:9300",
    "server_name": "",
    "num_proxy_sockets_connected": 18,
    "max_proxy_socket_connections": 18,
    "initial_connect_timeout": "30s",
    "skip_unavailable": false
  },
  "cluster-node-3": {
    "connected": true,
    "mode": "proxy",
    "proxy_address": "elasticsearch-3:9300",
    "server_name": "",
    "num_proxy_sockets_connected": 18,
    "max_proxy_socket_connections": 18,
    "initial_connect_timeout": "30s",
    "skip_unavailable": false
  }
}
```

#### Search data
```
GET cluster-node-3:flights,cluster-node-2:flights/_search
```

```json
{
  "took": 82,
  "timed_out": false,
  "num_reduce_phases": 3,
  "_shards": {
    "total": 2,
    "successful": 2,
    "skipped": 0,
    "failed": 0
  },
  "_clusters": {
    "total": 2,
    "successful": 2,
    "skipped": 0,
    "running": 0,
    "partial": 0,
    "failed": 0,
    "details": {
      "cluster-node-2": {
        "status": "successful",
        "indices": "flights",
        "took": 23,
        "timed_out": false,
        "_shards": {
          "total": 1,
          "successful": 1,
          "skipped": 0,
          "failed": 0
        }
      },
      "cluster-node-3": {
        "status": "successful",
        "indices": "flights",
        "took": 49,
        "timed_out": false,
        "_shards": {
          "total": 1,
          "successful": 1,
          "skipped": 0,
          "failed": 0
        }
      }
    }
  },
  "hits": {
    "total": {
      "value": 2,
      "relation": "eq"
    },
    "max_score": 1,
    "hits": [
      {
        "_index": "cluster-node-2:flights",
        "_id": "0",
        "_score": 1,
        "_source": {
          "MESSGAE": "I am remote"
        }
      },
      {
        "_index": "cluster-node-3:flights",
        "_id": "0",
        "_score": 1,
        "_source": {
          "MESSGAE": "I am remote"
        }
      }
    ]
  }
}
```