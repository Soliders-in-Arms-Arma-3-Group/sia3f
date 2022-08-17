#include "script_component.hpp"
// should behave identically to initPlayerLocal

[((group player) getVariable [QGVAR(radioChannel), 1]), GVAR(personalRadio)] spawn EFUNC(radio,setRadioChannel);

player addEventHandler ["Killed", {
	params ["_unit"];

	if ("@ACRE2" call FUNC(checkModPresence)) then { GVAR(mpttRadioList) = [] call acre_api_fnc_getMultiPushToTalkAssignment; };

}];

player addEventHandler ["Respawn", {
	params ["_unit"];


	// Restore ACRE PTT Assignment
	if ("@ACRE2" call FUNC(checkModPresence)) then {
		waitUntil { ([] call acre_api_fnc_isInitialized) };
		["loadRadioDefaultSpatials", []] spawn EFUNC(radio,ACRERadioSetup);
		["reorderRadioMPTT", [GVAR(personalRadio)]] spawn EFUNC(radio,ACRERadioSetup);
	};
}];

["ace_arsenal_displayClosed", {
	["loadRadioDefaultSpatials", []] spawn EFUNC(radio,ACRERadioSetup);
	["reorderRadioMPTT", [GVAR(personalRadio)]] spawn EFUNC(radio,ACRERadioSetup);
	[((group player) getVariable [QGVAR(radioChannel), 1]), GVAR(personalRadio)] spawn EFUNC(radio,setRadioChannel);
}] call CBA_fnc_addEventHandler;
