all:
	rm -Rf out/$(VERSION)/
	mkdir -p out/$(VERSION)/
	cd manual/$(VERSION)/ && mkdocs build --clean && mv site/ ../../out/$(VERSION)/
	cd manual/$(VERSION)/ && mkdocs build --clean && mkdocs2pandoc > pico-ceu-$(VERSION).md && pandoc pico-ceu-$(VERSION).md -o pico-ceu-$(VERSION).pdf && mv site/ ../../out/$(VERSION)/
	pandoc manual/index.md > out/index.html
