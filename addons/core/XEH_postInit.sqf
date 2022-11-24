#include "script_component.hpp"

if (
	allDisplays isEqualTo [findDisplay 0] ||
	is3DEN ||
	!GET_CONFIG(frameworkInit,false)
) exitWith {};

call FUNC(loadoutNotes);
call FUNC(briefing);
call FUNC(orbat);
