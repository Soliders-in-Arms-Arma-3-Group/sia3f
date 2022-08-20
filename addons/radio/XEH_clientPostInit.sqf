#include "script_component.hpp"
// should behave identically to initPlayerLocal

if (!"@ACRE2" call FUNC(checkModPresence)) exitWith {}; // exit if ACRE not loaded

[((group player) getVariable [QGVAR(radioChannel), 1]), GVAR(personalRadio)] spawn FUNC(setRadioChannel);

player addEventHandler ["Killed", {
	GVAR(mpttRadioList) = [] call acre_api_fnc_getMultiPushToTalkAssignment;
}];

player addEventHandler ["Respawn", {
	// Restore ACRE PTT Assignment
	waitUntil { ([] call acre_api_fnc_isInitialized) };
	["loadRadioDefaultSpatials", []] spawn FUNC(ACRERadioSetup);
	["reorderRadioMPTT", [GVAR(personalRadio)]] spawn FUNC(ACRERadioSetup);
}];

["ace_arsenal_displayClosed", {
	["loadRadioDefaultSpatials", []] spawn FUNC(ACRERadioSetup);
	["reorderRadioMPTT", [GVAR(personalRadio)]] spawn FUNC(ACRERadioSetup);
	[((group player) getVariable [QGVAR(radioChannel), 1]), GVAR(personalRadio)] spawn FUNC(setRadioChannel);
}] call CBA_fnc_addEventHandler;
