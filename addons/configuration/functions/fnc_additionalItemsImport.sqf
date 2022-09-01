#include "script_component.hpp"

/*
 * Author: mharis001 (ACE 3), modified by Siege
 * Handles importing items list from clipboard into the add additional items GUI.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_additionalItemsImport
 */

private _importList = call compile copyFromClipboard;

// Verify import list is in correct format
if (isNil "_importList" || {!(_importList isEqualType [])} || {!(_importList isEqualTypeAll "")}) exitWith {
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

uiNamespace setVariable [QGVAR(roleItems), _filteredList];

// Refresh the list for new items
call FUNC(additionalItemsAddItems);
