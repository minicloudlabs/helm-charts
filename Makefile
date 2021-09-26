HTTP_PORT := 8080

build:
	@echo ">> Building helm package..."
	@cp README.md gatus/README.md
	@helm package gatus
	@echo ">> Building helm repo index..."
	@helm repo index .
	@echo ">> Done!"

lint:
	@echo ">> Linting chart..."
	@helm lint gatus

serve: build
	@echo ">> Use 'http://localhost:${HTTP_PORT}' as helmfile's repo url"
	@echo ">> Serving helm repo at port ${HTTP_PORT}"
	@python -m SimpleHTTPServer ${HTTP_PORT}
