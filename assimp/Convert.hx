package assimp;

#if neko
import neko.Lib;
#elseif cpp
import cpp.Lib;
#end

typedef ExportFormat = {
	var id:String;
	var description:String;
	var extension:String;
}

class Convert
{

	public static inline function convertModel(inFile:String, outFile:String, format:String):Bool
	{
		#if neko
		if (!init)
		{
			loadNekoAPI();
			init = true;
		}
		#end

		#if (neko || cpp)
		return assimp_convert(inFile, outFile, format);
		#end
	}

	public static inline function supportedFormats():Array<ExportFormat>
	{
		#if neko
		return neko.Lib.nekoToHaxe(assimp_formats());
		#elseif cpp
		return assimp_formats();
		#end
	}

	#if neko
	public static function loadNekoAPI()
	{
		var i = Lib.load("assimp","neko_init", 5);
		if (i != null)
		{
			i(function(s) return new String(s), function(len:Int) { var r = []; if (len > 0) r[len - 1] = null; return r; }, null, true, false);
		}
	}
	private static var init:Bool = false;
	#end

	#if (neko || cpp)
	private static var assimp_convert = Lib.load("assimp", "assimp_convert", 3);
	private static var assimp_formats = Lib.load("assimp", "assimp_formats", 0);
	#end

}
