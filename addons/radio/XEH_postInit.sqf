#include "script_component.hpp"

if (
	!GET_CONFIG(acreEnabled,true) ||
	!("@ACRE2" call EFUNC(core,checkModPresence)) ||
	allDisplays isEqualTo [findDisplay 0] ||
	is3DEN ||
	!GET_CONFIG(frameworkInit,false)
) exitWith {};
