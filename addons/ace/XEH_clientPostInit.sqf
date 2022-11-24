#include "script_component.hpp"
// should behave identically to initPlayerLocal

if (
	!("@ace" call EFUNC(core,checkModPresence)) ||
	allDisplays isEqualTo [findDisplay 0] ||
	is3DEN ||
	!GET_CONFIG(frameworkInit,false)
) exitWith {};

// Player Self Actions
call FUNC(playerActions);
call FUNC(zeusActions);
