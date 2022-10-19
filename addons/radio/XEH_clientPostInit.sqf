#include "script_component.hpp"

#define PERSONAL_RADIO_CLASSNAME missionNameSpace getVariable [QGVAR(personalRadio), "ACRE_PRC343"]
// should behave identically to initPlayerLocal

if (
	!GET_CONFIG(acreEnabled,true) ||
	!("@ACRE2" call EFUNC(core,checkModPresence)) ||
	allDisplays isEqualTo [findDisplay 0] ||
	is3DEN ||
	!GET_CONFIG(frameworkInit,false)
) exitWith {};

call FUNC(giveRadios);

player addEventHandler ["Killed", {
	GVAR(mpttRadioList) = [] call acre_api_fnc_getMultiPushToTalkAssignment;
}];

player addEventHandler ["Respawn", {
	// Restore ACRE PTT Assignment
	[] spawn FUNC(loadDefaultSpatial);
	[PERSONAL_RADIO_CLASSNAME] spawn FUNC(reorderMPTT);
}];

if ("@ace" call EFUNC(core,checkModPresence)) then {
	["ace_arsenal_displayClosed", {
		// private _personalRadioClassname = ;
		[] spawn FUNC(loadDefaultSpatial);
		[PERSONAL_RADIO_CLASSNAME] spawn FUNC(reorderMPTT);
		[((group player) getVariable [QEGVAR(configuration,radioChannel), 1]), _personalRadioClassname] spawn FUNC(setRadioChannel);
	}] call CBA_fnc_addEventHandler;
};
