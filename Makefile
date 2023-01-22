
.PHONY: fonts clean build/svg/noto-sans
fonts: build/svg/noto-sans

tmp/Noto_Sans_JP.zip:
	curl https://fonts.google.com/download?family=Noto%20Sans%20JP -o $@

tmp/noto-sans:
	mkdir -p $@

tmp/noto-sans/NotoSansJP-Thin.otf: tmp/Noto_Sans_JP.zip | tmp/noto-sans
	unzip -d tmp/noto-sans tmp/Noto_Sans_JP.zip NotoSansJP-Thin.otf OFL.txt

build:
	mkdir -p $@

build/svg:
	mkdir -p $@

build/svg/noto-sans: tmp/noto-sans/NotoSansJP-Regular.otf | build/svg
	mkdir -p $@
	fontforge -script scripts/extract.py tmp/noto-sans/NotoSansJP-Thin.otf 13 build/svg/noto-sans

clean:
	@-rm -rf build

setup:
	brew bundle --no-lock