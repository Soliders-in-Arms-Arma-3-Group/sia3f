#include "script_component.hpp"
// should behave identically to initPlayerLocal

if (!GET_CONFIG(acreEnabled,true) || !("@ACRE2" call EFUNC(core,checkModPresence)) || (allDisplays isEqualTo [findDisplay 0]) || is3DEN) exitWith {};

private _personalRadioClassname = missionNameSpace getVariable [QEGVAR(configuration,personalRadio),"ACRE_PRC343"];

call FUNC(giveRadios);

player addEventHandler ["Killed", {
	GVAR(mpttRadioList) = [] call acre_api_fnc_getMultiPushToTalkAssignment;
}];

player addEventHandler ["Respawn", {
	// Restore ACRE PTT Assignment
	waitUntil { ([] call acre_api_fnc_isInitialized) };
	[] spawn FUNC(loadDefaultSpatial);
	[_personalRadioClassname] spawn FUNC(reorderMPTT);
}];

["ace_arsenal_displayClosed", {
	[] spawn FUNC(loadDefaultSpatial);
	[_personalRadioClassname] spawn FUNC(reorderMPTT);
	[((group player) getVariable [QEGVAR(configuration,radioChannel), 1]), _personalRadioClassname] spawn FUNC(setRadioChannel);
}] call CBA_fnc_addEventHandler;
