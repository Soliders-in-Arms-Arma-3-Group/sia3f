#include "script_component.hpp"

/*
 * Author: Siege
 * Setup all default mission values (description.ext, roles, respawn attributes, etc.)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_initFramework
*/

if (GET_CONFIG(frameworkInit,false)) exitWith {
	["SIA Mission Framework has already been initialized.", 1] call BIS_fnc_3DENNotification;
	LOG_FUNC_END_ERROR("framework already initialized");
};
LOG_FUNC_START;

private _callback = "make_descriptionExt" callExtension ["", [getMissionPath ""]];
// ToDo: check for extension success and notify player if it fails.
TRACE_1("extension callback",_callback);

// create default roles if roles don't already exist
private _roles = GET_CONFIG(roles,createHashMap);
if (_roles isEqualTo createHashMap) then {
	private _defaultRoles = [
		["default", [false, false, false, false, [], []]], // [isMedic, isEngineer, hasHandheldRadio, hasManpackRadio, roleItems, roleGroups]
		["rifleman", [false, false, false, false, [], []]],
		["team leader", [false, false, true, false, [], ["leadership"]]],
		["squad leader", [false, false, true, false, [], ["leadership"]]],
		["medic", [true, false, false, false, [], []]],
		["crewman", [false, true, false, false, [], []]],
		["platoon leader", [false, false, true, true, [], ["leadership"]]]
	];

	{ _roles set [(_x select 0), (_x select 1)] } forEach _defaultRoles;
	SET_CONFIG(hiddenConfigValues,roles,_roles);
	LOG("default roles created");
};

private _groups = GET_CONFIG(groups,createHashMap);
if (_groups isEqualTo createHashMap) then {
	private _defaultGroups = [
		["leadership", [false, false, true, false, [], ["team leader","squad leader","platoon leader"]]]
	];

	{ _groups set [(_x select 0), (_x select 1)] } forEach _defaultGroups;
	SET_CONFIG(hiddenConfigValues,groups,_groups);
	LOG("default group created");
};

// default mission attributes
// ToDo only write if value hasn't been changed?
set3DENMissionAttributes [["Multiplayer", "Respawn", 3], ["Multiplayer", "RespawnDelay", 60], ["Multiplayer", "RespawnTemplates", ["ace_spectator", "Wave", "Counter", "Tickets"]]];
LOG("set mission attributes");

SET_CONFIG(hiddenConfigValues,frameworkInit,true);
do3DENAction "MissionSave";
["SIA Mission Framework Initialization Complete!"] call BIS_fnc_3DENNotification;
LOG_FUNC_END;
