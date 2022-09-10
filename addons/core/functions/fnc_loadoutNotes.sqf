#include "script_component.hpp"

/*
 * Authors: F3 (http://www.ferstaberinde.com/f3/en/), McKendrick, Siege
 * Adds loadout information of player and team to briefing.  MUST be executed locally.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_core_fnc_loadoutNotes
*/

if (!hasInterface || !GET_CONFIG(briefLoadout,true)) exitWith {
	LOG("fnc_loadoutNotes.sqf ran on server.");
}; // Exit if not a player.

// Remove old info page if there is one.
if (!isNil QGVAR(loadoutInfo)) then {
	LOG("fnc_loadoutNotes.sqf removed old player loadout info.");

	player removeDiaryRecord ["Diary", GVAR(loadoutInfo)];
};
if (!isNil QGVAR(loadoutInfoTeam)) then {
	LOG("fnc_loadoutNotes.sqf removed old info about team members' loadouts.");

	player removeDiaryRecord ["Diary", GVAR(loadoutInfoteam)];
};

private _text_notice = "NOTE: The loadout shown below is only accurate till mission start.<br /><br />";
TRACE_1("Note about loadout only being accurate until mission start.", _text_notice);

// Normal loadout for the player:
private _text = _text_notice + ([player] call FUNC(loadoutNotesGetLoadout));
TRACE_1("Normal loadout info for the player", _text);

// Loadout page for group members
private _units = (units (group player));
private _text_group = "" + _text_notice;
TRACE_2("Loadout page info for group members' loadouts", _units, _text_group);
{
	private _role = roleDescription _x;
	if (_role == "") then {
		_role = getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
	} else {
		_role = (_role splitString "@") select 0;
	};

	private _text_loadout = [_x, false] call FUNC(loadoutNotesGetLoadout);
	private _unit_name = format ["<font face='PuristaBold'>%1</font><font face='PuristaLight'> (%2):</font><br/>", name _x, _role];
	_text_group = _text_group + format ["%1", _unit_name] + _text_loadout + "<br/><br/>";
} forEach _units;
LOG("fnc_loadoutNotes.sqf finished formatting group member loadouts in the forEach loop.");

// Create Loadout pages
GVAR(loadoutInfoTeam) = player createDiaryRecord ["diary", ["Loadout Team", _text_group]];
GVAR(loadoutInfo) = player createDiaryRecord ["diary", ["Loadout", _text]];

INFO("fnc_loadoutNotes.sqf fully executed.");
