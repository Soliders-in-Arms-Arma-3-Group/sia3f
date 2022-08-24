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
LOG("fnc_goAFK.sqf has started.");

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
MESSAGE_WITH_TITLE("player has been fully healed and set to AFK.", "/z/sia3f/addons/core/fucntions/fnc_goAFK.sqf:37-41");

[(name _unit + " is now AFK.")] remoteExec ["systemChat"]; // "<player> is now AFK" system chat message.
5 cutText ["You are now AFK\nYou may exit in " + (str TIMEOUT) + " seconds.", "PLAIN", -1, true];
MESSAGE_WITH_TITLE("5 second cutscene has completed.", "/z/sia3f/addons/core/functions/fnc_goAFK.sqf:45");

sleep TIMEOUT;
MESSAGE_WITH_TITLE("sleep TIMEOUT has completed.", "/z/sia3f/addons/core/functions/fnc_goAFK.sqf:46");

if (!alive player) exitWith {};

createDialog QGVAR(goAFK); // open exit dialog

INFO("fnc_goAFK.sqf fully executed.");
