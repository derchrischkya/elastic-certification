# Description
This directory contains the certificates used for the cross-node communication. The certificates are used to authenticate the nodes and to encrypt the communication between the nodes.

# Files
- instances.yaml: The file contains the list of the nodes and the certificates used for the cross-node communication.

- entrypoint.sh: The script is used to generate the certificates for the cross-node communication.

# Folder
- cluster-certs: The folder contains the certificates used for the cross-node communication.

# How to generate the certificates
To generate the certificates, the `docker-compose` service `certs` is executed. The service is executed inital on on `start-cross-node`.

```bash
docker-compose up -d certs
```

