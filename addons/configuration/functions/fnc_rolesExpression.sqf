#include "script_component.hpp"

/*
 * Author: Siege
 * Handles object "role" attribute expression.
 *
 * Arguments:
 * The object being edited <OBJECT>
 * The value put into the text box <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_rolesExpression
*/

params [
	["_object", objNull, [objNull]],
	["_value", "", [""]]
];

if (isNull _object || _value isEqualTo "") exitWith {};

if (is3DEN) then {
	private _roles = GET_CONFIG(roles,createHashMap);
	_roles set ["default", [false, false, false, false, [], ""], true];
	private _toSave = _roles set [_value, [false, false, false, false, [], ""]];
	if (!_toSave) then {
		SET_CONFIG(hiddenConfigValues,roles,_roles);
		do3DENAction "MissionSave";
	};
} else {
	_object setVariable [QGVAR(role), _value, true];
};
