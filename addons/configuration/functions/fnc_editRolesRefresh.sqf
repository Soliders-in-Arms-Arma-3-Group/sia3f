#include "script_component.hpp"

#define CTRL(idc) ((findDisplay 8501) displayCtrl idc)

/*
 * Author: Siege
 * Updates the Role Editor GUI to reflect changes made when selecting/creating/deleting a role.
 *
 * Arguments:
 * 0: Index of role to be viewed.  Negative numbers will count from the bottom (e.g, -1 is the bottom role) <SCALAR> (default: 0)
 * 1: Move cursor to role at index <BOOLEAN> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [0, false] call sia3f_configuration_fnc_editRolesRefresh
*/

params [
	["_index", 0, [0]],
	["_setCursor", true, [true]]
];

if (floor _index != _index) exitWith {
	LOG_FUNC_END_ERROR("index must be an integer");
};

private _lbCtrl = CTRL(1500);
private _roles = uiNamespace getVariable [QGVAR(roles), GET_CONFIG(roles,createHashMap)];

if (_roles isEqualTo createHashMap) then {
	private _defaultRoles = [
		["default", [false, false, false, false, [], []]],
		["rifleman", [false, false, false, false, [], []]],
		["team leader", [false, false, true, false, [], ["leadership"]]],
		["squad leader", [false, false, true, false, [], ["leadership"]]],
		["medic", [true, false, false, false, [], []]],
		["crewman", [false, true, false, false, [], []]],
		["platoon leader", [false, false, true, true, [], ["leadership"]]]
	];

	{ _roles set [(_x select 0), (_x select 1)]; } forEach _defaultRoles; // for new/unsaved missions
};

lbClear _lbCtrl;
{
	_lbCtrl lbAdd _x;
} forEach _roles;
lbSort _lbCtrl;

if (_index < 0) then {
	_index = lbSize _lbCtrl + _index;
};

if (_setCursor) then {
	_lbCtrl lbSetCurSel _index;
};

private _roleValues = _roles get (_lbCtrl lbText _index);
CTRL(2801) cbSetChecked (_roleValues # 0); // isMedic
CTRL(2802) cbSetChecked (_roleValues # 1); // isEngineer
CTRL(2803) cbSetChecked (_roleValues # 2); // hasHandheld
CTRL(2804) cbSetChecked (_roleValues # 3); // hasManpack

uiNamespace setVariable [QGVAR(roles), _roles]; // needed if the GET_CONFIG thing is used on _roles initialization; there might be a better solution
