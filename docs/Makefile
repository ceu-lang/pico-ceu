all:
	rm -Rf out/$(VERSION)/
	mkdir -p out/manual/
	cd manual/$(VERSION)/ && mkdocs build --clean && mkdocs2pandoc > pico-ceu-$(VERSION).md && pandoc pico-ceu-$(VERSION).md -o pico-ceu-$(VERSION).pdf && mv site/ ../../out/manual/$(VERSION)/
	pandoc manual/index.md > out/index.html
