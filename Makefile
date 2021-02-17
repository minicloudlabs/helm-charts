build:
	@echo ">> Building helm package..."
	@helm package gatus
	@echo ">> Building helm repo index..."
	@helm repo index .
	@echo ">> Done!"

serve: build
	@echo ">> Serving helm repo..."
	@helm serve
