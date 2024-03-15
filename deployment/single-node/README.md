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


# How to use
## Start the stack
```bash
cd ../
make start-single-node
```

## Stop the stack
```bash
cd ../
make stop-single-node
```

# Folder structure
- `data`: The directory contains the data of the Elasticsearch and Kibana.
- `config`: The directory contains custom configuration files of the Elasticsearch and Kibana executed after starting the services.
- `setup`: The directory contains the setup files of the Elasticsearch and Kibana like roles, users, etc.
- `docker-compose.yml`: The file contains the services of the stack.

