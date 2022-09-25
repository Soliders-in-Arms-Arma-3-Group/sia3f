#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (is3DEN) exitWith {};

// these should not be updated after initialization
GVAR(roles) = GET_CONFIG(roles,createHashMap);
GVAR(groups) = GET_CONFIG(groups,createHashMap);

TRACE_2("role configuration values",GVAR(roles),GVAR(groups));
if (GVAR(roles) isEqualTo createHashMap) then {
	ERROR_MSG("Roles config is not set!");
};

missionNamespace setVariable [QGVAR(personalRadio), ["NONE", "ACRE_PRC343", "ACRE_BF888S", "ACRE_SEM52SL"] select GET_CONFIG(personalRadio,1)];
missionNamespace setVariable [QGVAR(handheldRadio), ["NONE", "ACRE_PRC343", "ACRE_PRC148", "ACRE_PRC152"] select GET_CONFIG(handheldRadio,3)];
missionNamespace setVariable [QGVAR(manpackRadio), ["NONE", "ACRE_PRC117F", "ACRE_PRC77", "ACRE_SEM70"] select GET_CONFIG(manpackRadio,1)];

ADDON = true;
