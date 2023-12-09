#include "script_component.hpp"

/*
 * Author: Siege
 * Reenables the arsenal for a player.  For disable arsenal on respawn functionality.
 *
 * Arguments:
 * 0: Selected objects <ARRAY of OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_objects] call sia3f_core_fnc_overwriteArsenal
*/

params [
	["_objects", [], [[]]]
];

LOG_FUNC_START;

{
	{ [_x, missionNamespace getVariable [QGVAR(arsenalContents), false]] call ace_arsenal_fnc_initBox; } forEach EGVAR(configuration,arsenals);
	GVAR(arsenalContents) = nil;
} remoteExec ["call", _objects];

LOG_FUNC_END;
