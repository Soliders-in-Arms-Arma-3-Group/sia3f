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
	LOG_FUNC_END_ERROR("acre not enabled/loaded or script run on server");
}; // Exit if not player or if ACRE is disabled/not loaded.

params [
	["_radioType", missionNamespace getVariable [QGVAR(personalRadio), "ACRE_PRC343"], [""]]
];

if (isNil "_radioType" || _radioType == "") exitWith {
	LOG_FUNC_END_ERROR("radioType nil or empty");
};

LOG_FUNC_START;
TRACE_1("params",_radioType);

waitUntil { ([] call acre_api_fnc_isInitialized) }; // Wait until player's radios are initialized.

_hasRadio = [player, _radioType] call acre_api_fnc_hasKindOfRadio;
if (!_hasRadio) exitWith {
	LOG_FUNC_END_ERROR("player has no radio");
};

private _radio = [_radioType] call acre_api_fnc_getRadioByType;
private _mptt = [] call acre_api_fnc_getMultiPushToTalkAssignment;
private _index = _mptt find _radio;
TRACE_3("ACRE Reorder MPTT vars",_radio,_mptt,_index);

if (_index > 0) then {
	_mptt deleteAt _index;
	_mptt insert [0, [_radio]];

	private _success = [_mptt] call acre_api_fnc_setMultiPushToTalkAssignment;
	if (!_success) then {
		ERROR_MSG("fnc_acreRadioSetup Error: ACRE Reorder MPTT failed!");
	};
};

LOG_FUNC_END;
