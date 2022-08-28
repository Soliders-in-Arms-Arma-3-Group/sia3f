#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

private _roles = GET_CONFIG(roles,createHashMap);
if (GVAR(missionLoaded) && _roles isEqualTo createHashMap) then {
	_roles set ["default", [false, false, false, false, []]];
	SET_CONFIG(hiddenConfigValues,roles,_roles);
	do3DENAction "MissionSave";
};

ADDON = true;
