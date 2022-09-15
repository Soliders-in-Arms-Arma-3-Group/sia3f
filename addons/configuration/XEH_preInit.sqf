#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (GVAR(missionLoaded)) then {
	private _roles = GET_CONFIG(roles,createHashMap);
	if (_roles isEqualTo createHashMap) then {
		private _defaultRoles = [
			["default", [false, false, false, false, [], []]],
			["rifleman", [false, false, false, false, [], []]],
			["team leader", [false, false, true, false, [], ["leadership"]]],
			["squad leader", [false, false, true, false, [], ["leadership"]]],
			["medic", [true, false, false, false, [], []]],
			["crewman", [false, true, false, false, [], []]],
			["platoon leader", [false, false, true, true, [], ["leadership"]]]
		];

		{ _roles set [(_x select 0), (_x select 1)] } forEach _defaultRoles;
		SET_CONFIG(hiddenConfigValues,roles,_roles);
		do3DENAction "MissionSave";
	};

	private _groups = GET_CONFIG(groups,createHashMap);
	if (_groups isEqualTo createHashMap) then {
		private _defaultGroups = [
			["leadership", [false, false, true, false, [], ["team leader","squad leader","platoon leader"]]]
		];

		{ _groups set [(_x select 0), (_x select 1)] } forEach _defaultGroups;
		SET_CONFIG(hiddenConfigValues,groups,_groups);
		do3DENAction "MissionSave";
	};
};

ADDON = true;
