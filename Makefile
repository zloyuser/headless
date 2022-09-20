#!make

help: ## Show this help
	@printf "\033[33m%s:\033[0m\n" 'Run: make <target> where <target> is one of the following'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[32m%-18s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

nginx: ## Restart nginx
	docker compose rm -sf nginx
	docker compose up -d nginx

postgres: ## Restart postgres
	docker compose rm -sf postgres
	docker compose up -d postgres

mongo: ## Restart mongo
	docker compose rm -sf mongo
	docker compose up -d mongo
