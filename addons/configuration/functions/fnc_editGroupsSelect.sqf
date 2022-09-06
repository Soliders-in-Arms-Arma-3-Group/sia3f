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

private _rolesLbCtrl = (findDisplay 8503) displayCtrl 1503;
private _currentRow = lnbCurSelRow _rolesLbCtrl;
private _roleName = _rolesLbCtrl lnbText [_currentRow, 0];

private _groupsLbCtrl = (findDisplay 8503) displayCtrl 1500;
private _groups = uiNamespace getVariable [QGVAR(groups), GET_CONFIG(groups,createHashMap)];
private _groupName = _groupsLbCtrl lbText (lbCurSel _groupsLbCtrl);
private _groupValue = _groups getOrDefault [_groupName, []];

TRACE_3("edit groups select",_roleName,_groupName,_groupValue);

if (_addItem && { !(_roleName in _groupValue) }) exitWith {
	_groupValue pushBackUnique _roleName;
	_groups set [_groupName, _groupValue];

	_rolesLbCtrl lnbSetText [[_currentRow, 1], "+"];
	_rolesLbCtrl lnbSetColor [[_currentRow, 0], [1, 1, 1, 1]];
	_rolesLbCtrl lnbSetColor [[_currentRow, 1], [1, 1, 1, 1]];
};

if (!_addItem && { _roleName in _groupValue }) exitWith {
	_groupValue deleteAt (_groupValue find _roleName);
	_groups set [_groupName, _groupValue];

	_rolesLbCtrl lnbSetText [[_currentRow, 1], "−"];
	_rolesLbCtrl lnbSetColor [[_currentRow, 0], [1, 1, 1, 0.5]];
	_rolesLbCtrl lnbSetColor [[_currentRow, 1], [1, 1, 1, 0.5]];
};
