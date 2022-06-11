# SIA_main

Backbone of other components, defining most of the commonly used macros.  Highly recommended, if not required, for use with CBA macros.
<br></br>
## Custom Macro Definitions

Custom macros not imported from CBA are defined here.  Some may be similar, if not identical, to the ones used in the [ACE mod](https://github.com/acemod/ACE3).
***

### GUI_THEME_RGB_<R/G/B>
Get user defined GUI red/green/blue value.  Intended for use in GUI controls.  No parameters.

Default returns:

* Red: ``0.13``
* Green: ``0.54``
* Blue: ``0.21``

Example:
```
THEME_RGB_R
// Returns user-customized GUI red value or 0.13 if one does not exist.
```
***

### GUI_THEME_ALPHA
Get user defined GUI alpha (transparency) value where a higher value is less transparent.  Intended for use in GUI controls.  By default, will return 0.8.  No parameters.

Example:
```
THEME_ALPHA
// Returns user-customized GUI alpha value or 0.8 if one does not exist.
```
***

### THEME_COLOR
Gets a .hpp formatted array of the user defined GUI colors.  Intended for use in .hpp files when defining colors for a GUI.  By default, will return ``{0.13,0.54,0.21,0.8}``.  No parameters.

Example (relevant code marked by  ``!``):
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
