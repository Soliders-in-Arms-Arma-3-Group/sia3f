#include "script_component.hpp"
// basically initServer.sqf

GVAR(startTime) = date;
setTimeMultiplier 0.1;

missionNamespace setVariable [QGVAR(setupPhase), "Waiting", true];
missionNamespace setVariable [QGVAR(missionStarted), false, true];

if (!isNil QEGVAR(configuration,arsenals)) then {
	publicVariable QEGVAR(configuration,arsenals);
	// ToDo: setup global arsenal

	{
		clearBackpackCargoGlobal _x;
		clearMagazineCargoGlobal _x;
		clearWeaponCargoGlobal _x;
		clearItemCargoGlobal _x;
		[_x, false] remoteExecCall ["ace_dragging_fnc_setDraggable"];
		[_x, false] remoteExecCall ["ace_dragging_fnc_setCarryable"];
	} forEach EGVAR(configuration,arsenals);
};

if (!isNil QEGVAR(configuration,buttons)) then {
	if (GET_CONFIG(enableTPMenu,true)) then {
		["enableGlobalMessage", false] call TPD_fnc_teleport; // Disable global message
		{
			["addActions", [_x]] call TPD_fnc_teleport; 
			_x setObjectTextureGlobal [0, "sia_f\images\ace_button_img.jpg"];
		} forEach EGVAR(configuration,buttons); // Add 'Teleport Menu' to objects
	};
};
