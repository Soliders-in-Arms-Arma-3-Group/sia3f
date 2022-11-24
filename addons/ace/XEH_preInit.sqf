#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (
	!("@ace" call EFUNC(core,checkModPresence)) ||
	allDisplays isEqualTo [findDisplay 0] ||
	is3DEN ||
	!GET_CONFIG(frameworkInit,false)
) exitWith {};

ADDON = true;
