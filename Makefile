.EXPORT_ALL_VARIABLES:
.PHONY: dev build test

dev:
	@sass index.scss:index.css --embed-source-map --watch

build:
	@sass index.scss:index.min.css --style=compressed

test:
	@sass test/test-helper.scss
	@cd test && ./test-integration.sh
