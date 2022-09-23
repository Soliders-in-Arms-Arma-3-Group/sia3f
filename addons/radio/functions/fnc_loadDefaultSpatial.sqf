#include "script_component.hpp"

/*
 * Author: McKendrick, modified by Siege
 * Applies all saved settings.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] spawn sia3f_radio_fnc_loadDefaultSpatial
*/

if (!GET_CONFIG(acreEnabled,true) || !hasInterface || !("@ACRE2" call EFUNC(core,checkModPresence))) exitWith {
	WARNING("fnc_acreRadioSetup: acre not enabled/loaded or script run on server.");
}; // Exit if not player or if ACRE is disabled/not loaded.

waitUntil { ([] call acre_api_fnc_isInitialized) }; // Wait until player's radios are initialized.
LOG("fnc_acreRadioSetup started (radios initialized)");

private _hash = GET_HASH; // Get hash of settings.
TRACE_1("loading spatials with settings",_hash);

{
	if ([player, _x] call acre_api_fnc_hasKindOfRadio) then {
		[([_x] call acre_api_fnc_getRadioByType), _y] call acre_api_fnc_setRadioSpatial;
	};
} forEach _hash; // Loop through saved settings, checking if player has that radio and applying the saved setting.