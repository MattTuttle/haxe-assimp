.PHONY: clean init build test install

all: init build

clean:
	rm -f release.zip

init:
	git submodule update --init --recursive

build:
	lime rebuild . mac
	haxe tools/build.hxml

test:
	haxelib run assimp process test.obj test.3ds

install: release.zip
	haxelib local $<

release.zip:
	zip $@ -x *.DS_Store -r assimp/ ndll/
	zip $@ haxelib.json include.xml
