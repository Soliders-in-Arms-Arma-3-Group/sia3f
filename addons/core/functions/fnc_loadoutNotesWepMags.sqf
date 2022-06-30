#include "script_component.hpp"

/*
 * Author: F3 (http://www.ferstaberinde.com/f3/en/)
 * Get number of possible magazines for a weapon.
 *
 * Arguments:
 * 0: The weapon to check magazines for <STRING>
 * 1: The magazines the unit has in inventory <ARRAY of <ARRAY of <ANY, SCALAR>>>
 *
 * Return Value:
 * Magazines in units inventory that are compatible with the weapon passed in arg 1 <ARRAY of <SCALAR(?)>>
 *
 * Example:
 * ["arifle_MX_F", (magazines _unit) call BIS_fnc_consolidateArray] call sia3f_core_fnc_loadoutNotesWepMags
*/

params [
	["_weapon", "", [""]],
	["_mags", [], [[]]]
];

// Get possible magazines for weapon
private _wepMags = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");

// Compare weapon magazines with player magazines
private _magArr = [];
{
	// findInPairs returns the first index that matches the checked for magazine
	private _index = [_mags, _x] call BIS_fnc_findInPairs;

	// if we have a match
	if (_index != -1) then {
		// Add the number of magazines to the list
		_magArr pushBack ([_mags, [_index, 1]] call BIS_fnc_returnNestedElement);

		// Remove the entry
		_mags deleteAt _index;
	};
} forEach _wepMags;

_magArr
