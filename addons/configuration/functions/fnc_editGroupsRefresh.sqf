#include "script_component.hpp"

/*
 * Author: Siege
 * Updates the groups GUI to reflect changes made when selecting/creating/deleting a group.
 *
 * Arguments:
 * 0: Index of group to be viewed.  Negative numbers will count from the bottom (e.g, -1 is the bottom role) <SCALAR> (default: 0)
 * 1: Move cursor to group at index <BOOLEAN> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [0, false] call sia3f_configuration_fnc_editGroupsRefresh
 */

params [
	["_index", 0, [0]],
	["_setCursor", true, [true]]
];

if (floor _index != _index) exitWith {
	// error, index must be an integer
};

private _groupsLbCtrl = (findDisplay 8503) displayCtrl 1500;
private _groups = uiNamespace getVariable [QGVAR(groups), GET_CONFIG(groups,createHashMap)];
private _rolesLbCtrl = (findDisplay 8503) displayCtrl 1503;
private _roles = uiNamespace getVariable [QGVAR(roles), GET_CONFIG(roles,createHashMap)];

// ensure there is at least 1 role; optimally always be true due to default role
if (_roles isEqualTo createHashMap) exitWith {
	systemChat "Invalid roles.";
	call FUNC(editGroupsSave);
};

// redo groups list
lbClear _groupsLbCtrl;
{
	_groupsLbCtrl lbAdd _x;
} forEach _groups;
lbSort _groupsLbCtrl;

// find proper group index and select according to param
if (_index < 0) then {
	_index = ((lbSize _groupsLbCtrl) + _index);
};
if (_setCursor) then {
	_groupsLbCtrl lbSetCurSel _index;
};

// update roles based on whether or not they are in the group
lnbClear _rolesLbCtrl;
private _groupValue = (_groups getOrDefault [_groupsLbCtrl lbText _index, [false, false, false, false, [], []]]) select 5;
TRACE_1("refresh roles",_roles);
{
	private _symbol = "−";
	private _alpha = 0.5;

	if (_x in _groupValue) then {
		_symbol = "+";
		_alpha = 1;
	};

	private _index = _rolesLbCtrl lnbAddRow [_x, _symbol];
	_rolesLbCtrl lnbSetColor [[_index, 0], [1, 1, 1, _alpha]];
} forEach _roles;
_rolesLbCtrl lnbSort [0];

uiNamespace setVariable [QGVAR(groups), _groups]; // needed if the GET_CONFIG thing is used on _groups initialization; there might be a better solution
