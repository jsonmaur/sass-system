.EXPORT_ALL_VARIABLES:
.PHONY: help dev build test-unit test-integration test

help: #: show this help menu
	@grep "#:" Makefile* | grep -v "@grep" | sed "s/\([A-Za-z_ -]*\):.*#\(.*\)/$$(tput setaf 3)\1$$(tput sgr0)\2/g"

dev: #: watch the source files and rebuild when they change
	@sass index.scss:index.css --embed-source-map --watch

build: #: build the final output file
	@sass index.scss:index.min.css --style=compressed

test-unit: #: run the unit tests
	@sass tests/tests.scss

test-integration: #: run the integration tests
	@cd tests && sh ./tests.sh

test: test-unit test-integration #: run testing suite
