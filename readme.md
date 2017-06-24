haxe-assimp
===========

Haxe bindings for [Open Asset Import Library](http://assimp.sourceforge.net/), a 3D model importer / exporter library.
Check the link above for the full list of supported formats.

Installation
------------

Currently you have to build the library and install it locally through Haxelib:
1. Clone this repository by running `git clone --recursive https://github.com/MattTuttle/haxe-assimp.git`
2. Open a command prompt in project folder and run `lime rebuild . <windows || mac || linux>`
3. Build the neko executable through `haxe tools/build.hxml`
4. Zip the following files and folder: `run.n`, `haxelib.json`, `include.xml`, `ndll`
5. Install the zipped library locally: `haxelib install haxe-assimp.zip`

**Note**: On Windows the generated ndll will appear with a suffix "-xx" where *xx* will be your MSVC version. For the library to work there you'll have to rename the file to just *assimp.ndll*. This will fixed in the future.

Pre-built binaries
------------------

For convenience zipped binaries links are listed below. To install right-click the link, choose "Save link as...", download it and run `haxelib install haxe-assimp.zip`:
* Windows and Mac: [haxe-assimp.zip](release/haxe-assimp.zip)

Usage
-----

* Command line: `haxelib run assimp process <infile.format> <outfile.format>`

Dependencies
------------

* Haxe 3.4.2
* Hxcpp 3.4.64
* Lime 2.9.1 and up (also working with latest release 5.2.1)