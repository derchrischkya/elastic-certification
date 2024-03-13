default: help

help:
	@echo "Available 'make' commands"
	@echo "  - make start-single-node - starts the single-node deployment"
	@echo "  - make stop-single-node - stops the single-node deployment and removes the data"


start: .enusre-dir .linux .run
stop: .stop .clean

start-single-node: .enusre-dir-single-node .run-single-node
stop-single-node: .stop-single-node .clean-single-node

.enusre-dir-single-node:
	@mkdir -p ./single-node/data

.run-single-node:
	cd ./single-node && docker-compose up -d setup && docker-compose up -d

.stop-single-node:
	cd ./single-node && docker-compose down setup && docker-compose down

.clean-single-node:
	rm -rf ./single-node/data