#include "script_component.hpp"

#include "XEH_PREP.hpp"

if (!("@ace" call EFUNC(core,checkModPresence)) || (allDisplays isEqualTo [findDisplay 0]) || is3DEN) exitWith {};
