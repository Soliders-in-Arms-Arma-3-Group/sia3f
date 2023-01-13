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

if (_groupName == "") exitWith {
	LOG_FUNC_END_ERROR("empty group name");
};

private _groups = uiNamespace getVariable [QGVAR(roleGroups), createHashMap];

if (_groupName in _groups) exitWith {
	systemChat "Cannot create group, group already exists.";
	LOG_FUNC_END_ERROR("group name already exists");
};
LOG_FUNC_START;

// create role, value is isMedic, isEngineer, hasHandheldRadio, hasManpackRadio, [additional items], [roles in group]
_groups set [_groupName, [false, false, false, false, [], []]];
uiNamespace setVariable [QGVAR(roleGroups), _groups];
[-1] call FUNC(editGroupsRefresh);
LOG_FUNC_END;
