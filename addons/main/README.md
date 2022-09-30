# main

Backbone of other components, defining most of the commonly used macros.  Highly recommended, if not required, for use with CBA macros.

## Macro Definitions

Custom macros not imported from CBA are defined here.
***

### LOG_FUNC_START
Log the start of a function to the RPT file.  Should be inserted into the first line that is meant to be executed in a function, i.e, after any if statement that checks for mod presence, config values, etc.

Example RPT file output for the 'test' function in module 'balls':
```
[SIA3F] (balls) Function Started: /z/sia3f/addons/balls/functions/fnc_test.sqf
```

### LOG_FUNC_END
Log the end of a function to the RPT file.  Should be inserted after the last line that is meant to be executed in a function.

Example RPT file output for the 'test' function in module 'balls':
```
[SIA3F] (balls) Function Ended: /z/sia3f/addons/balls/functions/fnc_test.sqf
```

### LOG_FUNC_END_ERROR(error)
Log an error that causes a function to stop before the end (e.g, ``if (condition) exitWith {};``).

Example RPT file output for the 'test' function in module 'balls' with an `error` value of `"test"`:
```
[SIA3F] (balls) Function ended with error: test - /z/sia3f/addons/ace/functions/fnc_test.sqf
```

### GUI_THEME_RGB_<R/G/B>
Get user defined GUI red/green/blue value.  Intended for use in GUI controls.  No parameters.

Default returns:

* Red: ``0.13``
* Green: ``0.54``
* Blue: ``0.21``

Example:
```
GUI_THEME_RGB_R
// Returns user-customized GUI red value or 0.13 if one does not exist.
```
***

### GUI_THEME_ALPHA
Get user defined GUI alpha (transparency) value where a higher value is less transparent.  Intended for use in GUI controls.  By default, will return 0.8.  No parameters.

Example:
```
GUI_THEME_ALPHA
// Returns user-customized GUI alpha value or 0.8 if one does not exist.
```
***

### GUI_THEME_COLOR
Gets a .hpp formatted array of the user defined GUI colors.  Intended for use in .hpp files when defining colors for a GUI.  By default, will return ``{0.13,0.54,0.21,0.8}``.  No parameters.

Example (relevant code marked by  ``!``, everything else is for context):
```hpp
// in someGUI.hpp
#include "script_component.hpp"

class GVAR(someGUI) {
	idd = 69420;
	class controls {
		class someControl: RscText {
			idc = 101;
			x = some_x_pos;
			y = some_y_pos;
			w = some_width;
			h = some_height;
			colorBackground[] = GUI_THEME_COLOR; // !
		};
	};
};
```
***

### GET_CONFIG(var,default)
Gets the [mission config value](https://community.bistudio.com/wiki/getMissionConfigValue) of a variable, returning the ``default`` value if ``var`` is undefined.  Intended for use to get the framework settings set in the Eden Editor.

Parameters: ``var``: the variable name to be fetched from the mission config. ``default``: the default value to return is ``var`` is undefined.

Example for the ``personalRadio`` listbox.  In this example, the mission maker did not touch this value, so it was never defined in the mission.sqm file.
```sqf
private _personalRadioClassname = ["ACRE_PRC343", "ACRE_BF888S"] select GET_CONFIG(personalRadio,0);
// _personalRadioClassname == "ACRE_PRC343"
```
***

### PREP(fncName)
Originally from CBA and modified for the ACE 3 mod, which is where it was stolen from.  Loads and caches a function for later use with the ``FUNC``<!-- ToDo: add link to macro --> macro.

Parameters: ``fncName``: the function name

Example for a function named ``exampleFunction`` in the ``tree`` module.
```hpp
// XEH_PREP.hpp, included in XEH_preInit.sqf

PREP(exampleFunction);
// Will prep the file located at \addons\tree\functions\fnc_exampleFunction.sqf
```
***
