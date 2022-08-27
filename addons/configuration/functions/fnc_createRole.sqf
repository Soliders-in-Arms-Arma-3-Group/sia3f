#include "script_component.hpp"

/*
 * Author: Siege
 * 
 *
 * Arguments:
 * 0: Name of role to create. <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_createRole
*/

params [
	["_roleName", "", [""]]
];

if (_roleName == "") exitWith {};

private _roles = GET_CONFIG(roles,createHashMap);

// create role, value array is [isMedic, isEngineer, hasHandheldRadio, hasManpackRadio, additionalItems]
_roles set [_roleName, [false, false, false, false, []]];
SET_CONFIG(hiddenConfigValues,roles,_roles);
do3DENAction "MissionSave";
[-1] call FUNC(refreshEditRolesGUI);
