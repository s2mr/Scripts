.PHONY: generate
generate:
	swift package generate-xcodeproj

.PHONY: build
build:
	swift build
