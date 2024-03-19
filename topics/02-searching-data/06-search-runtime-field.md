# Deployment 

- Check out the [deployment](../../deployment/single-node/README.md) section to spin up an Elasticsearch cluster.

# Example
When spinning up the `single-node` cluster, the index `flights` was created with sample data. Now lets search for some data!

- Create the runtime field `DOUBLE_DISTANCE` to retrieve the double value of `DISTANCE` field.


# Reference
- https://www.elastic.co/guide/en/elasticsearch/reference/7.17/search-fields.html#script-fields
- https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-put-mapping.html
-

# Code
#### via Scripted field
```json
GET /flights/_search?size=1
{
  "query": {
    "match_all": {}
  },
  "script_fields": {
    "DOUBLE_DISTANCE": {
      "script": {
        "source": "doc['DISTANCE'].value * params.factor",
        "params": {
          "factor": 2.0
        }
      }
    }
  },
  "fields": [
    "*"
  ]
}
```

```json
{
  "took": 32,
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
    "max_score": 1,
    "hits": [
      {
        "_index": "flights",
        "_id": "0",
        "_score": 1,
        "fields": {
          "MONTH": [
            11
          ],
          "CARRIER_NAME": [
            "Cape Air"
          ],
          "DISTANCE_GROUP": [
            1
          ],
          "DEST_AIRPORT_ID": [
            15027
          ],
          "DEST_CITY_NAME": [
            "Christiansted, VI"
          ],
          "ORIGIN_AIRPORT_SEQ_ID": [
            1484306
          ],
          "ORIGIN_COUNTRY_NAME": [
            "United States"
          ],
          "PAYLOAD": [
            0
          ],
          "CLASS": [
            "F"
          ],
          "DEPARTURES_SCHEDULED": [
            0
          ],
          "CARRIER": [
            "9K"
          ],
          "ORIGIN_WAC": [
            3
          ],
          "QUARTER": [
            4
          ],
          "DEST_AIRPORT_SEQ_ID": [
            1502704
          ],
          "MAIL": [
            0
          ],
          "RAMP_TO_RAMP": [
            0
          ],
          "YEAR": [
            2023
          ],
          "DEST_COUNTRY_NAME": [
            "United States"
          ],
          "DEST_STATE_FIPS": [
            "78"
          ],
          "CARRIER_GROUP_NEW": [
            6
          ],
          "DISTANCE": [
            94
          ],
          "ORIGIN_AIRPORT_ID": [
            14843
          ],
          "UNIQUE_CARRIER": [
            "9K"
          ],
          "AIRCRAFT_CONFIG": [
            1
          ],
          "ORIGIN_CITY_MARKET_ID": [
            34819
          ],
          "REGION": [
            "D"
          ],
          "UNIQUE_CARRIER_NAME": [
            "Cape Air"
          ],
          "DEST_CITY_MARKET_ID": [
            34992
          ],
          "PASSENGERS": [
            0
          ],
          "DEST": [
            "STX"
          ],
          "UNIQUE_CARRIER_ENTITY": [
            "07021"
          ],
          "DEST_STATE_NM": [
            "U.S. Virgin Islands"
          ],
          "DATA_SOURCE": [
            "DU"
          ],
          "DEST_WAC": [
            4
          ],
          "ORIGIN_STATE_NM": [
            "Puerto Rico"
          ],
          "ORIGIN": [
            "SJU"
          ],
          "DEST_COUNTRY": [
            "US"
          ],
          "DEST_STATE_ABR": [
            "VI"
          ],
          "DOUBLE_DISTANCE": [
            188
          ],
          "SEATS": [
            0
          ],
          "AIR_TIME": [
            0
          ],
          "ORIGIN_COUNTRY": [
            "US"
          ],
          "DEPARTURES_PERFORMED": [
            0
          ],
          "ORIGIN_STATE_ABR": [
            "PR"
          ],
          "ORIGIN_CITY_NAME": [
            "San Juan, PR"
          ],
          "ORIGIN_STATE_FIPS": [
            "72"
          ],
          "AIRCRAFT_GROUP": [
            1
          ],
          "AIRCRAFT_TYPE": [
            125
          ],
          "FREIGHT": [
            0
          ],
          "CARRIER_GROUP": [
            1
          ],
          "AIRLINE_ID": [
            20253
          ]
        }
      }
    ]
  }
}
```

#### via Runtime field mapping
```json
PUT /flights/_mapping
{
  "runtime": {
    "DOUBLE_DISTANCE": {
      "type": "keyword",
      "script": """emit((doc['DISTANCE'][0] * 2).toString())"""
    }
  }
}
```

