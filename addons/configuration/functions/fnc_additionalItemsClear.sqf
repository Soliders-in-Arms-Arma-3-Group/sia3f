#include "script_component.hpp"

/*
 * Author: mharis001 (ACE 3), modified by Siege
 * Clears all items from current category in the add additional items GUI.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_additionalItemsClear
 */

LOG_FUNC_START;
private _category = lbCurSel ((findDisplay 8502) displayCtrl 2300) - 1;
private _items = uiNamespace getVariable [QGVAR(additionalItems), []];

// Remove all if no specific category
if (_category == -1) then {
	_items = [];
} else {
	// Find category items and remove from list
	private _configItems = +(uiNamespace getVariable [QGVAR(configItems), []]);
	private _categoryItems = switch (true) do {
		case (_category < 3): {
			_configItems select 0 select _category;
		};
		case (_category < 7): {
			_configItems select 1 select (_category - 3);
		};
		default {
			_configItems select (_category - 5);
		};
	};

	TRACE_2("Clear button removed items",_category,_categoryItems);
	_items = _items - _categoryItems;
};

// Refresh the list after clear
uiNamespace setVariable [QGVAR(additionalItems), _items];
call FUNC(additionalItemsAddItems);
LOG_FUNC_END;
