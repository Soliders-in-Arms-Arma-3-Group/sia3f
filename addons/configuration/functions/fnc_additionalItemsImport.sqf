#include "script_component.hpp"

/*
 * Author: mharis001 (ACE 3), modified by Siege
 * Handles importing items list from clipboard into the add additional items GUI.
 *
 * Arguments:
 * Array of items to import <ARRAY of STRING | ARRAY of ARRAY of STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["someClassName", ["someClassName"]] call sia3f_configuration_fnc_additionalItemsImport
 */

params [
	["_importList", [], [[]]]
];

// deal with ACE arsenal export
if (!(_importList isEqualTypeAll "")) exitWith {
	_importList = flatten _importList;
	_importList = _importList arrayIntersect _importList select { _x isEqualType "" && { _x != "" } };
};

// Verify import list is in correct format
if (isNil "_importList" || { !(_importList isEqualType []) } || { !(_importList isEqualTypeAll "") }) exitWith {
	["Improper import format!", 1] call BIS_fnc_3DENNotification;
};

// Ensure imported items are in scanned config array and classname case is correct
private _configItems = +(uiNamespace getVariable [QGVAR(configItems), []]);
private _configItemsFlat = _configItems select [2, 16];
_configItemsFlat append (_configItems select 0);
_configItemsFlat append (_configItems select 1);

private _filteredList = [];

{
	private _item = _x;
	{
		private _index = _x findIf {_x == _item};
		if (_index > -1) then {
			_filteredList pushBackUnique (_x select _index);
		};
	} forEach _configItemsFlat;
} forEach _importList;

// add new items to items without duplicates
private _filteredList = (uiNamespace getVariable [QGVAR(additionalItems), []]) + _filteredList;
uiNamespace setVariable [QGVAR(additionalItems), _filteredList arrayIntersect _filteredList];

// Refresh the list for new items
call FUNC(additionalItemsAddItems);
