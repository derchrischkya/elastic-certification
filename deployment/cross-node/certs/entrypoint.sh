#!/usr/bin/env bash
# --------------------------------------------------------
# Create Certificate Authorities
if [[ ${CERT_CREATION} == "true" ]];
    rm -rf /certs/*
    cd /certs
then
	echo 'Creating certificate authorities'
	/usr/share/elasticsearch/bin/elasticsearch-certutil ca --pass "" --pem --out /tmp/ca.zip --silent
	unzip /tmp/ca.zip -d /certs/
	echo "Generating Self-Signed Certificate Authority P12 ..."
	bin/elasticsearch-certutil ca --pass "" --out /tmp/elastic-stack-ca.p12 --silent
	echo "elastic-stack-ca.p12 is located $CA_P12"

    echo "Creating p12 certificate keystores"
    /usr/share/elasticsearch/bin/elasticsearch-certutil cert --silent --in /usr/share/elasticsearch/config/instances.yml --out /tmp/keystore.zip --ca /tmp/elastic-stack-ca.p12 --ca-pass "" --pass ""
    unzip /tmp/keystore.zip -d /certs/
    echo "Creating crt and key certificates"
    /usr/share/elasticsearch/bin/elasticsearch-certutil cert --silent --in /usr/share/elasticsearch/config/instances.yml --out /tmp/bundle.zip --ca-cert /certs/ca/ca.crt --ca-key /certs/ca/ca.key --ca-pass "" --pem
    unzip /tmp/bundle.zip -d /certs/
fi