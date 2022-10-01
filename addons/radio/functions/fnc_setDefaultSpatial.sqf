#include "script_component.hpp"

/*
 * Author: McKendrick, modified by Siege
 * Updates and applies setting for given radio and ear.
 *
 * Arguments:
 * 0: Radio classname to change ear for <STRING>
 * 1: Ear to set, 0: Left, 1: Both, 2: Right <SCALAR<0-2>> (default: 1)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["ACRE_PRC152", "LEFT"] spawn sia3f_radio_fnc_setDefaultSpatial
*/

if (!GET_CONFIG(acreEnabled,true) || !hasInterface || !("@ACRE2" call EFUNC(core,checkModPresence))) exitWith {
	WARNING("fnc_acreRadioSetup: acre not enabled/loaded or script run on server.");
}; // Exit if not player or if ACRE is disabled/not loaded.

waitUntil { ([] call acre_api_fnc_isInitialized) }; // Wait until player's radios are initialized.
LOG("fnc_acreRadioSetup started (radios initialized)");

params [
	["_radio", "", [""]],
	["_ear", 1 , [0]]
];
TRACE_2("params",_radio,_ear);

private _ear = ["LEFT", "CENTER", "RIGHT"] select _ear;

[([_radio] call acre_api_fnc_getRadioByType), _ear] call acre_api_fnc_setRadioSpatial; // Apply chosen radio spatialization.
TRACE_2("set radio to ear",_radio,_ear);
