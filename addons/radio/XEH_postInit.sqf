#include "script_component.hpp"

if (!GET_CONFIG(acreEnabled,true) || !isServer || !("@ACRE2" call EFUNC(core,checkModPresence))) exitWith {}; // exit if ACRE not loaded

call FUNC(giveRadios);
