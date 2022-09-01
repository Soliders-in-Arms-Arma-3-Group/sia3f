#include "script_component.hpp"

/*
 * Author: mharis001 (ACE 3), modified by Siege
 * Handles adding/removing an item from the add additional items GUI.
 *
 * Arguments:
 * 0: Add (true) or remove (false) item <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call sia3f_configuration_fnc_additionalItemsSelect
 */

params [
	["_addItem", nil, [false]]
];

if (isNil "_addItem") exitWith {};

// Get item class from listbox
private _listbox = (findDisplay 8502) displayCtrl 1500;
private _currentRow = lnbCurSelRow _listbox;
private _itemClassname = _listbox lnbData [_currentRow, 1];

private _roleItems = uiNamespace getVariable [QGVAR(roleItems), []];
private _findItem = _roleItems find _itemClassname;

// Add item if not already in list
if (_addItem && {_findItem < 0}) exitWith {
	_roleItems pushBack _itemClassname;
	// Change symbol and increase alpha
	_listbox lnbSetText [[_currentRow, 2], "+"];
	_listbox lnbSetColor [[_currentRow, 1], [1, 1, 1, 1]];
	_listbox lnbSetColor [[_currentRow, 2], [1, 1, 1, 1]];

	uiNamespace setVariable [QGVAR(roleItems), _roleItems];
};

// Remove item if in list
if (!_addItem && {_findItem > -1}) exitWith {
	_roleItems deleteAt _findItem;
	// Change symbol and reduce alpha
	_listbox lnbSetText [[_currentRow, 2], "−"];
	_listbox lnbSetColor [[_currentRow, 1], [1, 1, 1, 0.5]];
	_listbox lnbSetColor [[_currentRow, 2], [1, 1, 1, 0.5]];

	uiNamespace setVariable [QGVAR(roleItems), _roleItems];
};
