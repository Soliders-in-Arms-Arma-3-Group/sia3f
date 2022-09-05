#include "script_component.hpp"

/*
 * Author: Siege
 * Saves the additional items to the role and exits the GUI.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_additionalItemsSpawn
 */

private _role = uiNamespace getVariable [QGVAR(roleName), ""];
private _hash = GET_CONFIG(roles,createHashMap);

if (_role == "" || !(_role in _hash)) exitWith {};

// update hash with new additional items
private _roleValues = _hash get _role;
_roleValues set [4, uiNamespace getVariable [QGVAR(roleItems), []]];
_hash set [_role, _roleValues];

// save values
SET_CONFIG(hiddenConfigValues,roles,_hash);
do3DENAction "MissionSave";

(findDisplay 8502) closeDisplay 1;

// reopen role editor
call FUNC(editRolesSpawn);
private _lbCtrl = (findDisplay 8501) displayCtrl 1500;
private _index = 0;

for "_i" from 0 to (lbSize _lbCtrl - 1) do {
	private _text = _lbCtrl lbText _i;
	if (_text == _role) exitWith {
		_index = _i;
	};
};

[_index] call FUNC(editRolesRefresh);
