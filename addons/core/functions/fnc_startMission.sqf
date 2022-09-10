#include "script_component.hpp"

/*
 * Author: McKendrick
 * Changes the mission status to "started", as well as displays some cinematic visuals for the players. Execute on the server.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_core_fnc_startMission
*/

if (!isServer) exitWith {}; // Exit if not server.

params [
	["_gm", (getAssignedCuratorUnit (allCurators select 0))]
];

if (isMultiplayer) then { setDate GVAR(startTime) }; // Set time to start of mission.
setTimeMultiplier 1; // Set time acceleration to default.

missionNamespace setVariable [QGVAR(missionStarted), true, true]; // Update variable.

if (GET_CONFIG(briefLoadout,true)) then { remoteExec [QFUNC(loadoutNotes)] }; // Refresh loadout information if enabled.

// Update phase to "Mission Started".
missionNamespace setVariable [QGVAR(safeStart_phase), "In Progress", true];
[QGVAR(safeStart_phase), ["Mission is a go!", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\run_ca.paa"]] remoteExec ["BIS_fnc_showNotification"];
[""] remoteExec ["hintSilent"];

// Display intro text if enabled.
if (GET_CONFIG(showIntroText,true)) then {
	[
		{ [(getMissionConfigValue ["onLoadName", missionName])] remoteExec ["BIS_fnc_moduleMissionName", _this] },
		_gm,
		5
	] call CBA_fnc_waitAndExecute;
	
	[
		{ remoteExecCall [_this] },
		QFUNC(introText),
		15
	] call CBA_fnc_waitAndExecute;
};
