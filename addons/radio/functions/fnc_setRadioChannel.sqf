#include "script_component.hpp"

/*
 * Authors: McKendrick
 * Set's the channel for the player's radio of the given type.
 *
 * Arguments:
 * O: Channel <NUMBER>
 * 1: Radio class <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * spawn sia3f_radio_fnc_setRadioChannel
*/

if (!GET_CONFIG(acreEnabled,true) || !("@ACRE2" call EFUNC(core,checkModPresence))) exitWith {
	LOG_FUNC_END_ERROR("acre not enabled/loaded");
};

params [
	["_channel", 1, [0]],
	["_radioType", "", [""]]
];

LOG_FUNC_START;

if (!([player, _radioType] call acre_api_fnc_hasKindOfRadio)) exitWith { LOG_FUNC_END_ERROR("Radio not found"); };

waitUntil { ([] call acre_api_fnc_isInitialized) }; // Wait until player's radios are initialized.
private _radioId = [_radioType] call acre_api_fnc_getRadioByType;
[_radioId, _channel] call acre_api_fnc_setRadioChannel;
TRACE_2("set radio channel:",_radioId,_channel);

// ToDo: TFAR implementation.

LOG_FUNC_END;