- Check the mapping is working
```json
GET /flights/_search?size=1
{
  "fields": [
    "*"
  ]
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
    "max_score": 1,
    "hits": [
      {
        "_index": "flights",
        "_id": "0",
        "_score": 1,
        "_source": {
          "DEPARTURES_SCHEDULED": "0.00",
          "DEPARTURES_PERFORMED": "0.00",
          "PAYLOAD": "0.00",
          "SEATS": "0.00",
          "PASSENGERS": "0.00",
          "FREIGHT": "0.00",
          "MAIL": "0.00",
          "DISTANCE": "94.00",
          "RAMP_TO_RAMP": "0.00",
          "AIR_TIME": "0.00",
          "UNIQUE_CARRIER": "9K",
          "AIRLINE_ID": "20253",
          "UNIQUE_CARRIER_NAME": "Cape Air",
          "UNIQUE_CARRIER_ENTITY": "07021",
          "REGION": "D",
          "CARRIER": "9K",
          "CARRIER_NAME": "Cape Air",
          "CARRIER_GROUP": "1",
          "CARRIER_GROUP_NEW": "6",
          "ORIGIN_AIRPORT_ID": "14843",
          "ORIGIN_AIRPORT_SEQ_ID": "1484306",
          "ORIGIN_CITY_MARKET_ID": "34819",
          "ORIGIN": "SJU",
          "ORIGIN_CITY_NAME": "San Juan, PR",
          "ORIGIN_STATE_ABR": "PR",
          "ORIGIN_STATE_FIPS": "72",
          "ORIGIN_STATE_NM": "Puerto Rico",
          "ORIGIN_COUNTRY": "US",
          "ORIGIN_COUNTRY_NAME": "United States",
          "ORIGIN_WAC": "3",
          "DEST_AIRPORT_ID": "15027",
          "DEST_AIRPORT_SEQ_ID": "1502704",
          "DEST_CITY_MARKET_ID": "34992",
          "DEST": "STX",
          "DEST_CITY_NAME": "Christiansted, VI",
          "DEST_STATE_ABR": "VI",
          "DEST_STATE_FIPS": "78",
          "DEST_STATE_NM": "U.S. Virgin Islands",
          "DEST_COUNTRY": "US",
          "DEST_COUNTRY_NAME": "United States",
          "DEST_WAC": "4",
          "AIRCRAFT_GROUP": "1",
          "AIRCRAFT_TYPE": "125",
          "AIRCRAFT_CONFIG": "1",
          "YEAR": "2023",
          "QUARTER": "4",
          "MONTH": "11",
          "DISTANCE_GROUP": "1",
          "CLASS": "F",
          "DATA_SOURCE": "DU"
        },
        "fields": {
          "MONTH": [
            11
          ],
          "CARRIER_NAME": [
            "Cape Air"
          ],
          "DISTANCE_GROUP": [
            1
          ],
          "DEST_AIRPORT_ID": [
            15027
          ],
          "DEST_CITY_NAME": [
            "Christiansted, VI"
          ],
          "ORIGIN_AIRPORT_SEQ_ID": [
            1484306
          ],
          "ORIGIN_COUNTRY_NAME": [
            "United States"
          ],
          "PAYLOAD": [
            0
          ],
          "CLASS": [
            "F"
          ],
          "DEPARTURES_SCHEDULED": [
            0
          ],
          "CARRIER": [
            "9K"
          ],
          "ORIGIN_WAC": [
            3
          ],
          "QUARTER": [
            4
          ],
          "DEST_AIRPORT_SEQ_ID": [
            1502704
          ],
          "MAIL": [
            0
          ],
          "RAMP_TO_RAMP": [
            0
          ],
          "YEAR": [
            2023
          ],
          "DEST_COUNTRY_NAME": [
            "United States"
          ],
          "DEST_STATE_FIPS": [
            "78"
          ],
          "CARRIER_GROUP_NEW": [
            6
          ],
          "DISTANCE": [
            94
          ],
          "ORIGIN_AIRPORT_ID": [
            14843
          ],
          "UNIQUE_CARRIER": [
            "9K"
          ],
          "AIRCRAFT_CONFIG": [
            1
          ],
          "ORIGIN_CITY_MARKET_ID": [
            34819
          ],
          "REGION": [
            "D"
          ],
          "UNIQUE_CARRIER_NAME": [
            "Cape Air"
          ],
          "DEST_CITY_MARKET_ID": [
            34992
          ],
          "PASSENGERS": [
            0
          ],
          "DEST": [
            "STX"
          ],
          "UNIQUE_CARRIER_ENTITY": [
            "07021"
          ],
          "DEST_STATE_NM": [
            "U.S. Virgin Islands"
          ],
          "DATA_SOURCE": [
            "DU"
          ],
          "DEST_WAC": [
            4
          ],
          "ORIGIN_STATE_NM": [
            "Puerto Rico"
          ],
          "ORIGIN": [
            "SJU"
          ],
          "DEST_COUNTRY": [
            "US"
          ],
          "DEST_STATE_ABR": [
            "VI"
          ],
          "DOUBLE_DISTANCE": [
            "188.0"
          ],
          "SEATS": [
            0
          ],
          "AIR_TIME": [
            0
          ],
          "ORIGIN_COUNTRY": [
            "US"
          ],
          "DEPARTURES_PERFORMED": [
            0
          ],
          "ORIGIN_STATE_ABR": [
            "PR"
          ],
          "ORIGIN_CITY_NAME": [
            "San Juan, PR"
          ],
          "ORIGIN_STATE_FIPS": [
            "72"
          ],
          "AIRCRAFT_GROUP": [
            1
          ],
          "AIRCRAFT_TYPE": [
            125
          ],
          "FREIGHT": [
            0
          ],
          "CARRIER_GROUP": [
            1
          ],
          "AIRLINE_ID": [
            20253
          ]
        }
      }
    ]
  }
}
```
