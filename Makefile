

start:
	docker build . -t open-api-go-test:latest && \
	docker run -v $$(pwd):/workspace --rm -it open-api-go-test:latest /bin/bash

help:
	openapi-generator-cli help

gen:
	rm -rf out

	openapi-generator-cli generate \
		-i spec.yaml \
		-g go \
		--import-mappings Pet=test.com/models \
		--type-mappings Pet=models.Pet \
		--global-property apis,supportingFiles=client.go:configuration.go \
		-o "out/openapi-go"

	openapi-generator-cli generate \
		-i spec.yaml \
		-g go-server \
		--import-mappings Pet=test.com/models \
		--type-mappings Pet=models.Pet \
		--global-property models,apis,supportingFiles=api.go:routers.go:helpers.go:impl.go:logger.go \
		-o "out/openapi-go-server"

client:
	go run openapi-client.go

server:
	go run openapi-server.go