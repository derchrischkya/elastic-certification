# Deployment 

- Check out the [deployment](../../deployment/single-node/README.md) section to spin up an Elasticsearch cluster.

# Example
Search for data in the `flights` index and show the first 5 results with pagination.

# Reference
- https://www.elastic.co/guide/en/elasticsearch/reference/current/paginate-search-results.html

# Code
#### Create search with pagination
```json
GET /flights/_search
{
  "from": 0,
  "size": 5, 
  "query": {
    "match_all": {}
  },
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
  "took": 14,
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
        "_id": "870",
        "_score": null,
        "_source": {
          "DEPARTURES_SCHEDULED": "0.00",
          "DEPARTURES_PERFORMED": "1.00",
          "PAYLOAD": "2603.00",
          "SEATS": "13.00",
          "PASSENGERS": "1.00",
          "FREIGHT": "0.00",
          "MAIL": "0.00",
          "DISTANCE": "4783.00",
          "RAMP_TO_RAMP": "0.00",
          "AIR_TIME": "0.00",
          "UNIQUE_CARRIER": "CAZ",
          "AIRLINE_ID": "21202",
          "UNIQUE_CARRIER_NAME": "CAT Aviation",
          "UNIQUE_CARRIER_ENTITY": "71037",
          "REGION": "I",
          "CARRIER": "CAZ",
          "CARRIER_NAME": "CAT Aviation",
          "CARRIER_GROUP": "0",
          "CARRIER_GROUP_NEW": "0",
          "ORIGIN_AIRPORT_ID": "16321",
          "ORIGIN_AIRPORT_SEQ_ID": "1632105",
          "ORIGIN_CITY_MARKET_ID": "36321",
          "ORIGIN": "ZRH",
          "ORIGIN_CITY_NAME": "Zurich, Switzerland",
          "ORIGIN_STATE_ABR": "",
          "ORIGIN_STATE_FIPS": "",
          "ORIGIN_STATE_NM": "",
          "ORIGIN_COUNTRY": "CH",
          "ORIGIN_COUNTRY_NAME": "Switzerland",
          "ORIGIN_WAC": "486",
          "DEST_AIRPORT_ID": "13348",
          "DEST_AIRPORT_SEQ_ID": "1334802",
          "DEST_CITY_MARKET_ID": "33348",
          "DEST": "MKL",
          "DEST_CITY_NAME": "Jackson, TN",
          "DEST_STATE_ABR": "TN",
          "DEST_STATE_FIPS": "47",
          "DEST_STATE_NM": "Tennessee",
          "DEST_COUNTRY": "US",
          "DEST_COUNTRY_NAME": "United States",
          "DEST_WAC": "54",
          "AIRCRAFT_GROUP": "7",
          "AIRCRAFT_TYPE": "775",
          "AIRCRAFT_CONFIG": "1",
          "YEAR": "2023",
          "QUARTER": "4",
          "MONTH": "11",
          "DISTANCE_GROUP": "10",
          "CLASS": "L",
          "DATA_SOURCE": "IF"
        },
        "sort": [
          "ZRH"
        ]
      },
      {
        "_index": "flights",
        "_id": "2163",
        "_score": null,
        "_source": {
          "DEPARTURES_SCHEDULED": "0.00",
          "DEPARTURES_PERFORMED": "1.00",
          "PAYLOAD": "6085.00",
          "SEATS": "13.00",
          "PASSENGERS": "1.00",
          "FREIGHT": "0.00",
          "MAIL": "0.00",
          "DISTANCE": "3934.00",
          "RAMP_TO_RAMP": "0.00",
          "AIR_TIME": "0.00",
          "UNIQUE_CARRIER": "25Q",
          "AIRLINE_ID": "21649",
          "UNIQUE_CARRIER_NAME": "Mjet GmbH",
          "UNIQUE_CARRIER_ENTITY": "71148",
          "REGION": "I",
          "CARRIER": "25Q",
          "CARRIER_NAME": "Mjet GmbH",
          "CARRIER_GROUP": "0",
          "CARRIER_GROUP_NEW": "0",
          "ORIGIN_AIRPORT_ID": "16321",
          "ORIGIN_AIRPORT_SEQ_ID": "1632105",
          "ORIGIN_CITY_MARKET_ID": "36321",
          "ORIGIN": "ZRH",
          "ORIGIN_CITY_NAME": "Zurich, Switzerland",
          "ORIGIN_STATE_ABR": "",
          "ORIGIN_STATE_FIPS": "",
          "ORIGIN_STATE_NM": "",
          "ORIGIN_COUNTRY": "CH",
          "ORIGIN_COUNTRY_NAME": "Switzerland",
          "ORIGIN_WAC": "486",
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
          "AIRCRAFT_GROUP": "6",
          "AIRCRAFT_TYPE": "667",
          "AIRCRAFT_CONFIG": "1",
          "YEAR": "2023",
          "QUARTER": "4",
          "MONTH": "11",
          "DISTANCE_GROUP": "8",
          "CLASS": "L",
          "DATA_SOURCE": "IF"
        },
        "sort": [
          "ZRH"
        ]
      },
      {
        "_index": "flights",
        "_id": "2187",
        "_score": null,
        "_source": {
          "DEPARTURES_SCHEDULED": "0.00",
          "DEPARTURES_PERFORMED": "1.00",
          "PAYLOAD": "6728.00",
          "SEATS": "14.00",
          "PASSENGERS": "1.00",
          "FREIGHT": "0.00",
          "MAIL": "0.00",
          "DISTANCE": "4833.00",
          "RAMP_TO_RAMP": "0.00",
          "AIR_TIME": "0.00",
          "UNIQUE_CARRIER": "36Q",
          "AIRLINE_ID": "21869",
          "UNIQUE_CARRIER_NAME": "Air Hamburg Luftverkehrsgesellschaft mbH",
          "UNIQUE_CARRIER_ENTITY": "71190",
          "REGION": "I",
          "CARRIER": "36Q",
          "CARRIER_NAME": "Air Hamburg Luftverkehrsgesellschaft mbH",
          "CARRIER_GROUP": "0",
          "CARRIER_GROUP_NEW": "0",
          "ORIGIN_AIRPORT_ID": "16321",
          "ORIGIN_AIRPORT_SEQ_ID": "1632105",
          "ORIGIN_CITY_MARKET_ID": "36321",
          "ORIGIN": "ZRH",
          "ORIGIN_CITY_NAME": "Zurich, Switzerland",
          "ORIGIN_STATE_ABR": "",
          "ORIGIN_STATE_FIPS": "",
          "ORIGIN_STATE_NM": "",
          "ORIGIN_COUNTRY": "CH",
          "ORIGIN_COUNTRY_NAME": "Switzerland",
          "ORIGIN_WAC": "486",
          "DEST_AIRPORT_ID": "14027",
          "DEST_AIRPORT_SEQ_ID": "1402702",
          "DEST_CITY_MARKET_ID": "34027",
          "DEST": "PBI",
          "DEST_CITY_NAME": "West Palm Beach/Palm Beach, FL",
          "DEST_STATE_ABR": "FL",
          "DEST_STATE_FIPS": "12",
          "DEST_STATE_NM": "Florida",
          "DEST_COUNTRY": "US",
          "DEST_COUNTRY_NAME": "United States",
          "DEST_WAC": "33",
          "AIRCRAFT_GROUP": "7",
          "AIRCRAFT_TYPE": "775",
          "AIRCRAFT_CONFIG": "1",
          "YEAR": "2023",
          "QUARTER": "4",
          "MONTH": "11",
          "DISTANCE_GROUP": "10",
          "CLASS": "L",
          "DATA_SOURCE": "IF"
        },
        "sort": [
          "ZRH"
        ]
      },
      {
        "_index": "flights",
        "_id": "2408",
        "_score": null,
        "_source": {
          "DEPARTURES_SCHEDULED": "0.00",
          "DEPARTURES_PERFORMED": "1.00",
          "PAYLOAD": "11000.00",
          "SEATS": "19.00",
          "PASSENGERS": "1.00",
          "FREIGHT": "0.00",
          "MAIL": "0.00",
          "DISTANCE": "4884.00",
          "RAMP_TO_RAMP": "0.00",
          "AIR_TIME": "0.00",
          "UNIQUE_CARRIER": "AOQ",
          "AIRLINE_ID": "22074",
          "UNIQUE_CARRIER_NAME": "Avcon Jet AG",
          "UNIQUE_CARRIER_ENTITY": "71241",
          "REGION": "I",
          "CARRIER": "AOQ",
          "CARRIER_NAME": "Avcon Jet AG",
          "CARRIER_GROUP": "0",
          "CARRIER_GROUP_NEW": "0",
          "ORIGIN_AIRPORT_ID": "16321",
          "ORIGIN_AIRPORT_SEQ_ID": "1632105",
          "ORIGIN_CITY_MARKET_ID": "36321",
          "ORIGIN": "ZRH",
          "ORIGIN_CITY_NAME": "Zurich, Switzerland",
          "ORIGIN_STATE_ABR": "",
          "ORIGIN_STATE_FIPS": "",
          "ORIGIN_STATE_NM": "",
          "ORIGIN_COUNTRY": "CH",
          "ORIGIN_COUNTRY_NAME": "Switzerland",
          "ORIGIN_WAC": "486",
          "DEST_AIRPORT_ID": "13303",
          "DEST_AIRPORT_SEQ_ID": "1330303",
          "DEST_CITY_MARKET_ID": "32467",
          "DEST": "MIA",
          "DEST_CITY_NAME": "Miami, FL",
          "DEST_STATE_ABR": "FL",
          "DEST_STATE_FIPS": "12",
          "DEST_STATE_NM": "Florida",
          "DEST_COUNTRY": "US",
          "DEST_COUNTRY_NAME": "United States",
          "DEST_WAC": "33",
          "AIRCRAFT_GROUP": "6",
          "AIRCRAFT_TYPE": "667",
          "AIRCRAFT_CONFIG": "1",
          "YEAR": "2023",
          "QUARTER": "4",
          "MONTH": "11",
          "DISTANCE_GROUP": "10",
          "CLASS": "L",
          "DATA_SOURCE": "IF"
        },
        "sort": [
          "ZRH"
        ]
      }
    ]
  }
}
```