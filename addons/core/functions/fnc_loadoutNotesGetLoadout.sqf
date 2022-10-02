#include "script_component.hpp"

/*
 * Author: F3 (http://www.ferstaberinde.com/f3/en/)
 * Gets and formats the loadout of a unit
 *
 * Arguments:
 * 0: unit to get loadout of <OBJECT> (default: player)
 * 1: return full loadout <BOOLEAN> (default: true)
 *
 * Return Value:
 * Formatted text <STRING>
 *
 * Example:
 * [player] call sia3f_core_fnc_loadoutNotesGetLoadout
*/

params [
	["_unit", player, [objNull]],
	["_full", true, [true]]
];
LOG_FUNC_START;

// Get a nested array containing all attached weapon items
private _wepItems = weaponsItems _unit;

// Get a nested array containing all unique magazines and their count
private _mags = (magazines _unit) call BIS_fnc_consolidateArray;

// Get a nested array containing all non-equipped items and their count
private _items = (items _unit) call BIS_fnc_consolidateArray;
private _items_assigned = assignedItems _unit;

// Backpack and backpack-load in percent
private _bp = backpack _unit;
private _bpLoad = 100 * loadBackpack _unit;

// All weapons minus the field glasses
private _weps = (weapons _unit);
_weps = _weps select { (toLower (getText (configFile >> "CfgWeapons" >> _x >> "simulation"))) != "binocular" };
_weps = _weps apply {
	// Magazines
	private _magArr = [_x, _mags] call FUNC(loadoutNotesWepMags);

	// Check if weapon has an underslung grenade launcher
	private _muzzles = getArray(configFile >> "CfgWeapons" >> _x >> "muzzles") apply { toLower _x };
	private _ugls = [configFile >> "CfgWeapons" >> _x, 0, true] call BIS_fnc_returnChildren;
	_ugls = _ugls select {"GrenadeLauncher" in ([_x,true] call BIS_fnc_returnParents)};
	_ugls = _ugls apply { configName _x };
	_ugls = _ugls select { (toLower _x) in _muzzles };
	_ugls = _ugls apply { ["UGL_F", _mags] call FUNC(loadoutNotesWepMags) };

	// List weapon attachments
	// Get attached items
	private _attachments = _wepItems select (([_wepItems, _x] call BIS_fnc_findNestedElement) select 0);
	_attachments deleteAt 0; // Remove the first element as it points to the weapon itself
	_attachments = _attachments select { !(_x isEqualType []) && {_x != ""} };

	//return value:
	[_x, _magArr, _ugls, _attachments]
};

//Note: At this point "_mags" only consists of magazine types that are
// not compatible with the unit's weapons.

private _returnStr = [_full, _wepItems, _mags, _items, _items_assigned, _bp, _bpLoad, _weps] call FUNC(loadoutNotesDataToText);

TRACE_1("string returned",_returnStr);
INFO("fnc_loadoutNotesGetLoadout.sqf fully executed.");

_returnStr;
