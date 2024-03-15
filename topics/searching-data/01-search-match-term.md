# Example
When spinning up the `single-node` cluster, the index `flights` was created with sample data. Now lets search for some data!

Lets start with some theory when to use:
- `term`: Returns documents that contain an exact term in a provided field. (no field type `text` allowed, only `keyword` or `numeric` fields - case sensitive)


- `match`: Returns documents that match a provided text, number, date or boolean value. The provided text is analyzed before matching. (field needs to be type `text` - case insensitive)

#### Test:
Which type of query should be used to search for 1 and 2?

1. 
```json
{"id": "5"}
```

2. 
```json
{"message": "I am a long text and only this \"value\" is important"}
```

#### Solution
(use https://www.devglan.com/online-tools/text-encryption-decryption with key `elastic`)
- oAt2y6codUjNSmfc49oNydIsm26PXj/5LV4CKnNgN3o=

# Reference
- https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-term-query.html
- https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-match-query.html

# Code
#### `term` query
On `keyword` field - looks fine
```json
GET /flights/_search
{
  "query": {
    "term": {
      "_id": "5"
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
      "value": 1,
      "relation": "eq"
    },
    "max_score": 1,
    "hits": [
      {
        "_index": "flights",
        "_id": "5",
        "_score": 1,
        "_source": {
          "DEPARTURES_SCHEDULED": "0.00",
          "DEPARTURES_PERFORMED": "0.00",
          "PAYLOAD": "0.00",
          "SEATS": "0.00",
          "PASSENGERS": "0.00",
          "FREIGHT": "0.00",
          "MAIL": "0.00",
          "DISTANCE": "999.00",
          "RAMP_TO_RAMP": "0.00",
          "AIR_TIME": "0.00",
          "UNIQUE_CARRIER": "DL",
          "AIRLINE_ID": "19790",
          "UNIQUE_CARRIER_NAME": "Delta Air Lines Inc.",
          "UNIQUE_CARRIER_ENTITY": "01260",
          "REGION": "D",
          "CARRIER": "DL",
          "CARRIER_NAME": "Delta Air Lines Inc.",
          "CARRIER_GROUP": "3",
          "CARRIER_GROUP_NEW": "3",
          "ORIGIN_AIRPORT_ID": "14869",
          "ORIGIN_AIRPORT_SEQ_ID": "1486903",
          "ORIGIN_CITY_MARKET_ID": "34614",
          "ORIGIN": "SLC",
          "ORIGIN_CITY_NAME": "Salt Lake City, UT",
          "ORIGIN_STATE_ABR": "UT",
          "ORIGIN_STATE_FIPS": "49",
          "ORIGIN_STATE_NM": "Utah",
          "ORIGIN_COUNTRY": "US",
          "ORIGIN_COUNTRY_NAME": "United States",
          "ORIGIN_WAC": "87",
          "DEST_AIRPORT_ID": "11259",
          "DEST_AIRPORT_SEQ_ID": "1125904",
          "DEST_CITY_MARKET_ID": "30194",
          "DEST": "DAL",
          "DEST_CITY_NAME": "Dallas, TX",
          "DEST_STATE_ABR": "TX",
          "DEST_STATE_FIPS": "48",
          "DEST_STATE_NM": "Texas",
          "DEST_COUNTRY": "US",
          "DEST_COUNTRY_NAME": "United States",
          "DEST_WAC": "74",
          "AIRCRAFT_GROUP": "6",
          "AIRCRAFT_TYPE": "622",
          "AIRCRAFT_CONFIG": "1",
          "YEAR": "2023",
          "QUARTER": "4",
          "MONTH": "11",
          "DISTANCE_GROUP": "2",
          "CLASS": "L",
          "DATA_SOURCE": "DU"
        }
      }
    ]
  }
}
```

On `text` field - no results
```json
GET /flights/_search
{
  "query": {
    "term": {
      "UNIQUE_CARRIER_NAME": "Delta Air Lines Inc."
    }
  }
}
```

```
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
      "value": 0,
      "relation": "eq"
    },
    "max_score": null,
    "hits": []
  }
}
```

#### `match` query
On `text` field - looks fine
First try:
```json
GET /flights/_search
{
  "query": {
    "match": {
      "CARRIER_NAME": "Delta"
    }
  }
}
```

- 241 documents found
```
{
  "took": 4,
  "timed_out": false,
  "_shards": {
    "total": 1,
    "successful": 1,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": {
      "value": 241,
      "relation": "eq"
    }
  }
...
}
```

Second try:
```json
GET /flights/_search
{
  "query": {
    "match": {
      "UNIQUE_CARRIER_NAME": "Delta Air Lines Inc."
    }
  }
}
```
- 2778 documents found
```
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
      "value": 2778,
      "relation": "eq"
    },
  }
...
}
```

The second try matches more documents because the field `UNIQUE_CARRIER_NAME` is a `text` field. The second query analyzed by the phrases `Delta`, `Air`, `Lines`, `Inc.` while the first one only by `Delta`.