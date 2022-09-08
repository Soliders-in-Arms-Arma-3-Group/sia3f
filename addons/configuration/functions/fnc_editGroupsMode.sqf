#include "script_component.hpp"

/*
 * Author: Siege
 * Updates the groups GUI mode.
 *
 * Arguments:
 * 0: New mode: 0 = assign roles, 1 = edit properties <SCALAR> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call sia3f_configuration_fnc_editGroupsMode
 */

params [
	["_mode", 0, [0]]
];

private _currentMode = uiNamespace getVariable [QGVAR(editGroupsCurrentMode), 0];
if (_mode == _currentMode) exitWith {};

[lbCurSel ((findDisplay ([8503, 8504] select _mode)) displayCtrl 1500), _mode] call FUNC(editGroupsSpawn);
uiNamespace setVariable [QGVAR(editGroupsCurrentMode), _mode];
