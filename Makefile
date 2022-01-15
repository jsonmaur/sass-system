.EXPORT_ALL_VARIABLES:
.PHONY: help dev build test test-unit test-integration release

help: #: show this help menu
	@grep "#:" Makefile* | grep -v "@grep" | sed "s/\([A-Za-z_ -]*\):.*#\(.*\)/$$(tput setaf 3)\1$$(tput sgr0)\2/g"

dev: #: watch the source files and rebuild when they change
	@sass index.scss:_build/index.css --embed-source-map --watch

build: #: build the final output file
	@sass index.scss:_build/index.min.css --style=compressed

test: test-unit test-integration #: run testing suite

test-unit: #: run the unit tests
	@sass test/test-helper.scss

test-integration: #: run the integration tests
	@cd test && ./test-integration.sh

release: build #: build the final output and create a new tagged release
	@git tag v$(version)
	@git archive \
		--format tar.gz \
		--prefix ssbuild/ \
		--add-file _build/index.min.css \
		--add-file _build/index.min.css.map \
		--add-file publish/npm/package.json \
		v$(version) > _build/npm-ssbuild-$(version).tar.gz
