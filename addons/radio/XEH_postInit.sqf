#include "script_component.hpp"

if (!"@ACRE2" call FUNC(checkModPresence)) exitWith {}; // exit if ACRE not loaded

call FUNC(giveRadios);
