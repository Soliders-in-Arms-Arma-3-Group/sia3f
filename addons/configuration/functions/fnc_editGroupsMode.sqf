#include "script_component.hpp"

/*
 * Author: Siege
 * Updates the groups GUI mode.
 *
 * Arguments:
 * New mode: 0 = assign roles, 1 = edit properties <SCALAR> (default: 0)
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

// determine current index
private _ctrl = 
private _currentIndex = 0;
for "_i" from 0 to (lbSize _ctrl - 1) do {
	private _text = _ctrl lbText _i;
	if (_text == _role) exitWith {
		_currentIndex = _i;
	};
};

if (mode == 0) then {
	(findDisplay 8504) closeDisplay 2;

} else {
	(findDisplay 8503) closeDisplay 2;

};
