#include "script_component.hpp"

/*
 * Author: F3 (http://www.ferstaberinde.com/f3/en/)
 * Gets the name and picture of a weapon/item.
 *
 * Arguments:
 * 0: weapon/item name <STRING> (default: "")
 * 1: weapon/item type <STRING> (default: "CfgWeapons")
 * 2: prefix <STRING> (default: "")
 * 3: Don't include weapon/item display name (included by default) <BOOL> (default: false)
 *
 * Return Value:
 * Formatted text of the prefix, weapon/item picture, and weapon/item name if arg 3 is false <STRING>
 *
 * Example:
 * ["arifle_MX_F"] call sia3f_core_fnc_loadoutNotesName
*/

params [
	["_name", "", [""]],
	["_type", "CfgWeapons", [""]],
	["_prefix", "", [""]],
	["_short", false, [false]]
];
LOG_FUNC_START;

private _picture = getText (configFile >> _type >> _name >> "picture");
if !(_picture isEqualTo "") then {
	if (_picture find ".paa" == -1) then {
		_picture = _picture + ".paa";
	};
	_picture = format ["<img image='%1' height='24'/>", _picture];
};

private _returnStr = format [
	["%1%2%3 ", "%1%2 "] select _short,
	_prefix,
	_picture,
	getText (configFile >> _type >> _name >> "displayName")
];

TRACE_1("string returned",_returnStr);
LOG_FUNC_END;

_returnStr;
