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
	@echo ">> Serving helm repo..."
	@helm serve
