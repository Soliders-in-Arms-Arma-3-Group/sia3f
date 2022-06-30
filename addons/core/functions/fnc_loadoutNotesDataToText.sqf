#include "script_component.hpp"

/*
 * Author: F3 (http://www.ferstaberinde.com/f3/en/)
 * Formats the text for magazine counts.
 *
 * Arguments:
 * 0: return full text <BOOLEAN> (default: true)
 * 1: weapon items <ARRAY of <STRING>> (default: [])
 * 2: magazine items <ARRAY of <STRING>> (default: [])
 * 3: other items <ARRAY of <STRING>> (default: [])
 * 4: assigned items <ARRAY of <STRING>> (default: [])
 * 5: backpack <STRING> (default: "")
 * 6: backpack load <SCALAR> (default: 0)
 * 7: weapons <ARRAY of <STRING>> (default: [])
 *
 * Return Value:
 * Formatted text <STRING>
 *
 * Example:
 * [params] call sia3f_core_fnc_loadoutNotesDataToText
*/

params [
	["_full", true, [true]],
	["_wepItems", [], [[]]],
	["_mags", [], [[]]],
	["_items", [], [[]]],
	["_items_assigned", [], [[]]],
	["_bp", "", [""]],
	["_bpLoad", 0, [0]],
	["_weps", [], [[]]]
];

private _arrow = "<img image='\A3\ui_f\data\gui\rscCommon\rscTree\hiddenTexture_ca.paa' height='24'/>";
private _classesBlacklist = ["FirstAidKit"];

//Generate the loadout text from the previously defined variables.
private _textLong = "";
private _textShrt = "";

private _fnc_magArrText = {
	// formats the text for magazine counts
	params [
		["_magArr", [], [[]]]
	];
	if (count _magArr > 0) exitWith {
		format ["[%1]", _magArr joinString "+"]
	};
	""
};

// WEAPONS
if (count _weps > 0) then {
	_textLong = _textLong + "<font size='18'>WEAPONS [#MAGAZINES]:</font>";
	{
		_x params [
			["_weapon", "", [""]],
			["_magArr", [], [[]]],
			["_ugls", [], [[]]],
			["_attachments", [], [[]]]
		];

		// Weapon name and picture
		_textLong = _textLong + "<br/>" + ([_weapon] call FUNC(loadoutNotesName));
		_textShrt = _textShrt + ([_weapon] call FUNC(loadoutNotesName));

		// Weapon magazines
		_textLong = _textLong + ([_magArr] call _fnc_magArrText);
		_textShrt = _textShrt + ([_magArr] call _fnc_magArrText);

		// Underslung grenade launcher
		{
			//private _picture = "<img image='\A3\ui_f\data\igui\cfg\weaponicons\GL_ca.paa' height='20'/>";
			private _picture = "<img image='\A3\Weapons_f\Data\ui\gear_UGL_slug_CA.paa' height='24'/>";
			_textLong = _textLong + "<br/>" + _arrow + _picture + "UGL" + ([_x] call _fnc_magArrText);
			_textShrt = _textShrt + " + " +  _picture + ([_x] call _fnc_magArrText);
		} forEach _ugls;

		// Weapon attachments
		{
			_textLong = _textLong + "<br/>" + ([_x, "CfgWeapons", _arrow] call FUNC(loadoutNotesName));
			_textShrt = _textShrt + ([_x, "CfgWeapons", " + ", true] call FUNC(loadoutNotesName));
		} forEach _attachments;

		_textLong = _textLong + "<br/>";
		_textShrt = _textShrt + "<br/>";
	} forEach _weps;
};

// BACKPACK
// Add lines for all other items
if (_bp != "") then {
	_textLong = _textLong + "<br/><font size='18'>BACKPACK [%FULL]:</font><br/>";
	private _bpText = ([_bp, "CfgVehicles"] call FUNC(loadoutNotesName));
	if (getContainerMaxLoad _bp > 0) then {
		_bpText = _bpText + format ["[%1%2]", round _bpLoad, "%"];
	} else {
		//For the short version: only show special non-cargo backpacks
		_textShrt = _textShrt + _bpText + "<br/>";
	};
	_textLong = _textLong + _bpText + "<br/>";
};

// OTHER 
if (! _full) then {
	_mags  = _mags  select { private _class = _x select 0; {_class isKindOf [_x, configFile >> "CfgMagazines"] } count _classesBlacklist == 0 };
	_items = _items select { private _class = _x select 0; {_class isKindOf [_x, configFile >> "CfgWeapons"  ] } count _classesBlacklist == 0 };
};
if (count _mags > 0 || count _items > 0 || count _items_assigned > 0) then {
	_textLong = _textLong + "<br/><font size='18'>OTHER [#]:</font>";

	{
		_x params [
			["_className", "", [""]],
			["_num", 0, [0]]
		];
		_textLong = _textLong + "<br/>" + ([_className, "CfgMagazines"] call FUNC(loadoutNotesName)) + format [" [%1]", _num];
		_textShrt = _textShrt + ([_className, "CfgMagazines", "", true] call FUNC(loadoutNotesName)) + format [" [%1]", _num];
	} forEach _mags;

	{
		_x params [
			["_className", "", [""]],
			["_num", 0, [0]]
		];
		_textLong = _textLong + "<br/>" + ([_className, "CfgWeapons"] call FUNC(loadoutNotesName)) + format[" [%1]", _num];
		_textShrt = _textShrt + ([_className, "CfgWeapons", "", true] call FUNC(loadoutNotesName)) + format[" [%1]", _num];
	} forEach _items;

	if (count _mags > 0 || count _items > 0) then {
		_textLong = _textLong + "<br/>";
		_textShrt = _textShrt + "<br/>";
	};

	{
		_textLong = _textLong + "<br/>" + ([_x, "CfgWeapons"] call FUNC(loadoutNotesName));
	} forEach _items_assigned;
};


//return value
if (_full) exitWith { _textLong };

_textShrt