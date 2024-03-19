# Deployment 

- Check out the [deployment](../../deployment/single-node/README.md) section to spin up an Elasticsearch cluster.

# Example
Search for the `UNIQUE_CARRIER_NAME` field match "Airline" in the `flights` index and highlight the search term in bold --> \<b>Airlines\</b>.

# Reference
- https://www.elastic.co/guide/en/elasticsearch/reference/current/search-request-highlighting.html

# Code
#### Highlight search term
```json
GET /flights/_search?size=1
{
  "took": 12,
  "timed_out": false,
  "_shards": {
    "total": 1,
    "successful": 1,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": {
      "value": 6,
      "relation": "eq"
    },
    "max_score": 9.025953,
    "hits": [
      {
        "_index": "flights",
        "_id": "2483",
        "_score": 9.025953,
        "_source": {
          "DEPARTURES_SCHEDULED": "0.00",
          "DEPARTURES_PERFORMED": "1.00",
          "PAYLOAD": "21803.00",
          "SEATS": "76.00",
          "PASSENGERS": "0.00",
          "FREIGHT": "0.00",
          "MAIL": "0.00",
          "DISTANCE": "395.00",
          "RAMP_TO_RAMP": "96.00",
          "AIR_TIME": "67.00",
          "UNIQUE_CARRIER": "YX",
          "AIRLINE_ID": "20452",
          "UNIQUE_CARRIER_NAME": "Republic Airline",
          "UNIQUE_CARRIER_ENTITY": "06003",
          "REGION": "D",
          "CARRIER": "YX",
          "CARRIER_NAME": "Republic Airline",
          "CARRIER_GROUP": "3",
          "CARRIER_GROUP_NEW": "3",
          "ORIGIN_AIRPORT_ID": "10721",
          "ORIGIN_AIRPORT_SEQ_ID": "1072102",
          "ORIGIN_CITY_MARKET_ID": "30721",
          "ORIGIN": "BOS",
          "ORIGIN_CITY_NAME": "Boston, MA",
          "ORIGIN_STATE_ABR": "MA",
          "ORIGIN_STATE_FIPS": "25",
          "ORIGIN_STATE_NM": "Massachusetts",
          "ORIGIN_COUNTRY": "US",
          "ORIGIN_COUNTRY_NAME": "United States",
          "ORIGIN_WAC": "13",
          "DEST_AIRPORT_ID": "10792",
          "DEST_AIRPORT_SEQ_ID": "1079206",
          "DEST_CITY_MARKET_ID": "30792",
          "DEST": "BUF",
          "DEST_CITY_NAME": "Buffalo, NY",
          "DEST_STATE_ABR": "NY",
          "DEST_STATE_FIPS": "36",
          "DEST_STATE_NM": "New York",
          "DEST_COUNTRY": "US",
          "DEST_COUNTRY_NAME": "United States",
          "DEST_WAC": "22",
          "AIRCRAFT_GROUP": "6",
          "AIRCRAFT_TYPE": "673",
          "AIRCRAFT_CONFIG": "1",
          "YEAR": "2023",
          "QUARTER": "4",
          "MONTH": "11",
          "DISTANCE_GROUP": "1",
          "CLASS": "F",
          "DATA_SOURCE": "DU"
        },
        "highlight": {
          "UNIQUE_CARRIER_NAME": [
            "Republic <b>Airline</b>"
          ]
        }
      }
    ]
  }
}
```

