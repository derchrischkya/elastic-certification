# Endpoints
## From the host machine
### Elasticsearch
- 127.0.0.1:9200
- 127.0.0.1:9300

### Kibana
- 127.0.0.1:5601

## From the inside container
### Elasticsearch
- 10.5.0.2:9200 / elasticsearch:9200
- 10.5.0.2:9300 / elasticsearch:9300

### Kibana
- 10.5.0.3:5601 / kibana:5601

# Default credentials
## Elasticsearch
- username: elastic
- password: changeme

## Kibana
- username: kibana_system
- password: changeme
