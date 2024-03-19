ARG ELASTIC_VERSION


# https://www.docker.elastic.co/
FROM docker.elastic.co/elasticsearch/elasticsearch:${ELASTIC_VERSION}
ENV ELASTICSEARCH_HOST ${ELASTICSEARCH_HOST}
ENTRYPOINT ["/entrypoint.sh"]
