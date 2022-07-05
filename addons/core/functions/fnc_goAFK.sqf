#include "script_component.hpp"

#define TIMEOUT 15

/*
 * Authors: McKendrick, Siege
 * Makes player AFK, setting them to captive, invisible, and invincible.  Spawns exit dialog after 15 seconds.
 * 
 * Arguments:
 * None
 *
 * Return Value:
 * True when exit dialog created successfully <BOOL>
 *
 * Example:
 * call sia3f_core_fnc_goAFK
*/

if (!hasInterface) exitWith {};

private _unit = player; // ToDo: replace with param & execute func on server

if (
	captive _unit ||
	!alive _unit ||
	!simulationEnabled _unit ||
	!isAbleToBreathe _unit ||
	(!isTouchingGround _unit) && (vehicle _unit == _unit) ||
	(currentPilot vehicle _unit == _unit) && (isEngineOn vehicle _unit)
) exitWith { 5 cutText ["Going AFK is not allowed at this time.", "PLAIN", -1, true] };

// set proper unit states/vars
_unit setCaptive true;
[_unit, true] remoteExec ["hideObjectGlobal", 2];
[_unit, false] remoteExec ["enableSimulationGlobal", 2];
if ("@ace" call FUNC(checkModPresence)) then {
	_unit setVariable [QGVAR(serializedMedStatus), [_unit] call ace_medical_fnc_serializeState];
	[objNull, _unit] call ace_medical_treatment_fnc_fullHeal;
};
_unit setVariable [QGVAR(isAFK), true];

[(name _unit + " is now AFK.")] remoteExec ["systemChat"]; // "<player> is now AFK" system chat message.
5 cutText ["You are now AFK\nYou may exit in " + (str TIMEOUT) + " seconds.", "PLAIN", -1, true];

sleep TIMEOUT;

if (!alive player) exitWith {};

createDialog "dialogAFK" // open exit dialog
