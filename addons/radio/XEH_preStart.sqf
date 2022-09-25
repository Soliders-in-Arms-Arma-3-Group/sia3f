#include "script_component.hpp"

#include "XEH_PREP.hpp"

if (!GET_CONFIG(acreEnabled,true) || !("@ACRE2" call EFUNC(core,checkModPresence)) || is3DEN) exitWith {};
