#include "script_component.hpp"

/*
 * Author: Siege
 * Creates the description.ext file.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_initFramework
*/

if (("sia3f_configuration_hiddenConfigValues" get3DENMissionAttribute "sia3f_configuration_frameworkInit") isEqualTo true) exitWith {
	// attribute starts as '0' and is set to true once initialization is complete, so comparison can't by type strict (no ==)
	["SIA Mission Framework has already been initialized.", 1] call BIS_fnc_3DENNotification;
};

private _callback = "make_descriptionExt" callExtension ["", [getMissionPath ""]];
// ToDo: log callback, check for success and notify player if it fails.

SET_CONFIG(hiddenConfigValues,frameworkInit,true);
do3DENAction "MissionSave";
["SIA Mission Framework Initialization Complete!"] call BIS_fnc_3DENNotification;
