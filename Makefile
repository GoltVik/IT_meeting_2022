.PHONY: build
build:
	rm -rf docs/*
	flutter build web --web-renderer canvaskit --release --base-href '/IT_meeting_2022/'
	cp -R build/web/* docs/
