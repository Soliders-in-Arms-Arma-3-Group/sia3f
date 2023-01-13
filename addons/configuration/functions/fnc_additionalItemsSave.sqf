#include "script_component.hpp"

/*
 * Author: Siege
 * Saves the additional items to the group/role and exits the GUI.
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

private _name = uiNamespace getVariable [QGVAR(additionalItemsName), ""];
private _isGroup = uiNamespace getVariable [QGVAR(additionalItemsIsGroup), false];
private _hash = uiNamespace getVariable [[QGVAR(roles), QGVAR(roleGroups)] select _isGroup, createHashMap];

if (_name == "" || !(_name in _hash)) exitWith {
	LOG_FUNC_END_ERROR("role/group not found");
};
LOG_FUNC_START;

// update hash with new additional items
private _values = _hash get _name;
_values set [4, uiNamespace getVariable [QGVAR(additionalItems), []]];
_hash set [_name, _values];
TRACE_2("saved values",_name,_values);

// reopen role/group editor
private "_lbCtrl";
if (_isGroup) then {
	// unlike roles, group spawn requires index
	_lbCtrl = (findDisplay 8504) displayCtrl 1500;
} else {
	call FUNC(editRolesSpawn);
	_lbCtrl = (findDisplay 8501) displayCtrl 1500;
};

// find index of role/group
private _index = 0;
for "_i" from 0 to (lbSize _lbCtrl - 1) do {
	private _text = _lbCtrl lbText _i;
	if (_text == _name) exitWith {
		_index = _i;
	};
};

if (_isGroup) then {
	[_index, 1] call FUNC(editGroupsSpawn);
} else {
	[_index] call FUNC(editRolesRefresh);
};
LOG_FUNC_END;
