#include "script_component.hpp"

#define CTRL(idc) ((findDisplay ([8503, 8504] select _mode)) displayCtrl idc)

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
	LOG_FUNC_END_ERROR("index must be an integer");
};

private _mode = uiNamespace getVariable [QGVAR(editGroupsCurrentMode), 0];
private _groupsLbCtrl = CTRL(1500);
private _groups = uiNamespace getVariable [QGVAR(groups), GET_CONFIG(groups,createHashMap)];

if (_groups isEqualTo createHashMap) then {
	private _defaultGroups = [
		["leadership", [false, false, true, false, [], ["team leader", "squad leader", "platoon leader"]]]
	];

	{ _groups set [(_x select 0), (_x select 1)] } forEach _defaultGroups;
};

// redo groups list
lbClear _groupsLbCtrl;
{
	_groupsLbCtrl lbAdd _x;
} forEach _groups;
lbSort _groupsLbCtrl;

// find proper group index and select according to param
if (_index < 0) then {
	_index = (lbSize _groupsLbCtrl) + _index;
};
if (_setCursor) then {
	_groupsLbCtrl lbSetCurSel _index;
};

private _groupValue = _groups getOrDefault [_groupsLbCtrl lbText _index, [false, false, false, false, [], []]];

if (_mode == 0) then {
	private _rolesLbCtrl = CTRL(1503);
	private _roles = uiNamespace getVariable [QGVAR(roles), GET_CONFIG(roles,createHashMap)];
	_groupValue = _groupValue # 5;

	// ensure there is at least 1 role; optimally always be true due to default role
	if (_roles isEqualTo createHashMap) exitWith {
		systemChat "Invalid roles.";
		call FUNC(editGroupsSave);
	};

	// update roles based on whether or not they are in the group
	lnbClear _rolesLbCtrl;
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
} else {
	// update group settings
	CTRL(2801) cbSetChecked (_groupValue # 0); // isMedic
	CTRL(2802) cbSetChecked (_groupValue # 1); // isEngineer
	CTRL(2803) cbSetChecked (_groupValue # 2); // hasHandheld
	CTRL(2804) cbSetChecked (_groupValue # 3); // hasManpack
};

uiNamespace setVariable [QGVAR(groups), _groups]; // needed if the GET_CONFIG thing is used on _groups initialization; there might be a better solution
