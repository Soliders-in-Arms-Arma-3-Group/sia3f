#include "script_component.hpp"

#define GET_HASH profileNamespace getVariable [\
	QGVAR(ACREDefaultSpatial), \
	["ACRE_PRC343", "ACRE_PRC148", "ACRE_PRC152", "ACRE_PRC77", "ACRE_PRC117F"] createHashMapFromArray ["RIGHT", "LEFT", "LEFT", "LEFT", "LEFT"] \
] // Load player's current default spatial settings.

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

if (!GET_CONFIG(acreEnabled,true) || !hasInterface || !("@ACRE2" call EFUNC(core,checkModPresence))) exitWith {
	LOG("fnc_acreRadioSetup: acre not enabled/loaded or script run on server.");
}; // Exit if not player or if ACRE is disabled/not loaded.

waitUntil { ([] call acre_api_fnc_isInitialized) }; // Wait until player's radios are initialized.
LOG("fnc_acreRadioSetup started (radios initialized)");

private _hasRadio = [player] call acre_api_fnc_hasRadio;

params [
	["_mode", "", [""]],
	["_params", [], [[]]]
];
TRACE_3("ACRERadioSetup params",_mode,_params,_hasRadio);

switch (_mode) do {

	case "setRadioDefaultSpatial" : {
		_params params ["_radio", "_ear"];
		private _hash = GET_HASH; // Get hash of settings.
		_hash set [_radio, _ear]; // Change new setting.

		profileNamespace setVariable [QGVAR(ACREDefaultSpatial), _hash]; // Update player's settings.
		saveProfileNamespace;
		TRACE_1("Hash saved to profileNamespace sia3f_radio_ACREDefaultSpatial",_hash);

		[([_radio] call acre_api_fnc_getRadioByType), _ear] call acre_api_fnc_setRadioSpatial; // Apply chosen radio spatialization.
		hint (getText (ConfigFile >> "CfgWeapons" >> _radio >> "displayName") + " is now set to ear: " + str (_hash get _radio));
		TRACE_2("set radio to ear",_radio,_ear);
	};

	case "loadRadioDefaultSpatials" : {
		private _hash = GET_HASH; // Get hash of settings.
		TRACE_1("loading spatials with settings",_hash);

		{
			if ([player, _x] call acre_api_fnc_hasKindOfRadio) then {
				[([_x] call acre_api_fnc_getRadioByType), _y] call acre_api_fnc_setRadioSpatial;
			};
		} forEach _hash; // Loop through saved settings, checking if player has that radio and applying the saved setting.
	};

	case "resetRadioDefaultSpatials" : {
		private _hash = ["ACRE_PRC343", "ACRE_PRC148", "ACRE_PRC152", "ACRE_PRC77", "ACRE_PRC117F"] createHashMapFromArray ["BOTH", "BOTH", "BOTH", "BOTH", "BOTH"];
		
		profileNamespace setVariable [QGVAR(ACREDefaultSpatial), _hash]; // Update player's settings.
		saveProfileNamespace;
		TRACE_1("profileNamespace sia3f_radio_ACREDefaultSpatial reset saved",_hash);

		hint "Radio spatialization settings reset.";
	};

	case "printRadioDefaultSpatials" : {
		private _hash = GET_HASH; // Get hash of settings.
		private _strArr = []; // Initialize empty string.
		{
			_strArr append [getText (ConfigFile >> "CfgWeapons" >> _x >> "displayName"), " : ", _y, "\n"];
		} forEach _hash;

		TRACE_1("radio default spatials print",_strArr);
		hint (_strArr joinString "");
	};

	case "reorderRadioMPTT" : {
		_params params [
			["_radioType", (["ACRE_PRC343", "ACRE_BF888S"] select GET_CONFIG(personalRadio,0))]
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
	};

	default {
		ERROR("ACRERadioSetup - Unknown mode.");
	};
};

LOG("fnc_acreRadioSetup finished (not necessarily successfully)");
