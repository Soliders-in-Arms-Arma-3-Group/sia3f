#include "script_component.hpp"

/*
 * Author: McKendrick, modified by Siege
 * Sets the given radio to push to talk one.
 *
 * Arguments:
 * 0: Classname of radio to set <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["ACRE_PRC343"] spawn sia3f_radio_fnc_reorderMPTT
*/

if (!GET_CONFIG(acreEnabled,true) || !hasInterface || !("@ACRE2" call EFUNC(core,checkModPresence))) exitWith {
	WARNING("fnc_acreRadioSetup: acre not enabled/loaded or script run on server.");
}; // Exit if not player or if ACRE is disabled/not loaded.

waitUntil { ([] call acre_api_fnc_isInitialized) }; // Wait until player's radios are initialized.
LOG("fnc_acreRadioSetup started (radios initialized)");

params [
	["_radioType", missionNameSpace getVariable [QGVAR(personalRadio), "ACRE_PRC343"], ""]
];

_hasRadio = [player, _radioType] call acre_api_fnc_hasKindOfRadio;
if (!_hasRadio) exitWith {
	LOG("fnc_acreRadioSetup Error: ACRE Reorder MPTT - player has no radio.");
};

private _radio = [_radioType] call acre_api_fnc_getRadioByType;
private _mptt = [] call acre_api_fnc_getMultiPushToTalkAssignment;
private _index = _mptt find _radio;
TRACE_3("fnc_acreRadioSetup: ACRE Reorder MPTT vars",_radio,_mptt,_index);

if (_index > 0) then {
	_mptt deleteAt _index;
	_mptt insert [0, [_radio]];

	private _success = [_mptt] call acre_api_fnc_setMultiPushToTalkAssignment;
	if (!_success) then {
		ERROR_MSG("fnc_acreRadioSetup Error: ACRE Reorder MPTT failed!");
	};
};
