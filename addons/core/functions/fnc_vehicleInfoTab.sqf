#include "script_component.hpp"

/*
 * Author: McKendrick, modified by Siege
 * Create diary record for vehicle with formatted information
 *
 * Arguments:
 * 0: Vehicle class name <STRING>
 * 1: Vehicle weapons info <ARRAY of ARRAY>
 * 2: Diary subject name <STRING>
 *
 * Return value:
 * Vehicle diary record <DIARY RECORD>
 *
 * Example:
 * [params] call sia3f_core_fnc_vehicleInfoTab
*/

params ["_className", "_weaponsInfo", "_newDiarySubject"];
LOG_FUNC_START;
TRACE_3("params",_className,_weaponsInfo,_newDiarySubject);

private _cfgVehicles = configFile >> "CfgVehicles"; // cache cfgVehicles

private _displayName = getText (_cfgVehicles >> _className >> "displayName");
// private _category = getText (configFile >> "CfgEditorSubcategories" >> getText (_cfgVehicles >> _className >> "editorSubcategory") >> "displayName"); //? not used
private _seatsTotal = [_className, true] call BIS_fnc_crewCount; // Number of total seats: crew + non-FFV cargo/passengers + FFV cargo/passengers
private _seatsCrew = [_className, false] call BIS_fnc_crewCount; // Number of crew seats only
private _seatsCargo = _seatsTotal - _seatsCrew; // Number of total cargo/passenger seats: non-FFV + FFV
// private _seatsNonFFVcargo = getNumber (_cfgVehicles >> _className >> "transportSoldier"); // Number of non-FFV cargo seats only //? not used
// private _seatsFFVcargo = _seatsCargo - _seatsNonFFVcargo; // Number of FFV cargo seats only //? not used

// Icon img
private _icon = getText (_cfgVehicles >> _className >> "picture");

// === Text Formatting ===
private _strArr = [];
private _colorSeatsCrew = if (_seatsCrew > 0) then [{ ['#FFB84C', '#FFFFFF'] }, { ['#A9A9A9', '#A9A9A9'] }];
private _colorSeatsCargo = if (_seatsCargo > 0) then [{ ['#FFB84C', '#FFFFFF'] }, { ['#A9A9A9', '#A9A9A9'] }];

_strArr pushBack format ["<img image='%1' width='90' height='45'/>", _icon];
_strArr pushBack "<br></br>";
_strArr pushBack format ["<font face='PuristaBold'>%1</font>", _displayName];
_strArr pushBack "<br></br><br></br>";
_strArr pushBack format ["<font face='PuristaMedium'>Seats<br></br><font face='PuristaLight' color='%3'>Crew: <font color='%4'>%1</font><br></br><font color='%5'>Cargo: <font color='%6'>%2</font></font></font>", _seatsCrew, _seatsCargo, _colorSeatsCrew select 0, _colorSeatsCrew select 1, _colorSeatsCargo select 0, _colorSeatsCargo select 1];

// Weapons Info
_weaponsInfo params ["_pylons", "_turrets"];
private _newArr = [];

// Turrets
if (count _turrets > 0) then {
	_newArr pushBack "<br></br><br></br><font face='PuristaMedium'>Armaments</font><br></br>";
	{
		if (_forEachIndex > 0) then { _newArr pushBack "<font face='PuristaLight' color='#A9A9A9'>, </font>"; };
		_newArr pushBack format ["<font face='PuristaLight' color='#A9A9A9'>%1</font>", _x];
	} forEach _turrets;
};

// Pylons
if (count _pylons > 0) then {
	_newArr pushBack "<br></br><br></br><font face='PuristaMedium'>Munitions</font>";
	{
		_x params ["_weapon", "_ammo"];
		_newArr pushBack format ["<br></br><font face='PuristaLight' color='#FFB84C'>%1: </font><font face='PuristaLight'>%2x</font>", _weapon, _ammo];
	} forEach _pylons;
};

_strArr pushBack (_newArr joinString "");
_strArr pushBack "<br></br><br></br><execute expression ='player selectDiarySubject ""Diary:Record4""'>Go back</execute>";

private _text = _strArr joinString "";
if (!(player diarySubjectExists _newDiarySubject)) then { player createDiarySubject [_newDiarySubject, "Vehicle Information"]; };

TRACE_3("diary record values"_displayName,_text,_icon);
private _retValue = player createDiaryRecord ["vehicleInfo", [_displayName, _text, _icon]];
LOG_FUNC_END;
_retValue
