#include "pch.h"
#include <string>
#include <cstring>
#include <sstream>

extern "C"
{
	//--- Called by Engine on extension load 
	__declspec (dllexport) void __stdcall RVExtensionVersion(char* output, int outputSize);
	//--- STRING callExtension STRING
	__declspec (dllexport) void __stdcall RVExtension(char* output, int outputSize, const char* function);
	//--- STRING callExtension ARRAY
	__declspec (dllexport) int __stdcall RVExtensionArgs(char* output, int outputSize, const char* function, const char** argv, int argc);
}

void __stdcall RVExtensionVersion(char* output, int outputSize) {
	strncpy_s(output, outputSize, "make_descriptionExt v0.1", _TRUNCATE);
}

void __stdcall RVExtension(char* output, int outputSize, const char* function)
{
	strncpy_s(output, outputSize, "test extension", _TRUNCATE);
}

int __stdcall RVExtensionArgs(char* output, int outputSize, const char* function, const char** argv, int argc)
{
	std::stringstream sstream;
	for (int i = 0; i < argc; i++)
	{
		sstream << argv[i];
	}
	strncpy_s(output, outputSize, sstream.str().c_str(), _TRUNCATE);
	return 0;
}