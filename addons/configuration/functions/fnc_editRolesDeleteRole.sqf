#include "script_component.hpp"

/*
 * Author: Siege
 * Deletes the role with the specified name and updates the roles GUI to not show the role.
 *
 * Arguments:
 * 0: Name of role to delete. <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["unneeded role"] call sia3f_configuration_fnc_editRolesDeleteRole
*/

params [
	["_roleName", "", [""]]
];

if (_roleName == "") exitWith {};

if (_roleName == "default") exitWith {
	systemChat "Cannot delete the default role.";
};

private _roles = uiNamespace getVariable [QGVAR(roles), createHashMap];

if !(_roleName in _roles) exitWith {
	systemChat "Invalid role name";
};
_roles deleteAt _roleName;

uiNamespace setVariable [QGVAR(roles), _roles];
[-1] call FUNC(editRolesRefresh);
