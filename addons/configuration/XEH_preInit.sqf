#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(roles) = GET_CONFIG(roles,createHashMap);
if (GVAR(roles) isEqualTo createHashMap) then {
	GVAR(roles) set ["default", [false, false, false, false, []]];
	SET_CONFIG(hiddenConfigValues,roles,GVAR(roles));
	do3DENAction "MissionSave";
};

ADDON = true;
