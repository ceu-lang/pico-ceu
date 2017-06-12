all:
	rm -Rf out/
	mkdir -p out/
	cd v0.30/ && mkdocs build --clean && mv site/ ../out/v0.30/
	cd v0.30/ && mkdocs build --clean && mkdocs2pandoc > pico-ceu-v0.30.md && pandoc pico-ceu-v0.30.md -o pico-ceu-v0.30.pdf && mv site/ ../out/v0.30/
