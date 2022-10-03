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
LOG_FUNC_START;

(findDisplay 313) createDisplay ([QGVAR(editGroups), QGVAR(editGroupsSettings)] # _mode);
[_index] call FUNC(editGroupsRefresh);
LOG_FUNC_END;
