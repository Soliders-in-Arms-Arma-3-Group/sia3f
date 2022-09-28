#include "script_component.hpp"

ADDON = false;

// Addon Settings:

// define for SPATIALIZATION_SETTING in radio\script_macros#3
SPATIALIZATION_SETTINGS(ACRE_PRC343,"AN/PRC-343",2);
SPATIALIZATION_SETTINGS(ACRE_PRC152,"AN/PRC-152",0);
SPATIALIZATION_SETTINGS(ACRE_PRC148,"AN/PRC-148",0);
SPATIALIZATION_SETTINGS(ACRE_PRC117F,"AN/PRC-117F",0);
SPATIALIZATION_SETTINGS(ACRE_PRC77,"AN/PRC-77",0);
SPATIALIZATION_SETTINGS(ACRE_SEM52SL,"SEM 52 SL",2);
SPATIALIZATION_SETTINGS(ACRE_SEM70,"SEM 70",0);
SPATIALIZATION_SETTINGS(ACRE_BF888S,"BF-888S",2);
SPATIALIZATION_SETTINGS(ACRE_VRC64,"AN/VRC-64",0);
SPATIALIZATION_SETTINGS(ACRE_VRC103,"AN/VRC-103",0);
SPATIALIZATION_SETTINGS(ACRE_VRC110,"AN/VRC-110",0);
SPATIALIZATION_SETTINGS(ACRE_VRC111,"AN/VRC-111",0);
SPATIALIZATION_SETTINGS(ACRE_SEM90,"SEM90",0);

#include "XEH_PREP.hpp"

if (!GET_CONFIG(acreEnabled,true) || !("@ACRE2" call EFUNC(core,checkModPresence)) || (allDisplays isEqualTo [findDisplay 0]) || is3DEN) exitWith {};

ADDON = true;
