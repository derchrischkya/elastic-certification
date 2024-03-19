# Deployment 

- Check out the [deployment](../../deployment/single-node/README.md) section to spin up an Elasticsearch cluster.

# Example
Create an alias for index `flights` which returns the first 5 documents sorted by `ORIGIN` in descending order where the term `UNIQUE_CARRIER` is `04Q`.

# Reference
- https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-aliases.html

# Code
#### Create index alias
```json
POST /_aliases
{
  "actions": [
    {
      "add": {
        "index": "flights",
        "alias": "flights_04Q",
        "filter": {
          "term": {
            "UNIQUE_CARRIER": "04Q"
        }
        }
      }
    }
  ]
}
```

#### Search with index alias
```json
GET /flights_04Q/_search?size=5
{
  "sort": [
    {
      "ORIGIN": {
        "order": "desc"
      }
    }
  ]
}
```

```json
{
  "took": 8,
  "timed_out": false,
  "_shards": {
    "total": 1,
    "successful": 1,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": {
      "value": 263,
      "relation": "eq"
    },
    "max_score": null,
    "hits": [
      {
        "_index": "flights",
        "_id": "1344",
        "_score": null,
        "_source": {
          "DEPARTURES_SCHEDULED": "0.00",
          "DEPARTURES_PERFORMED": "1.00",
          "PAYLOAD": "3450.00",
          "SEATS": "8.00",
          "PASSENGERS": "1.00",
          "FREIGHT": "0.00",
          "MAIL": "0.00",
          "DISTANCE": "147.00",
          "RAMP_TO_RAMP": "54.00",
          "AIR_TIME": "42.00",
          "UNIQUE_CARRIER": "04Q",
          "AIRLINE_ID": "21080",
          "UNIQUE_CARRIER_NAME": "Tradewind Aviation",
          "UNIQUE_CARRIER_ENTITY": "01126",
          "REGION": "D",
          "CARRIER": "04Q",
          "CARRIER_NAME": "Tradewind Aviation",
          "CARRIER_GROUP": "1",
          "CARRIER_GROUP_NEW": "6",
          "ORIGIN_AIRPORT_ID": "16353",
          "ORIGIN_AIRPORT_SEQ_ID": "1635301",
          "ORIGIN_CITY_MARKET_ID": "36353",
          "ORIGIN": "ZXU",
          "ORIGIN_CITY_NAME": "North Kingstown, RI",
          "ORIGIN_STATE_ABR": "RI",
          "ORIGIN_STATE_FIPS": "44",
          "ORIGIN_STATE_NM": "Rhode Island",
          "ORIGIN_COUNTRY": "US",
          "ORIGIN_COUNTRY_NAME": "United States",
          "ORIGIN_WAC": "15",
          "DEST_AIRPORT_ID": "15167",
          "DEST_AIRPORT_SEQ_ID": "1516702",
          "DEST_CITY_MARKET_ID": "35167",
          "DEST": "TEB",
          "DEST_CITY_NAME": "Teterboro, NJ",
          "DEST_STATE_ABR": "NJ",
          "DEST_STATE_FIPS": "34",
          "DEST_STATE_NM": "New Jersey",
          "DEST_COUNTRY": "US",
          "DEST_COUNTRY_NAME": "United States",
          "DEST_WAC": "21",
          "AIRCRAFT_GROUP": "4",
          "AIRCRAFT_TYPE": "479",
          "AIRCRAFT_CONFIG": "1",
          "YEAR": "2023",
          "QUARTER": "4",
          "MONTH": "11",
          "DISTANCE_GROUP": "1",
          "CLASS": "L",
          "DATA_SOURCE": "DU"
        },
        "sort": [
          "ZXU"
        ]
      },
      {
        "_index": "flights",
        "_id": "1526",
        "_score": null,
        "_source": {
          "DEPARTURES_SCHEDULED": "0.00",
          "DEPARTURES_PERFORMED": "1.00",
          "PAYLOAD": "3450.00",
          "SEATS": "8.00",
          "PASSENGERS": "6.00",
          "FREIGHT": "0.00",
          "MAIL": "0.00",
          "DISTANCE": "240.00",
          "RAMP_TO_RAMP": "78.00",
          "AIR_TIME": "54.00",
          "UNIQUE_CARRIER": "04Q",
          "AIRLINE_ID": "21080",
          "UNIQUE_CARRIER_NAME": "Tradewind Aviation",
          "UNIQUE_CARRIER_ENTITY": "01126",
          "REGION": "D",
          "CARRIER": "04Q",
          "CARRIER_NAME": "Tradewind Aviation",
          "CARRIER_GROUP": "1",
          "CARRIER_GROUP_NEW": "6",
          "ORIGIN_AIRPORT_ID": "16217",
          "ORIGIN_AIRPORT_SEQ_ID": "1621703",
          "ORIGIN_CITY_MARKET_ID": "36083",
          "ORIGIN": "YUL",
          "ORIGIN_CITY_NAME": "Montreal, Canada",
          "ORIGIN_STATE_ABR": "QC",
          "ORIGIN_STATE_FIPS": "",
          "ORIGIN_STATE_NM": "Quebec",
          "ORIGIN_COUNTRY": "CA",
          "ORIGIN_COUNTRY_NAME": "Canada",
          "ORIGIN_WAC": "941",
          "DEST_AIRPORT_ID": "10540",
          "DEST_AIRPORT_SEQ_ID": "1054005",
          "DEST_CITY_MARKET_ID": "30540",
          "DEST": "BED",
          "DEST_CITY_NAME": "Bedford, MA",
          "DEST_STATE_ABR": "MA",
          "DEST_STATE_FIPS": "25",
          "DEST_STATE_NM": "Massachusetts",
          "DEST_COUNTRY": "US",
          "DEST_COUNTRY_NAME": "United States",
          "DEST_WAC": "13",
          "AIRCRAFT_GROUP": "4",
          "AIRCRAFT_TYPE": "479",
          "AIRCRAFT_CONFIG": "1",
          "YEAR": "2023",
          "QUARTER": "4",
          "MONTH": "11",
          "DISTANCE_GROUP": "1",
          "CLASS": "L",
          "DATA_SOURCE": "IU"
        },
        "sort": [
          "YUL"
        ]
      },
      {
        "_index": "flights",
        "_id": "1507",
        "_score": null,
        "_source": {
          "DEPARTURES_SCHEDULED": "0.00",
          "DEPARTURES_PERFORMED": "1.00",
          "PAYLOAD": "3450.00",
          "SEATS": "8.00",
          "PASSENGERS": "6.00",
          "FREIGHT": "0.00",
          "MAIL": "0.00",
          "DISTANCE": "96.00",
          "RAMP_TO_RAMP": "48.00",
          "AIR_TIME": "30.00",
          "UNIQUE_CARRIER": "04Q",
          "AIRLINE_ID": "21080",
          "UNIQUE_CARRIER_NAME": "Tradewind Aviation",
          "UNIQUE_CARRIER_ENTITY": "01126",
          "REGION": "D",
          "CARRIER": "04Q",
          "CARRIER_NAME": "Tradewind Aviation",
          "CARRIER_GROUP": "1",
          "CARRIER_GROUP_NEW": "6",
          "ORIGIN_AIRPORT_ID": "16097",
          "ORIGIN_AIRPORT_SEQ_ID": "1609704",
          "ORIGIN_CITY_MARKET_ID": "36097",
          "ORIGIN": "YKF",
          "ORIGIN_CITY_NAME": "Kitchener, Canada",
          "ORIGIN_STATE_ABR": "ON",
          "ORIGIN_STATE_FIPS": "",
          "ORIGIN_STATE_NM": "Ontario",
          "ORIGIN_COUNTRY": "CA",
          "ORIGIN_COUNTRY_NAME": "Canada",
          "ORIGIN_WAC": "936",
          "DEST_AIRPORT_ID": "11577",
          "DEST_AIRPORT_SEQ_ID": "1157706",
          "DEST_CITY_MARKET_ID": "31577",
          "DEST": "ERI",
          "DEST_CITY_NAME": "Erie, PA",
          "DEST_STATE_ABR": "PA",
          "DEST_STATE_FIPS": "42",
          "DEST_STATE_NM": "Pennsylvania",
          "DEST_COUNTRY": "US",
          "DEST_COUNTRY_NAME": "United States",
          "DEST_WAC": "23",
          "AIRCRAFT_GROUP": "4",
          "AIRCRAFT_TYPE": "479",
          "AIRCRAFT_CONFIG": "1",
          "YEAR": "2023",
          "QUARTER": "4",
          "MONTH": "11",
          "DISTANCE_GROUP": "1",
          "CLASS": "L",
          "DATA_SOURCE": "IU"
        },
        "sort": [
          "YKF"
        ]
      },
      {
        "_index": "flights",
        "_id": "1383",
        "_score": null,
        "_source": {
          "DEPARTURES_SCHEDULED": "0.00",
          "DEPARTURES_PERFORMED": "1.00",
          "PAYLOAD": "3450.00",
          "SEATS": "8.00",
          "PASSENGERS": "2.00",
          "FREIGHT": "0.00",
          "MAIL": "0.00",
          "DISTANCE": "81.00",
          "RAMP_TO_RAMP": "54.00",
          "AIR_TIME": "36.00",
          "UNIQUE_CARRIER": "04Q",
          "AIRLINE_ID": "21080",
          "UNIQUE_CARRIER_NAME": "Tradewind Aviation",
          "UNIQUE_CARRIER_ENTITY": "01126",
          "REGION": "D",
          "CARRIER": "04Q",
          "CARRIER_NAME": "Tradewind Aviation",
          "CARRIER_GROUP": "1",
          "CARRIER_GROUP_NEW": "6",
          "ORIGIN_AIRPORT_ID": "15860",
          "ORIGIN_AIRPORT_SEQ_ID": "1586001",
          "ORIGIN_CITY_MARKET_ID": "35860",
          "ORIGIN": "WTD",
          "ORIGIN_CITY_NAME": "West End, The Bahamas",
          "ORIGIN_STATE_ABR": "",
          "ORIGIN_STATE_FIPS": "",
          "ORIGIN_STATE_NM": "",
          "ORIGIN_COUNTRY": "BS",
          "ORIGIN_COUNTRY_NAME": "The Bahamas",
          "ORIGIN_WAC": "204",
          "DEST_AIRPORT_ID": "11827",
          "DEST_AIRPORT_SEQ_ID": "1182702",
          "DEST_CITY_MARKET_ID": "32467",
          "DEST": "FXE",
          "DEST_CITY_NAME": "Fort Lauderdale, FL",
          "DEST_STATE_ABR": "FL",
          "DEST_STATE_FIPS": "12",
          "DEST_STATE_NM": "Florida",
          "DEST_COUNTRY": "US",
          "DEST_COUNTRY_NAME": "United States",
          "DEST_WAC": "33",
          "AIRCRAFT_GROUP": "4",
          "AIRCRAFT_TYPE": "479",
          "AIRCRAFT_CONFIG": "1",
          "YEAR": "2023",
          "QUARTER": "4",
          "MONTH": "11",
          "DISTANCE_GROUP": "1",
          "CLASS": "L",
          "DATA_SOURCE": "IU"
        },
        "sort": [
          "WTD"
        ]
      },
      {
        "_index": "flights",
        "_id": "1392",
        "_score": null,
        "_source": {
          "DEPARTURES_SCHEDULED": "0.00",
          "DEPARTURES_PERFORMED": "1.00",
          "PAYLOAD": "3450.00",
          "SEATS": "8.00",
          "PASSENGERS": "2.00",
          "FREIGHT": "0.00",
          "MAIL": "0.00",
          "DISTANCE": "123.00",
          "RAMP_TO_RAMP": "42.00",
          "AIR_TIME": "30.00",
          "UNIQUE_CARRIER": "04Q",
          "AIRLINE_ID": "21080",
          "UNIQUE_CARRIER_NAME": "Tradewind Aviation",
          "UNIQUE_CARRIER_ENTITY": "01126",
          "REGION": "D",
          "CARRIER": "04Q",
          "CARRIER_NAME": "Tradewind Aviation",
          "CARRIER_GROUP": "1",
          "CARRIER_GROUP_NEW": "6",
          "ORIGIN_AIRPORT_ID": "15656",
          "ORIGIN_AIRPORT_SEQ_ID": "1565602",
          "ORIGIN_CITY_MARKET_ID": "35656",
          "ORIGIN": "VWK",
          "ORIGIN_CITY_NAME": "Saratoga Springs, NY",
          "ORIGIN_STATE_ABR": "NY",
          "ORIGIN_STATE_FIPS": "36",
          "ORIGIN_STATE_NM": "New York",
          "ORIGIN_COUNTRY": "US",
          "ORIGIN_COUNTRY_NAME": "United States",
          "ORIGIN_WAC": "22",
          "DEST_AIRPORT_ID": "10577",
          "DEST_AIRPORT_SEQ_ID": "1057705",
          "DEST_CITY_MARKET_ID": "30577",
          "DEST": "BGM",
          "DEST_CITY_NAME": "Binghamton, NY",
          "DEST_STATE_ABR": "NY",
          "DEST_STATE_FIPS": "36",
          "DEST_STATE_NM": "New York",
          "DEST_COUNTRY": "US",
          "DEST_COUNTRY_NAME": "United States",
          "DEST_WAC": "22",
          "AIRCRAFT_GROUP": "4",
          "AIRCRAFT_TYPE": "479",
          "AIRCRAFT_CONFIG": "1",
          "YEAR": "2023",
          "QUARTER": "4",
          "MONTH": "11",
          "DISTANCE_GROUP": "1",
          "CLASS": "L",
          "DATA_SOURCE": "DU"
        },
        "sort": [
          "VWK"
        ]
      }
    ]
  }
}
```

#### Check for term `UNIQUE_CARRIER` in index alias
```json
GET /flights_04Q/_search
{
  "size": 0,
  "aggs": {
    "types":
    {
      "terms": {
        "field": "UNIQUE_CARRIER"
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
      "value": 263,
      "relation": "eq"
    },
    "max_score": null,
    "hits": []
  },
  "aggregations": {
    "types": {
      "doc_count_error_upper_bound": 0,
      "sum_other_doc_count": 0,
      "buckets": [
        {
          "key": "04Q",
          "doc_count": 263
        }
      ]
    }
  }
}
```