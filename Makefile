.PHONY: main
main:
	@echo "Commands"
	@echo "- deploy"

.PHONY: deploy
deploy:
	@docker push ghcr.io/cabaalexander/coolify-nginx-reverse-proxy:latest
