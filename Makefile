.PHONY: all
all:
	@docker compose up --build

.PHONY: build
build:
	@docker compose build

.PHONY: deploy
deploy:
	@docker compose build --push
	