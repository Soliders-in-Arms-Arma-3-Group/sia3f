#include "script_component.hpp"

/*
 * Author: Siege
 * Handles keyboard input for the groups editor GUI.
 *
 * Arguments:
 * 0: Key code <SCALAR>
 *
 * Return Value:
 * Handled <BOOL>
 *
 * Example:
 * [0] call sia3f_configuration_fnc_editGroupsKeyDown
*/

params [
	["_keyCode", 0, [0]]
];

// Exit if attribute is not in focus
private _lbHasFocus = uiNamespace getVariable [QGVAR(listboxHasFocus), false];
if (!_lbHasFocus) exitWith { false };

switch (_keyCode) do {
	case DIK_LEFT;
	case DIK_NUMPADMINUS: {
		[false] call FUNC(editGroupsSelect);
		true
	};
	case DIK_RIGHT;
	case DIK_NUMPADPLUS: {
		[true] call FUNC(editGroupsSelect);
		true
	};
	default { false };
};
