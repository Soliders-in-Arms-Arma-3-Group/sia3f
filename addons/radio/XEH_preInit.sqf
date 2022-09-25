#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (!GET_CONFIG(acreEnabled,true) || !("@ACRE2" call EFUNC(core,checkModPresence)) || is3DEN) exitWith {};

ADDON = true;
