
.PHONY: fonts
fonts: tmp/noto-sans/NotoSansJP-Regular.otf

tmp/Noto_Sans_JP.zip:
	curl https://fonts.google.com/download?family=Noto%20Sans%20JP -o $@

tmp/noto-sans:
	mkdir -p $@

tmp/noto-sans/NotoSansJP-Regular.otf: tmp/Noto_Sans_JP.zip | tmp/noto-sans
	unzip -fd tmp/noto-sans tmp/Noto_Sans_JP.zip NotoSansJP-Regular.otf OFL.txt

build:
	mkdir -p $@

build/svg:
	mkdir -p $@

build/svg/noto-sans.svg: tmp/noto-sans/NotoSansJP-Regular.otf | build/svg
	fontforge -c 'import fontforge; fontforge.open("tmp/noto-sans/NotoSansJP-Regular.otf", 26).generate("build/svg/noto-sans.svg")'

setup:
	brew bundle --no-lock