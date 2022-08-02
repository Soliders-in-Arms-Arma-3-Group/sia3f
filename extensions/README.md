# extensions
The source and builds of all extensions should be here.  Each individual extension's source code should have its own dedicated folder, but all built extensions should be placed in \extensions\builds.  Both x86 and x64 bit versions must be present and included in tools\make.py >> importantFiles.

## How To Setup The Visual Studio 2022 Build Environment
Note that this may change if we ever switch to a better build system such as [CMake](https://cmake.org/) (if you know how to set this up please do so).

### Creating a New Extension
File >> New >> Project >> Dynamic Link Library (DLL).  Set the project name to the extension name.  Set the location to \sia3f\extensions.  Each project should have its own solution with the same name as the extension name.

### Setting up proper output files
In the solution explorer, open the properties menu (the wrench icon).  Select ``General`` under ``Configuration Properties``.  Under the ``Configuration`` dropdown, select either "Release" or "Active(Release)" and under the ``Platform`` dropdown, select Win32.  Then, change the settings there to match these settings:

|General Properties||
|-|-|
|Output Directory|$(SolutionDir)\\..\builds|
|Intermediate Directory|BuildShit\x86|
|Target Name|$(ProjectName)|
|Configuration Type|Dynamic Library (.dll)|

Everything else should be the default values.

### Building extensions
At the top, to the left of the ``Local Windows Debugger`` button, there are two dropdowns.  The first one (the one to the left) should always be set to "Release".  The 2nd one (the one to the right) will have to change while building, it does not matter which one you start with.  Once set, click the green outline of a button directly to the right of the ``Local Windows Debugger`` button and to the left of the fire icon.  An output log will pop up at the bottom of the window, and if the extension is made properly, the last line will read:
```
========== Build: 1 succeeded, 0 failed, 0 up-to-date, 0 skipped ==========
```
A window will also pop up that says something like "Unable to start program... blah blah... dll is not a valid application", ignore it and click ok; We do not want to run the extension outside of Arma anyways.  After the first extension is built, switch the right dropdown to the other option and build again.


## Extensions
Every extension should have documentation here.  A description, example call, and any other relevant information should be present.

### make_descriptionExt
Creates a ``description.ext`` file in the specified file path.  File content:
```
respawnOnStart = -1;

```
Example (STRING callExtension STRING has no functionality):
```
"make_descriptionExt" callExtension ["", ["C:\some\folder"]];
```
Changing the file name or file content is quite simple as they are just preset strings.  As of the writing of this documentation, the file name is on line 35 (or just search for the comment "file name"), and the file content is on like 39 (or just search for the comment "file content).
