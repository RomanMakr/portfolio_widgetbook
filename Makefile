ifeq ($(OS),Windows_NT)
FLUTTER ?= flutter.bat
DART ?= dart.bat
else
FLUTTER ?= flutter
DART ?= dart
endif
DEVICE ?= chrome
PLATFORMS ?= web,android,ios
TEST_PATH ?= test

.DEFAULT_GOAL := help

.PHONY: help deps platforms devices run widgetbook analyze test coverage format check build-web build-widgetbook clean
.PHONY: setup-linux setup-macos setup-windows run-linux run-macos run-windows
.PHONY: widgetbook-linux widgetbook-macos widgetbook-windows build-linux build-macos build-windows

help:
	@echo make deps                 - Install Flutter dependencies
	@echo make platforms            - Generate runners using PLATFORMS=web,android,ios
	@echo make devices              - List available devices
	@echo make run                  - Run the app using DEVICE=chrome
	@echo make widgetbook           - Run Widgetbook using DEVICE=chrome
	@echo make setup-linux          - Generate Web and Linux runners
	@echo make setup-macos          - Generate Web and macOS runners
	@echo make setup-windows        - Generate Web and Windows runners
	@echo make run-linux            - Run the Linux app
	@echo make run-macos            - Run the macOS app
	@echo make run-windows          - Run the Windows app
	@echo make widgetbook-linux     - Run Widgetbook on Linux
	@echo make widgetbook-macos     - Run Widgetbook on macOS
	@echo make widgetbook-windows   - Run Widgetbook on Windows
	@echo make build-linux          - Build the Linux app
	@echo make build-macos          - Build the macOS app
	@echo make build-windows        - Build the Windows app
	@echo make analyze              - Run static analysis
	@echo make test                 - Run tests using TEST_PATH=test
	@echo make coverage             - Run tests and write coverage/lcov.info
	@echo make format               - Format Dart source and tests
	@echo make check                - Run analysis and tests
	@echo make build-web            - Build the app into build/web/
	@echo make build-widgetbook     - Build Widgetbook into build/widgetbook/
	@echo make clean                - Remove Flutter build artifacts

deps:
	"$(FLUTTER)" pub get

platforms:
	"$(FLUTTER)" create --platforms="$(PLATFORMS)" --project-name portfolio_widgetbook .

setup-linux: PLATFORMS = web,linux
setup-macos: PLATFORMS = web,macos
setup-windows: PLATFORMS = web,windows
setup-linux setup-macos setup-windows: platforms

devices:
	"$(FLUTTER)" devices

run:
	"$(FLUTTER)" run -d "$(DEVICE)" -t lib/main.dart

run-linux: DEVICE = linux
run-macos: DEVICE = macos
run-windows: DEVICE = windows
run-linux run-macos run-windows: run

widgetbook:
	"$(FLUTTER)" run -d "$(DEVICE)" -t lib/widgetbook/main.dart

widgetbook-linux: DEVICE = linux
widgetbook-macos: DEVICE = macos
widgetbook-windows: DEVICE = windows
widgetbook-linux widgetbook-macos widgetbook-windows: widgetbook

build-linux:
	"$(FLUTTER)" build linux -t lib/main.dart

build-macos:
	"$(FLUTTER)" build macos -t lib/main.dart

build-windows:
	"$(FLUTTER)" build windows -t lib/main.dart

analyze:
	"$(FLUTTER)" analyze --no-pub

test:
	"$(FLUTTER)" test --no-pub "$(TEST_PATH)"

coverage:
	"$(FLUTTER)" test --no-pub --coverage "$(TEST_PATH)"

format:
	"$(DART)" format lib test

check: analyze test

build-web:
	"$(FLUTTER)" build web -t lib/main.dart --output build/web

build-widgetbook:
	"$(FLUTTER)" build web -t lib/widgetbook/main.dart --output build/widgetbook

clean:
	"$(FLUTTER)" clean
