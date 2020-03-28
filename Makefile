default: help

help:  ## This help page
	@echo 'make targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-19s %s\n", $$1, $$2}'

build: ## build image (not used yet)
	docker-compose build --pull

up: ## start server
	docker-compose build --pull

#shell: ## go into container shell

generate: ## generate the config file
	docker-compose run synapse generate