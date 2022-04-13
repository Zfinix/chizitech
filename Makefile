.PHONY: gen

run-dev:
	flutter run --target lib/main_development.dart -d macos 

run-web:
	flutter run --target lib/main_production.dart -d web-server --release --web-renderer canvaskit

install-flutter:
	if cd flutter; then git pull && cd .. ; else git clone https://github.com/flutter/flutter.git; fi && ls && flutter/bin/flutter doctor && flutter/bin/flutter clean

install-res:
	$(MAKE) install-flutter

build-prod:
	flutter build web --release -d web-server --web-renderer canvaskit
	@sed -i "s#https://unpkg.com/canvaskit-wasm@0.33.0/bin#/canvaskit#g" "build/web/main.dart.js"
	echo "Replaced Canvaskit"

run-dev-web:
	$(MAKE) js-gen
	flutter run --target lib/main_development.dart -d web-server --web-renderer canvaskit --web-hostname 127.0.0.1 --web-port 8989

