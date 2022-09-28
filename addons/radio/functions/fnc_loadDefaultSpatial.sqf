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

{
	private _value = ["LEFT", "CENTER", "RIGHT"] select (missionNamespace getVariable ["sia3f_radio_" + _x + "_spatialization", 1]);

	if ([player, _x] call acre_api_fnc_hasKindOfRadio) then { // check if player has radio
		[([_x] call acre_api_fnc_getRadioByType), _value] call acre_api_fnc_setRadioSpatial; // apply spatialization
	};
} forEach [
	"ACRE_PRC343",
	"ACRE_PRC152",
	"ACRE_PRC148",
	"ACRE_PRC117F",
	"ACRE_PRC77",
	"ACRE_SEM52SL",
	"ACRE_SEM70",
	"ACRE_BF888S",
	"ACRE_VRC64",
	"ACRE_VRC103",
	"ACRE_VRC110",
	"ACRE_VRC111",
	"ACRE_SEM90"
];
