#include "script_component.hpp"

/*
 * Author: Siege
 * Initializes the edit groups GUI.
 *
 * Arguments:
 * Index to select <SCALAR> (default: 0)
 * Mode <SCALAR> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_editGroupsSpawn
 */

params [
	["_index", 0, [0]],
	["_mode", 0, [0]]
];

private _display = QGVAR(editGroups);
if (_mode == 1) then {
	_display = QGVAR(editGroupsSettings);
};

(findDisplay 313) createDisplay _display;
[_index] call FUNC(editGroupsRefresh);
