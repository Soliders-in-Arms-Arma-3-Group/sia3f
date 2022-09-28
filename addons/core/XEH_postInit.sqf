#include "script_component.hpp"

if ((allDisplays isEqualTo [findDisplay 0]) || is3DEN) exitWith {};

call FUNC(loadoutNotes);
call FUNC(briefing);
call FUNC(orbat);
