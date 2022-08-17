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
 * call sia3f_radio_fnc_giveRadios
*/

params [
	["_channel", 1, [0]],
	["_radioType", "", [""]]
];

if ("@ACRE2" call FUNC(checkModPresence)) then {
	waitUntil { ([] call acre_api_fnc_isInitialized) }; // Wait until player's radios are initialized.
	private _radioId = [_radioType] call acre_api_fnc_getRadioByType
	[_radioId, _channel] call acre_api_fnc_setRadioChannel;
};

// To-do: TFAR implementation.