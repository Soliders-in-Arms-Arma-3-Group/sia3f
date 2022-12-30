#include "script_component.hpp"

if (
	allDisplays isEqualTo [findDisplay 0] ||
	is3DEN ||
	!GET_CONFIG(frameworkInit,false)
) exitWith {};
// basically initServer.sqf

GVAR(startTime) = date;
setTimeMultiplier 0.1;

missionNamespace setVariable [QGVAR(safeStart_phase), "Waiting", true];
missionNamespace setVariable [QGVAR(missionStarted), false, true];

if (!isNil QEGVAR(configuration,arsenals) && "@ace" call EFUNC(core,checkModPresence)) then {
	call FUNC(setupGlobalArsenal);
	[EGVAR(configuration,arsenals)] remoteExecCall [QEFUNC(ace,initLocalArsenal), 0, true];
};

if (!isNil QEGVAR(configuration,buttons)) then {
	if (GET_CONFIG(enableTPMenu,true)) then {
		["enableGlobalMessage", false] call FUNC(teleport); // Disable global message
		{
			_x setObjectTextureGlobal [0, QPATHTOEF(core,ui\ace_button_img.paa)];
		} forEach EGVAR(configuration,buttons); // Add 'Teleport Menu' to objects
	};
};

// Mission End
addMissionEventHandler ["MPEnded", {
	call FUNC(onMissionEnd);
	call FUNC(exportScoreboard);
}];

// Call briefing
[EGVAR(configuration,supportObjects)] remoteExecCall [QFUNC(briefing), 0, true];

// Create respawn markers
{
	if (!isNil (_x select 1)) then {
		if (getMarkerType (_x select 1) == "") then { createMarker [(_x select 1), position (_x select 0)] }; // Use any exisiting respawn markers, otherwise create a new one.
		(_x select 1) setMarkerPos (getPosASL (_x select 0));
	} else {
		ERROR_1("object not found: %1",(_x select 0)); // Error module not found.
	}
} forEach [[respawn_west, "respawn_west"], [respawn_east, "respawn_east"], [respawn_guerrila, "respawn_guerrila"], [respawn_civilian, "respawn_civilian"]];

