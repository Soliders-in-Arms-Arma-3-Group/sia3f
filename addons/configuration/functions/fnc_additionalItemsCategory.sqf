#include "script_component.hpp"

/*
 * Author: mharis001 (ACE 3), modified by Siege
 * Handles changing the category for the add additional items GUI.
 *
 * Arguments:
 * 0: Selected index <SCALAR> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call sia3f_configuration_fnc_additionalItemsCategory
*/

params [
	["_index", 0, [0]]
];
TRACE_1("additionalItemsCategory params",_index);

// Store selected category
uiNamespace setVariable [QGVAR(additionalItemsCategory), _index];

// Show add compatible items button when category is attachments or magazines
private _button = (findDisplay 8502) displayCtrl 1609;
private _enable = _index in [4, 5, 6, 7, 8];
_button ctrlEnable _enable;
_button ctrlShow _enable;


// Refresh the list for selected category
call FUNC(additionalItemsAddItems);
