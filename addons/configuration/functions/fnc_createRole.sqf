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

// create role, value array is [isMedic, isEngineer, hasHandheldRadio, hasManpackRadio, additionalItems]
GVAR(roles) set [_roleName, [false, false, false, false, []]];
