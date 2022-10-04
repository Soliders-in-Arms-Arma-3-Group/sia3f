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

if (isNull _object || _value isEqualTo "") exitWith {
	LOG_FUNC_END_ERROR("invalid parameters");
};
LOG_FUNC_START;

if (is3DEN) then {
	private _roles = GET_CONFIG(roles,createHashMap);
	private _defaultRoles = [
		["default", [false, false, false, false, [], []]],
		["rifleman", [false, false, false, false, [], []]],
		["team leader", [false, false, true, false, [], ["leadership"]]],
		["squad leader", [false, false, true, false, [], ["leadership"]]],
		["medic", [true, false, false, false, [], []]],
		["crewman", [false, true, false, false, [], []]],
		["platoon leader", [false, false, true, true, [], ["leadership"]]]
	];

	{ _roles set [(_x select 0), (_x select 1), true]; } forEach _defaultRoles;

	private _toSave = _roles set [_value, [false, false, false, false, [], []]];
	if (!_toSave) then {
		SET_CONFIG(hiddenConfigValues,roles,_roles);
		do3DENAction "MissionSave";
		TRACE_1("new role created",_value);
	};
} else {
	_object setVariable [QGVAR(role), _value, true];
	LOG("set obj variable");
};
LOG_FUNC_END;
