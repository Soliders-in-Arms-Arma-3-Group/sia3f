#include "script_component.hpp"

/*
 * Author: Siege
 * Creates a role with the specified name and updates the roles GUI to show the new role.
 *
 * Arguments:
 * 0: Name of role to create. <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["rifleman"] call sia3f_configuration_fnc_editRolesCreateRole
*/

params [
	["_roleName", "", [""]]
];

if (_roleName == "") exitWith {};

private _roles = uiNamespace getVariable [QGVAR(roles), createHashMap];

if (_roleName in _roles) exitWith {
	systemChat "Cannot create role, role already exists.";
};

// create role, value array is [isMedic, isEngineer, hasHandheldRadio, hasManpackRadio, additionalItems, groups]
_roles set [_roleName, [false, false, false, false, [], []]];
uiNamespace setVariable [QGVAR(roles), _roles];
[-1] call FUNC(editRolesRefresh);
