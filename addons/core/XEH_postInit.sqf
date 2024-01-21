#include "script_component.hpp"

if (
	allDisplays isEqualTo [findDisplay 0] ||
	is3DEN ||
	!GET_CONFIG(frameworkInit,false)
) exitWith {};

call FUNC(weatherNotes);
call FUNC(loadoutNotes);
call FUNC(orbat);

// Safe Start
[GET_CONFIG(showSafestartHint,true)] call FUNC(safeStartInit);
