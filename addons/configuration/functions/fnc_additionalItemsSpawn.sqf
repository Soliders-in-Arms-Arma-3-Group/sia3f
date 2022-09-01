#include "script_component.hpp"

/*
 * Author: Siege
 * Initializes the add additional items GUI.
 *
 * Arguments:
 * 0: Role name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_additionalItemsSpawn
 */

diag_log _this;
params [
	["_role", "", [""]]
];

// ensure parameter is an actual role
private _hash = GET_CONFIG(roles,createHashMap);
if (_role == "" || !(_role in _hash)) exitWith {};

(findDisplay 313) createDisplay QGVAR(additionalItemsEditor);

// fetch and store role items
private _roleItems = (_hash get _role) # 4;
uiNamespace setVariable [QGVAR(roleItems), _roleItems];
uiNamespace setVariable [QGVAR(roleName), _role];

// Put role name in title
((findDisplay 8502) displayCtrl 1000) ctrlSetText format ["Additional Items Editor: %1", _role];

// refresh items
[0] call FUNC(additionalItemsCategory);
