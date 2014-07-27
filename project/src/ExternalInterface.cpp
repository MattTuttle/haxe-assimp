#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include <assimp/cimport.h>
#include <assimp/cexport.h>
#include <assimp/scene.h>
#include <assimp/postprocess.h>

namespace assimp
{

	int id_id;
	int id_description;
	int id_extension;

	value assimp_convert(value inFile, value outFile, value format)
	{
		val_check(inFile, string);
		val_check(outFile, string);
		val_check(format, string);
		const aiScene *scene = aiImportFile(val_string(inFile), 0);
		if (scene)
		{
			aiReturn result = aiExportScene(scene, val_string(format), val_string(outFile), aiProcess_Triangulate | aiProcess_GenNormals);
			aiReleaseImport(scene);
			return alloc_bool(result == aiReturn_SUCCESS);
		}
		return alloc_bool(false);
	}
	DEFINE_PRIM(assimp_convert, 3);

	value assimp_formats()
	{
		size_t numFormats = aiGetExportFormatCount();
		value a = alloc_array(numFormats);
		for (size_t i = 0; i < numFormats; i++)
		{
			const aiExportFormatDesc *desc = aiGetExportFormatDescription(i);
			value obj = alloc_empty_object();
			alloc_field(obj, id_id, alloc_string(desc->id));
			alloc_field(obj, id_description, alloc_string(desc->description));
			alloc_field(obj, id_extension, alloc_string(desc->fileExtension));
			val_array_set_i(a, i, obj);
		}
		return a;
	}
	DEFINE_PRIM(assimp_formats, 0);

	extern "C" void assimp_main()
	{
		id_id = val_id("id");
		id_description = val_id("description");
		id_extension = val_id("extension");
	}
	DEFINE_ENTRY_POINT(assimp_main);

}


extern "C" int assimp_register_prims()
{
	return 0;
}
