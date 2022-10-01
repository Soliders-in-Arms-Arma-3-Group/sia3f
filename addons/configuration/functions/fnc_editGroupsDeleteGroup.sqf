#include "script_component.hpp"

/*
 * Author: Siege
 * Removes the specified group from the edit groups GUI.
 *
 * Arguments:
 * 0: Name of group to create. <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["unneeded group"] call sia3f_configuration_fnc_editGroupsDeleteGroup
 */

params [
	["_groupName", "", [""]]
];

if (_groupName == "") exitWith {
	LOG_FUNC_END_ERROR("empty group name");
};

private _groups = uiNamespace getVariable [QGVAR(groups), createHashMap];

if !(_groupName in _groups) exitWith {
	systemChat "Invalid group name";
	LOG_FUNC_END_ERROR("group name doesn't exist");
};
LOG_FUNC_START;

_groups deleteAt _groupName;

uiNamespace setVariable [QGVAR(groups), _groups];
[-1] call FUNC(editGroupsRefresh);
LOG_FUNC_END;
