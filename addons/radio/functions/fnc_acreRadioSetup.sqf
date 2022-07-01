#include "script_component.hpp"

/*
 * Author: McKendrick
 * Actions for the player to configure and setup their ACRE 2 radio settings.
 *
 * Arguments:
 * 0: Mode <STRING>
 *	"setRadioDefaultSpatial" - Updates and applies setting for given radio and ear.
 *	"loadRadioDefaultSpatials" - Applies all saved settings.
 *	"resetRadioDefaultSpatials" - Sets all settings to "BOTH".
 *	"printRadioDefaultSpatials" - Hints all radios with corresponding saved setting.
 *	"reorderRadioMPTT" - Sets the given radio to push to talk one.
 * 1: Params (changes according to mode) <ARRAY>.
 *
 * Return Value:
 * None
 *
 * Example:
 * ["setRadioDefaultSpatial", ["ACRE_PRC152", "LEFT"]] spawn sia3f_radio_fnc_ACRERadioSetup
*/

if ( !sia_f_acreEnabled || !hasInterface ) exitWith {}; // Exit if not player or if ACRE is set to disabled.
waitUntil { ([] call acre_api_fnc_isInitialized) }; // Wait until player's radios are initialized.

private _hasRadio = [player] call acre_api_fnc_hasRadio; // Get variable if player has radio.

params [
	["_mode", "", [""]],
	["_params", [], [[]]]
];

fnc_sia_getACREHash = {
	profileNamespace getVariable ["SIA_F_ACREDefaultSpatial", 
		["ACRE_PRC343", "ACRE_PRC148", "ACRE_PRC152", "ACRE_PRC77", "ACRE_PRC117F"] createHashMapFromArray ["RIGHT", "LEFT", "LEFT", "LEFT", "LEFT"] // If player has no default settings, then load a blank template.
	]; // Load player's current default spatial settings.
};

switch (_mode) do {

	case "setRadioDefaultSpatial" :
	{
		private _radio = _params select 0;
		private _ear = _params select 1;
		private _hash = call fnc_sia_getACREHash; // Get hash of settings.
		_hash set [_radio, _ear]; // Change new setting.
		profileNamespace setVariable ["SIA_F_ACREDefaultSpatial", _hash]; // Update player's settings.
		saveProfileNamespace;
		[([_radio] call acre_api_fnc_getRadioByType), _ear] call acre_api_fnc_setRadioSpatial; // Apply chosen radio spatialization.
		hint (getText (ConfigFile >> "CfgWeapons" >> _radio >> "displayName") + " is now set to ear: " + str (_hash get _radio));
	};

	case "loadRadioDefaultSpatials" :
	{
		private _hash = call fnc_sia_getACREHash; // Get hash of settings.
		{
			if ([player, _x] call acre_api_fnc_hasKindOfRadio) then {
				[([_x] call acre_api_fnc_getRadioByType), _y] call acre_api_fnc_setRadioSpatial;
			};
		} forEach _hash; // Loop through saved settings, checking if player has that radio and applying the saved setting.
	};

	case "resetRadioDefaultSpatials" :
	{
		private _hash = ["ACRE_PRC343", "ACRE_PRC148", "ACRE_PRC152", "ACRE_PRC77", "ACRE_PRC117F"] createHashMapFromArray ["BOTH", "BOTH", "BOTH", "BOTH", "BOTH"];
		profileNamespace setVariable ["SIA_F_ACREDefaultSpatial", _hash]; // Update player's settings.
		saveProfileNamespace;
		hint "Radio spatialization settings reset.";
	};

	case "printRadioDefaultSpatials" :
	{
		private _hash = call fnc_sia_getACREHash; // Get hash of settings.
		private _str = ""; // Initialize empty string.
		{
			_str = (_str + (getText (ConfigFile >> "CfgWeapons" >> _x >> "displayName")) + " : " + _y + "\n");
		} forEach _hash;
		hint _str;
	};

	case "reorderRadioMPTT" :
	{
		_radioType = (_params select 0);
		_hasRadio = [player, _radioType] call acre_api_fnc_hasKindOfRadio;
		if (!_hasRadio) exitWith {};
		private _radio = ([_radioType] call acre_api_fnc_getRadioByType);
		private _mptt = [] call acre_api_fnc_getMultiPushToTalkAssignment;
		private _index = _mptt find _radio;

		if (_index > 0) then {
			_mptt deleteAt _index;
			_mptt insert [0, [_radio]];

			private _success = [_mptt] call acre_api_fnc_setMultiPushToTalkAssignment;
			if (!_success) then { ["ACRERadioSetup Error: ACRE Reorder MPTT failed!"] call BIS_fnc_error };
		};
	};

	default
	{
		["ACRERadioSetup Error: Unknown mode: %1", _mode] call BIS_fnc_error; // Throw error if incorrect mode is given.
	};
};
