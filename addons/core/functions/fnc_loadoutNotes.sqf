#include "script_component.hpp"

#define TEXT_NOTICE "NOTE: The loadout shown below is only accurate till mission start.<br /><br />"

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
	LOG_FUNC_END_ERROR("function ran on server");
}; // Exit if not a player.
LOG_FUNC_START;

// Remove old info page if there is one.
if (!isNil QGVAR(loadoutInfo)) then {
	player removeDiaryRecord ["Diary", GVAR(loadoutInfo)];
	LOG("fnc_loadoutNotes.sqf removed old player loadout info.");
};
if (!isNil QGVAR(loadoutInfoTeam)) then {
	player removeDiaryRecord ["Diary", GVAR(loadoutInfoTeam)];
	LOG("fnc_loadoutNotes.sqf removed old info about team members' loadouts.");
};

// Normal loadout for the player:
private _text = TEXT_NOTICE + ([player] call FUNC(loadoutNotesGetLoadout));

// Loadout page for group members
private _units = units (group player);
private _text_group = TEXT_NOTICE;
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

// Create Loadout pages
GVAR(loadoutInfoTeam) = player createDiaryRecord ["diary", ["Loadout Team", _text_group]];
GVAR(loadoutInfo) = player createDiaryRecord ["diary", ["Loadout", _text]];
TRACE_2("Loadout page info for group members' loadouts", _units, _text_group);
TRACE_1("Normal loadout info for the player", _text);

LOG_FUNC_END;
