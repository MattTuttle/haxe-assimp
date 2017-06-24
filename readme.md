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

Pre-build binaries
------------------

For convenience zipped binaries links are listed below. To install download it and run `haxelib install <filename.zip>`:
* Windows: [assimp-win.zip](release/assimp-win.zip)
* Mac (coming soon)

Usage
-----

* Command line: `haxelib run assimp process <infile.format> <outfile.format>`