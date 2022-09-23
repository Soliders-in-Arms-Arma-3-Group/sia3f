#include "script_component.hpp"

/*
 * Author: McKendrick, modified by Siege
 * Updates and applies setting for given radio and ear.
 *
 * Arguments:
 * 0: Radio to change ear for <STRING>
 * 1: Ear to set <STRING>
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

_params params [
	["_radio", "", ""],
	["_ear", "" , ""]
];

private _hash = GET_HASH; // Get hash of settings.
_hash set [_radio, _ear]; // Change new setting.

profileNamespace setVariable [QGVAR(ACREDefaultSpatial), _hash]; // Update player's settings.
saveProfileNamespace;
TRACE_1("Hash saved to profileNamespace sia3f_radio_ACREDefaultSpatial",_hash);

[([_radio] call acre_api_fnc_getRadioByType), _ear] call acre_api_fnc_setRadioSpatial; // Apply chosen radio spatialization.
TRACE_2("set radio to ear",_radio,_ear);
