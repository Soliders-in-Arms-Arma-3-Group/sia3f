#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

GVAR(roles) = ["test", "hierarchy bad"];

missionNameSpace setVariable [QGVAR(personalRadio), ["NONE", "ACRE_PRC343", "ACRE_BF888S", "ACRE_SEM52SL"] select GET_CONFIG(personalRadio,1)];
missionNameSpace setVariable [QGVAR(handheldRadio), ["NONE", "ACRE_PRC343", "ACRE_PRC148", "ACRE_PRC152"] select GET_CONFIG(handheldRadio,3)];
missionNameSpace setVariable [QGVAR(manpackRadio), ["NONE", "ACRE_PRC117F", "ACRE_PRC77", "ACRE_SEM70"] select GET_CONFIG(manpackRadio,1)];
