.PHONY: setup test deps clean unit-test integration-test clean build build-watch pod-update


setup: clean deps build
	@echo "🚀 Setup complete!"

clean:
	@echo "🧹 Clean and remove pubspec.lock"
	@flutter clean && rm pubspec.lock

deps:
	@echo "🐕 Fetching dependencies"
	@flutter pub get

test: unit-test integration-test

unit-test: 
	@echo "🏃‍ running unit tests"
	@flutter test test/ --reporter=compact

integration-test:
	@echo "🧪 integration tests"
	@cd example && flutter test integration_test/ --reporter=compact

build:
	@echo "🏗️ Building"
	@dart run build_runner build --delete-conflicting-outputs

build-watch:
	@echo "🚧 Building (watch)"
	@dart run build_runner watch --delete-conflicting-outputs

pod-update:
	@echo " Refresh pods"
	@cd example/ios && pod install --repo-update
