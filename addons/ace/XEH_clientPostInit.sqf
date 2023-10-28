#include "script_component.hpp"
// should behave identically to initPlayerLocal

if (
	!("@ace" call EFUNC(core,checkModPresence)) ||
	allDisplays isEqualTo [findDisplay 0] ||
	is3DEN ||
	!GET_CONFIG(frameworkInit,false)
) exitWith {};

// Player Self Actions
call FUNC(playerActions);
call FUNC(zeusActions);

if (GET_CONFIG(enableManageKit,true) && GET_CONFIG(enableKitAutosave,true)) then {
	GVAR(arsenalClosedEH) = ["ace_arsenal_displayClosed", {
		if ((player getVariable [QEGVAR(core,savedLoadout), []]) isEqualTo []) then {
			player setVariable [QEGVAR(core,savedLoadout), getUnitLoadout player];
			hint "Kit saved automatically. Will be loaded on respawn.";
		};
	}] call CBA_fnc_addEventHandler;
};
