default: help

help:  ## This help page
	@echo 'make targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-19s %s\n", $$1, $$2}'

build: ## build image (not used yet)
	docker-compose build --pull

logs: ## display docker logs
	docker-compose logs --tail=500 --follow

up: ## start server
	docker-compose up -d
	$(MAKE) logs

down: ## stop server
	docker-compose down

restart: ## call "down" and "up" to restart containers
	$(MAKE) down
	$(MAKE) up

run_shell: ## go into container shell
	docker-compose run --rm --entrypoint=/bin/sh synapse

exec_shell: ## go into container shell
	docker-compose exec synapse /bin/sh

generate: ## calls: './start.py generate'
	docker-compose run --rm synapse generate

migrate_config: ## calls: './start.py migrate_config'
	docker-compose run --rm synapse migrate_config

