# Deployment 

- Check out the [deployment](../../deployment/single-node/README.md) section to spin up an Elasticsearch cluster.

# Example
Create a search template which covers dynamical params for - `UNIQUE_CARRIER_NAME`
- `from`
- `size`

for the `flights` index.

# Reference
- https://www.elastic.co/guide/en/elasticsearch/reference/current/search-template.html

# Code
#### Create search template
```json
POST /_scripts/custom-template-flights
{
  "script": {
    "lang": "mustache",
    "source": {
      "query": {
        "match": {
          "UNIQUE_CARRIER_NAME": "{{query_string}}"
        }
      },
      "from": "{{from}}",
      "size": "{{size}}"
    }
  }
}
```
#### Validate search template
```json
POST _render/template
{
  "id": "custom-template-flights",
  "params": {
    "query_string": "Airline",
    "from": 0,
    "size": 5
  }
}
```
```json
{
  "template_output": {
    "query": {
      "match": {
        "UNIQUE_CARRIER_NAME": "Airline"
      }
    },
    "from": "0",
    "size": "5"
  }
}
```
#### Execute search template
```json
GET flights/_search/template
{
  "id": "custom-template-flights",
  "params": {
    "query_string": "Airline",
    "from": 0,
    "size": 5
  }
}
```

```json
{
  "took": 13,
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
        }
      },
      {
        "_index": "flights",
        "_id": "2484",
        "_score": 9.025953,
        "_source": {
          "DEPARTURES_SCHEDULED": "0.00",
          "DEPARTURES_PERFORMED": "1.00",
          "PAYLOAD": "21803.00",
          "SEATS": "76.00",
          "PASSENGERS": "0.00",
          "FREIGHT": "0.00",
          "MAIL": "0.00",
          "DISTANCE": "532.00",
          "RAMP_TO_RAMP": "162.00",
          "AIR_TIME": "112.00",
          "UNIQUE_CARRIER": "YX",
          "AIRLINE_ID": "20452",
          "UNIQUE_CARRIER_NAME": "Republic Airline",
          "UNIQUE_CARRIER_ENTITY": "06003",
          "REGION": "D",
          "CARRIER": "YX",
          "CARRIER_NAME": "Republic Airline",
          "CARRIER_GROUP": "3",
          "CARRIER_GROUP_NEW": "3",
          "ORIGIN_AIRPORT_ID": "14492",
          "ORIGIN_AIRPORT_SEQ_ID": "1449202",
          "ORIGIN_CITY_MARKET_ID": "34492",
          "ORIGIN": "RDU",
          "ORIGIN_CITY_NAME": "Raleigh/Durham, NC",
          "ORIGIN_STATE_ABR": "NC",
          "ORIGIN_STATE_FIPS": "37",
          "ORIGIN_STATE_NM": "North Carolina",
          "ORIGIN_COUNTRY": "US",
          "ORIGIN_COUNTRY_NAME": "United States",
          "ORIGIN_WAC": "36",
          "DEST_AIRPORT_ID": "10529",
          "DEST_AIRPORT_SEQ_ID": "1052907",
          "DEST_CITY_MARKET_ID": "30529",
          "DEST": "BDL",
          "DEST_CITY_NAME": "Hartford, CT",
          "DEST_STATE_ABR": "CT",
          "DEST_STATE_FIPS": "09",
          "DEST_STATE_NM": "Connecticut",
          "DEST_COUNTRY": "US",
          "DEST_COUNTRY_NAME": "United States",
          "DEST_WAC": "11",
          "AIRCRAFT_GROUP": "6",
          "AIRCRAFT_TYPE": "673",
          "AIRCRAFT_CONFIG": "1",
          "YEAR": "2023",
          "QUARTER": "4",
          "MONTH": "11",
          "DISTANCE_GROUP": "2",
          "CLASS": "F",
          "DATA_SOURCE": "DU"
        }
      },
      {
        "_index": "flights",
        "_id": "2485",
        "_score": 9.025953,
        "_source": {
          "DEPARTURES_SCHEDULED": "0.00",
          "DEPARTURES_PERFORMED": "1.00",
          "PAYLOAD": "21803.00",
          "SEATS": "76.00",
          "PASSENGERS": "65.00",
          "FREIGHT": "0.00",
          "MAIL": "0.00",
          "DISTANCE": "489.00",
          "RAMP_TO_RAMP": "206.00",
          "AIR_TIME": "181.00",
          "UNIQUE_CARRIER": "YX",
          "AIRLINE_ID": "20452",
          "UNIQUE_CARRIER_NAME": "Republic Airline",
          "UNIQUE_CARRIER_ENTITY": "06003",
          "REGION": "D",
          "CARRIER": "YX",
          "CARRIER_NAME": "Republic Airline",
          "CARRIER_GROUP": "3",
          "CARRIER_GROUP_NEW": "3",
          "ORIGIN_AIRPORT_ID": "14492",
          "ORIGIN_AIRPORT_SEQ_ID": "1449202",
          "ORIGIN_CITY_MARKET_ID": "34492",
          "ORIGIN": "RDU",
          "ORIGIN_CITY_NAME": "Raleigh/Durham, NC",
          "ORIGIN_STATE_ABR": "NC",
          "ORIGIN_STATE_FIPS": "37",
          "ORIGIN_STATE_NM": "North Carolina",
          "ORIGIN_COUNTRY": "US",
          "ORIGIN_COUNTRY_NAME": "United States",
          "ORIGIN_WAC": "36",
          "DEST_AIRPORT_ID": "12339",
          "DEST_AIRPORT_SEQ_ID": "1233904",
          "DEST_CITY_MARKET_ID": "32337",
          "DEST": "IND",
          "DEST_CITY_NAME": "Indianapolis, IN",
          "DEST_STATE_ABR": "IN",
          "DEST_STATE_FIPS": "18",
          "DEST_STATE_NM": "Indiana",
          "DEST_COUNTRY": "US",
          "DEST_COUNTRY_NAME": "United States",
          "DEST_WAC": "42",
          "AIRCRAFT_GROUP": "6",
          "AIRCRAFT_TYPE": "673",
          "AIRCRAFT_CONFIG": "1",
          "YEAR": "2023",
          "QUARTER": "4",
          "MONTH": "11",
          "DISTANCE_GROUP": "1",
          "CLASS": "F",
          "DATA_SOURCE": "DU"
        }
      },
      {
        "_index": "flights",
        "_id": "2486",
        "_score": 9.025953,
        "_source": {
          "DEPARTURES_SCHEDULED": "0.00",
          "DEPARTURES_PERFORMED": "1.00",
          "PAYLOAD": "21803.00",
          "SEATS": "76.00",
          "PASSENGERS": "66.00",
          "FREIGHT": "0.00",
          "MAIL": "0.00",
          "DISTANCE": "384.00",
          "RAMP_TO_RAMP": "131.00",
          "AIR_TIME": "88.00",
          "UNIQUE_CARRIER": "YX",
          "AIRLINE_ID": "20452",
          "UNIQUE_CARRIER_NAME": "Republic Airline",
          "UNIQUE_CARRIER_ENTITY": "06003",
          "REGION": "D",
          "CARRIER": "YX",
          "CARRIER_NAME": "Republic Airline",
          "CARRIER_GROUP": "3",
          "CARRIER_GROUP_NEW": "3",
          "ORIGIN_AIRPORT_ID": "11996",
          "ORIGIN_AIRPORT_SEQ_ID": "1199603",
          "ORIGIN_CITY_MARKET_ID": "31871",
          "ORIGIN": "GSP",
          "ORIGIN_CITY_NAME": "Greer, SC",
          "ORIGIN_STATE_ABR": "SC",
          "ORIGIN_STATE_FIPS": "45",
          "ORIGIN_STATE_NM": "South Carolina",
          "ORIGIN_COUNTRY": "US",
          "ORIGIN_COUNTRY_NAME": "United States",
          "ORIGIN_WAC": "37",
          "DEST_AIRPORT_ID": "12264",
          "DEST_AIRPORT_SEQ_ID": "1226402",
          "DEST_CITY_MARKET_ID": "30852",
          "DEST": "IAD",
          "DEST_CITY_NAME": "Washington, DC",
          "DEST_STATE_ABR": "VA",
          "DEST_STATE_FIPS": "51",
          "DEST_STATE_NM": "Virginia",
          "DEST_COUNTRY": "US",
          "DEST_COUNTRY_NAME": "United States",
          "DEST_WAC": "38",
          "AIRCRAFT_GROUP": "6",
          "AIRCRAFT_TYPE": "673",
          "AIRCRAFT_CONFIG": "1",
          "YEAR": "2023",
          "QUARTER": "4",
          "MONTH": "11",
          "DISTANCE_GROUP": "1",
          "CLASS": "F",
          "DATA_SOURCE": "DU"
        }
      },
      {
        "_index": "flights",
        "_id": "2487",
        "_score": 9.025953,
        "_source": {
          "DEPARTURES_SCHEDULED": "0.00",
          "DEPARTURES_PERFORMED": "1.00",
          "PAYLOAD": "21803.00",
          "SEATS": "76.00",
          "PASSENGERS": "73.00",
          "FREIGHT": "0.00",
          "MAIL": "0.00",
          "DISTANCE": "239.00",
          "RAMP_TO_RAMP": "114.00",
          "AIR_TIME": "96.00",
          "UNIQUE_CARRIER": "YX",
          "AIRLINE_ID": "20452",
          "UNIQUE_CARRIER_NAME": "Republic Airline",
          "UNIQUE_CARRIER_ENTITY": "06003",
          "REGION": "D",
          "CARRIER": "YX",
          "CARRIER_NAME": "Republic Airline",
          "CARRIER_GROUP": "3",
          "CARRIER_GROUP_NEW": "3",
          "ORIGIN_AIRPORT_ID": "11995",
          "ORIGIN_AIRPORT_SEQ_ID": "1199502",
          "ORIGIN_CITY_MARKET_ID": "31995",
          "ORIGIN": "GSO",
          "ORIGIN_CITY_NAME": "Greensboro/High Point, NC",
          "ORIGIN_STATE_ABR": "NC",
          "ORIGIN_STATE_FIPS": "37",
          "ORIGIN_STATE_NM": "North Carolina",
          "ORIGIN_COUNTRY": "US",
          "ORIGIN_COUNTRY_NAME": "United States",
          "ORIGIN_WAC": "36",
          "DEST_AIRPORT_ID": "12264",
          "DEST_AIRPORT_SEQ_ID": "1226402",
          "DEST_CITY_MARKET_ID": "30852",
          "DEST": "IAD",
          "DEST_CITY_NAME": "Washington, DC",
          "DEST_STATE_ABR": "VA",
          "DEST_STATE_FIPS": "51",
          "DEST_STATE_NM": "Virginia",
          "DEST_COUNTRY": "US",
          "DEST_COUNTRY_NAME": "United States",
          "DEST_WAC": "38",
          "AIRCRAFT_GROUP": "6",
          "AIRCRAFT_TYPE": "673",
          "AIRCRAFT_CONFIG": "1",
          "YEAR": "2023",
          "QUARTER": "4",
          "MONTH": "11",
          "DISTANCE_GROUP": "1",
          "CLASS": "F",
          "DATA_SOURCE": "DU"
        }
      }
    ]
  }
}
```