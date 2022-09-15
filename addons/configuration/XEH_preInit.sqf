#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

private _roles = GET_CONFIG(roles,createHashMap);
if (GVAR(missionLoaded) && _roles isEqualTo createHashMap) then {
	private _defaultRoles = [
		["default", [false, false, false, false, [], []]],
		["rifleman", [false, false, false, false, [], []]],
		["team leader", [false, false, true, false, [], []]],
		["squad leader", [false, false, true, false, [], []]],
		["medic", [true, false, false, false, [], []]],
		["crewman", [false, true, false, false, [], []]],
		["platoon leader", [false, false, true, true, [], []]]
	];

	{ _roles set [(_x select 0), (_x select 1)] } forEach _defaultRoles;
	SET_CONFIG(hiddenConfigValues,roles,_roles);
	do3DENAction "MissionSave";
};

ADDON = true;
