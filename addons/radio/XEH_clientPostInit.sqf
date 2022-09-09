#include "script_component.hpp"
// should behave identically to initPlayerLocal

if (!GET_CONFIG(acreEnabled,true) || !("@ACRE2" call EFUNC(core,checkModPresence))) exitWith {}; // exit if ACRE not loaded

private _personalRadioClassname = ["ACRE_PRC343", "ACRE_BF888S"] select GET_CONFIG(personalRadio,0);

[((group player) getVariable [QEGVAR(configuration,radioChannel), 1]), _personalRadioClassname] spawn FUNC(setRadioChannel);

player addEventHandler ["Killed", {
	GVAR(mpttRadioList) = [] call acre_api_fnc_getMultiPushToTalkAssignment;
}];

player addEventHandler ["Respawn", {
	// Restore ACRE PTT Assignment
	waitUntil { ([] call acre_api_fnc_isInitialized) };
	["loadRadioDefaultSpatials", []] spawn FUNC(ACRERadioSetup);
	["reorderRadioMPTT", [_personalRadioClassname]] spawn FUNC(ACRERadioSetup);
}];

["ace_arsenal_displayClosed", {
	["loadRadioDefaultSpatials", []] spawn FUNC(ACRERadioSetup);
	["reorderRadioMPTT", [_personalRadioClassname]] spawn FUNC(ACRERadioSetup);
	[((group player) getVariable [QEGVAR(configuration,radioChannel), 1]), _personalRadioClassname] spawn FUNC(setRadioChannel);
}] call CBA_fnc_addEventHandler;
