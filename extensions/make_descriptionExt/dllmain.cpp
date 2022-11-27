#include "pch.h"
#include <string>
#include <cstring>
#include <sstream>
#include <iostream>
#include <fstream>

extern "C" {
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

void __stdcall RVExtension(char* output, int outputSize, const char* filePath) {
	strncpy_s(output, outputSize, "Syntax Error - Use format STRING callExtension ARRAY.", _TRUNCATE);
}

int __stdcall RVExtensionArgs(char* output, int outputSize, const char* function, const char** argv, int argc) {
	// generate filepath string from input array
	std::stringstream sstream;
	for (int i = 0; i < argc; i++)
	{
		sstream << argv[i];
	}
	std::string filePath = sstream.str().substr(1, sstream.str().length() - 2); // remove leading/trailing quotations
	filePath.append("description.ext"); // file name
	
	// check if file exists, should be the most efficient method (https://stackoverflow.com/a/12774387/16277419)
/* 	struct stat buffer;
	if (stat(filePath.c_str(), &buffer) != 0) {
		return 1;
	} */

	// create file and insert content
	std::ofstream file(filePath); // create file
	file << "respawnOnStart = -1;\n"; // file content (\n is a new line)
	file.close();

	strncpy_s(output, outputSize, filePath.c_str(), _TRUNCATE); // return file path because why not
	return 0;
}
