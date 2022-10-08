#include "script_component.hpp"

/*
 * Author: McKendrick, modified by Siege
 * Generates information regarding available vehicles and their seats, weapons, and ammo.
 *
 * Arguments:
 * 0: Array of vehicles <ARRAY of OBJECT>
 *
 * Return value:
 * Formatted information <STRING>
 *
 * Example:
 * [helicopter, jet] call sia3f_core_fnc_vehicleInfo
*/

params [
	["_vehicles", [], [[]]]
];

if (_vehicles isEqualTo []) exitWith {
	LOG_FUNC_END_ERROR("invalid parameters");
}; // Exit if array not given.
LOG_FUNC_START;

private _newDiarySubject = "vehicleInfo";
private _cfgVehicles = configFile >> "CfgVehicles"; // cache cfgVehicles

private _newArr = [];
{
	private _vicName = getText (_cfgVehicles >> typeOf _x >> "displayName");
	private _weaponsInfo = [getAllPylonsInfo _x];
	private _className = typeOf _x;

	 // If vehicle has pylons then combine like pylons, else show turret info if any.
	if (count (_weaponsInfo select 0) > 0) then {
		private _pylons = [];
		{
			// Get weapon name and ammo count for each pylon.
			private _weapon = getText (configFile >> "CfgMagazines" >> (_x select 3) >> "displayName");
			private _ammo = _x select 4;

			// Check if existing similar pylon already exists and combine, otherwise add pylon info to array.
			private _index = _pylons findIf { _x select 0 == _weapon };
			if (_index > -1) then {
				private _pylonInfo = _pylons select _index;
				_pylonInfo set [1, (_pylonInfo select 1) + _ammo];
			} else {
				_pylons pushBack [_weapon, _ammo];
			};
		} forEach (_weaponsInfo select 0);

		_weaponsInfo = [_pylons];

	};
		private _turrets = (_x weaponsTurret [0]) + (_x weaponsTurret [0,0]);

		// Create new array of display names of turrets.
		if (count _turrets > 0) then {
			private _newArr = [];
			{ _newArr pushBackUnique (getText (configFile >> "CfgWeapons" >> _x >> "displayName")); } forEach _turrets;
			_turrets = _newArr;
		};

		_weaponsInfo pushBack _turrets;
		// ToDo: Add magazine info.

	_newArr pushBack [_className, _weaponsInfo];
} forEach _vehicles;
_vehicles = _newArr;

// Condense array by removing and numbering duplicates
private _uniqueArr = [];
private _newArr = [];
{ _uniqueArr pushBackUnique _x; } forEach _vehicles; // create array of unique elements
{
	private _y = _x; // _x from count would overwrite _x from forEach
 	_newArr pushBack [_y, { _x isEqualTo _y } count _vehicles];
} forEach _uniqueArr; // populate array with amount of items
_vehicles = _newArr;

// Get editor category of each vehicle.
{
	private _category = getText (configFile >> "CfgEditorSubcategories" >> getText (_cfgVehicles >> ((_x select 0) select 0) >> "editorSubcategory") >> "displayName"); // Get name of the vehicle's eden category;
	_x pushBack _category;
} forEach _vehicles;

// Separate vehicles into category then sort.
private _newArr = [];
{
	private _category = _x select 2;
	private _index = _newArr findIf { _x select 0 == _category };
	_x deleteAt 2;
	if (_index > -1) then {
		((_newArr select _index) select 1) pushBack _x;
	} else {
		_newArr pushBack [_category, [_x]];
	};
} forEach _vehicles;

_vehicles = [_newArr] call BIS_fnc_sortBy; // Sort categories alphabetically.

private _text = [];

// Formatting text
{
	private _category = _x select 0;
	private _str = "";
	//private _diaryLink = player createDiaryLink ["Diary", record, text]

	// Category Header
	_str = _str + format ["<font face='PuristaSemiBold'>%1</font>", _category];
	_str = _str + "<br></br>";

	{
		(_x select 0) params ["_className", "_weaponsInfo"];
		private _amount = _x select 1;
		private _displayName = getText (_cfgVehicles >> _className >> "displayName");

		// Icon img
		/*
		private _icon = getText (_cfgVehicles >> _className >> "picture");
		_str = _str + format ["<img image='%1' width='20' height='10'/>  ",_icon];
		*/

		// Number of vics
		if (_amount > 0) then { _str = _str + format ["<font face='PuristaLight'>%1x </font>", _amount]; }; // Add amount of vics if more than one is available.

		// Name
		private _newDiaryRecord = [_className, _weaponsInfo, _newDiarySubject] call FUNC(vehicleInfoTab);
		_str = _str + "<font face='PuristaMedium'>" + createDiaryLink [_newDiarySubject, _newDiaryRecord, _displayName] + "</font>";

		_str = _str + "<br></br>";
	} forEach (_x select 1);
	_text pushBack (_str + "<br></br>");
} forEach _vehicles;

_text = _text joinString "";
TRACE_1("return text",_text);
LOG_FUNC_END;
_text
