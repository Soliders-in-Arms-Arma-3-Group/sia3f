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

if (!hasInterface) exitWith {
	LOG_FUNC_END_ERROR("ran on server");
};
LOG_FUNC_START;

private _unit = player; // ToDo: replace with param & execute func on server

_unit setCaptive false;
[_unit, false] remoteExec ["hideObjectGlobal", 2];
[_unit, true] remoteExec ["enableSimulationGlobal", 2];
if ("@ace" call FUNC(checkModPresence)) then {
	private _serializedMedStatus = _unit getVariable [QGVAR(serializedMedStatus), "{}"];
	[_unit, _serializedMedStatus] call ace_medical_fnc_deserializeState;
	TRACE_2("player ACE3 serialized medical status.", _unit, _serializedMedStatus);
};

LOG("player is no longer AFK");
[name _unit + " is no longer AFK."] remoteExec ["systemChat"]; // "<player> is no longer AFK." system chat message.

// Time out for 60 seconds.
[
	{ _this setVariable [QGVAR(isAFK), false] },
	_unit,
	60
] call CBA_fnc_waitAndExecute;

5 cutText ["", "PLAIN", -1, true];
LOG_FUNC_END;
