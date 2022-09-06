#include "script_component.hpp"

/*
 * Author: Siege
 * Creates an empty group with the specified name and updates the groups GUI.
 *
 * Arguments:
 * 0: Name of group to create. <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_editGroupsCreateGroup
 */

params [
	["_groupName", "", [""]]
];

if (_groupName == "") exitWith {};

private _groups = uiNamespace getVariable [QGVAR(groups), createHashMap];

if (_groupName in _groups) exitWith {
	systemChat "Cannot create group, group already exists.";
};

// create role, value is array of roles
_groups set [_groupName, []];
uiNamespace setVariable [QGVAR(groups), _groups];
[-1] call FUNC(editGroupsRefresh);
