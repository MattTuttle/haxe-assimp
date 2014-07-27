package tools;

import assimp.Convert;
import neko.Lib;

class Haxelib
{

	public static function main()
	{
		var args = Sys.args();

		var command = args.shift();
		if (args.length != 4 && command != "process")
		{
			Lib.println("USAGE: haxelib run assimp process <inFile> <outFile>");
			return;
		}

		var inFile = args.shift();
		var outFile = args.shift();
		var path = args.shift();

		var formats = Convert.supportedFormats();

		var formatId:String = null;
		for (format in formats)
		{
			if (StringTools.endsWith(outFile, format.extension))
			{
				formatId = format.id;
				break;
			}
		}
		if (formatId == null)
		{
			Lib.println('output file type for "$outFile" not supported');
			Lib.println('Supported formats:');
			for (format in formats)
			{
				Lib.println('\t${format.extension}: ${format.description} [${format.id}]');
			}
			return;
		}

		if (!Convert.convertModel(path + inFile, path + outFile, formatId))
		{
			Lib.println("failed to convert model file");
		}
	}

}
