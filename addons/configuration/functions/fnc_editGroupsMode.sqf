#include "script_component.hpp"

/*
 * Author: Siege
 * Updates the groups GUI mode.
 *
 * Arguments:
 * Groups select control <CONTROL>
 * New mode: 0 = assign roles, 1 = edit properties <SCALAR> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call sia3f_configuration_fnc_editGroupsMode
 */

params [
	["_ctrl"],
	["_mode", 0, [0]]
];

private _currentMode = uiNamespace getVariable [QGVAR(editGroupsCurrentMode), 0];
if (_mode == _currentMode) exitWith {};

(findDisplay ([8504, 8503] # _mode)) closeDisplay 1;
[lbCurSel _ctrl, _mode] call FUNC(editGroupsSpawn);
uiNamespace setVariable [QGVAR(editGroupsCurrentMode), _mode];
