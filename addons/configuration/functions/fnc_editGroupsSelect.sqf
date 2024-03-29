#include "script_component.hpp"

/*
 * Author: Siege
 * Handles adding/removing an item from the edit groups GUI.
 *
 * Arguments:
 * 0: Add (true) or remove (false) item <BOOLEAN> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call sia3f_configuration_fnc_editGroupsSelect
 */

params [
	["_addItem", true, [true]]
];

if ((uiNamespace getVariable [QGVAR(editGroupsCurrentMode), 0]) == 1) exitWith {
	LOG_FUNC_END_ERROR("incorrect mode");
};

private _rolesLbCtrl = (findDisplay 8503) displayCtrl 1503;
private _currentRow = lnbCurSelRow _rolesLbCtrl;
private _roles = uiNamespace getVariable [QGVAR(roles), GET_CONFIG(roles,createHashMap)];
private _roleName = _rolesLbCtrl lnbText [_currentRow, 0];

private _groupsLbCtrl = (findDisplay 8503) displayCtrl 1500;
private _groups = uiNamespace getVariable [QGVAR(groups), GET_CONFIG(groups,createHashMap)];
private _groupName = _groupsLbCtrl lbText (lbCurSel _groupsLbCtrl);
private _groupValue = _groups getOrDefault [_groupName, [false, false, false, false, [], []]];
private _groupRoles = _groupValue # 5; // should update _groupValue too since (I think) assigning an array makes it a reference

if (_groupName == "") exitWith {
	LOG_FUNC_END_ERROR("no group selected");
};

if (_addItem && { !(_roleName in (_groupRoles)) }) exitWith {
	(_groupRoles) pushBackUnique _roleName;
	_groups set [_groupName, _groupValue];

	_roles set [_roleName, [(_roles get _roleName) # 0, (_roles get _roleName) # 1, (_roles get _roleName) # 2, (_roles get _roleName) # 3, (_roles get _roleName) # 4, ((_roles get _roleName) # 5) + [_groupName]]];

	_rolesLbCtrl lnbSetText [[_currentRow, 1], "+"];
	_rolesLbCtrl lnbSetColor [[_currentRow, 0], [1, 1, 1, 1]];
	_rolesLbCtrl lnbSetColor [[_currentRow, 1], [1, 1, 1, 1]];
};

if (!_addItem && { _roleName in _groupRoles }) exitWith {
	_groupRoles deleteAt (_groupRoles find _roleName);
	_groups set [_groupName, _groupValue];

	_roles set [_roleName, [(_roles get _roleName) # 0, (_roles get _roleName) # 1, (_roles get _roleName) # 2, (_roles get _roleName) # 3, (_roles get _roleName) # 4, ((_roles get _roleName) # 5) - [_groupName]]];

	_rolesLbCtrl lnbSetText [[_currentRow, 1], "−"];
	_rolesLbCtrl lnbSetColor [[_currentRow, 0], [1, 1, 1, 0.5]];
	_rolesLbCtrl lnbSetColor [[_currentRow, 1], [1, 1, 1, 0.5]];
};

_groups set [_groupName, _groupValue];
uiNamespace setVariable [QGVAR(groups), _groups];
uiNamespace setVariable [QGVAR(roles), _roles];
