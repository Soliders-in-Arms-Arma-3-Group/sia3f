#include "script_component.hpp"

/*
 * Authors: McKendrick, Siege
 * Makes player no longer AFK.
 * 
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_core_fnc_goAFK
*/

if (!hasInterface) exitWith {};
LOG("fnc_exitAFK.sqf started.");

private _unit = player; // ToDo: replace with param & execute func on server

[_unit, false] remoteExec ["hideObjectGlobal", 2];
[_unit, true] remoteExec ["enableSimulationGlobal", 2];
if ("@ace" call FUNC(checkModPresence)) then {
	private _serializedMedStatus = _unit getVariable [QGVAR(serializedMedStatus), "{}"];
	[_unit, _serializedMedStatus] call ace_medical_fnc_deserializeState;
};
LOG("fnc_exitAFK.sqf deserialized player.");

[(name _unit + " is no longer AFK.")] remoteExec ["systemChat"]; // "<player> is no longer AFK." system chat message.
[] spawn { sleep 60; _unit setVariable [QGVAR(isAFK), false]; }; // Time out for 60 seconds.

5 cutText ["", "PLAIN", -1, true];

INFO("fnc_exitAFK.sqf executed.");
