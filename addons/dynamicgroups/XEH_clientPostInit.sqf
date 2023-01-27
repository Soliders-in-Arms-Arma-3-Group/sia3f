#include "script_component.hpp"

if (
	allDisplays isEqualTo [findDisplay 0] ||
	is3DEN ||
	!GET_CONFIG(frameworkInit,false)
) exitWith {};

// hide player until a role is chosen
player setPosASL [0, 0, 0];
player setCaptive true;
player allowDamage false;
[player, true] remoteExec ["hideObjectGlobal", 2];
[player, false] remoteExec ["enableSimulationGlobal", 2];
player setVariable [QEGVAR(core,isAFK), true];

// ToDo: spawn GUI for squad/role selection
