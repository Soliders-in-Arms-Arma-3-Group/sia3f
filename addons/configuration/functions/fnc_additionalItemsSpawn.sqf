#include "script_component.hpp"

/*
 * Author: Siege
 * Initializes the add additional items GUI.
 *
 * Arguments:
 * 0: Role/group name <STRING>
 * 1: True if the additional items is for a group <BOOLEAN> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_additionalItemsSpawn
 */

params [
	["_name", "", [""]],
	["_isGroup", false, [false]]
];

// ensure parameter is an actual role
private _hash = uiNamespace getVariable [[QGVAR(roles), QGVAR(groups)] select _isGroup, createHashMap];
if (_name == "" || !(_name in _hash)) exitWith {
	LOG_FUNC_END_ERROR("role/group not found");
};
LOG_FUNC_START;

(findDisplay 313) createDisplay QGVAR(additionalItemsEditor);

// fetch and store role items
private _items = (_hash get _name) # 4;
uiNamespace setVariable [QGVAR(additionalItems), _items];
uiNamespace setVariable [QGVAR(additionalItemsName), _name];
uiNamespace setVariable [QGVAR(additionalItemsIsGroup), _isGroup];

// Put role name in title
((findDisplay 8502) displayCtrl 1000) ctrlSetText format ["Additional Items Editor: %1", _name];

// refresh items
[0] call FUNC(additionalItemsCategory);
LOG_FUNC_END;
