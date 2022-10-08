#include "script_component.hpp"

#include "XEH_PREP.hpp"

if (
	allDisplays isEqualTo [findDisplay 0] ||
	is3DEN ||
	!GET_CONFIG(frameworkInit,false)
) exitWith {};
