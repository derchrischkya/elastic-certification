default: help

help:
	@echo "Available 'make' commands"
	@echo "  - make start-single-node - starts the single-node deployment"
	@echo "  - make stop-single-node - stops the single-node deployment and removes the data"


start: .enusre-dir .linux .run
stop: .stop .clean

start-single-node: .enusre-dir-single-node .run-single-node
stop-single-node: .stop-single-node .clean-single-node

start-cross-node: .enusre-dir-cross-node .run-cross-node
stop-cross-node: .stop-cross-node .clean-cross-node

.enusre-dir-single-node:
	@mkdir -p ./single-node/data

.run-single-node:
	cd ./single-node && docker-compose up -d setup && docker-compose up -d

.stop-single-node:
	cd ./single-node && docker-compose down setup && docker-compose down

.clean-single-node:
	rm -rf ./single-node/data

.enusre-dir-cross-node:
	@mkdir -p ./cross-node/data-1
	@mkdir -p ./cross-node/data-2
	@mkdir -p ./cross-node/data-3

.run-cross-node:
	cd ./cross-node && docker-compose up -d setup1 setup2 setup3 && docker-compose up -d

.stop-cross-node:
	cd ./cross-node && docker-compose down setup1 setup2 setup3 && docker-compose down

.clean-cross-node:
	rm -rf ./cross-node/data*