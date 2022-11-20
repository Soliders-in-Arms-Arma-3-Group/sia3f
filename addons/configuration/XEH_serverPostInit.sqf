#include "script_component.hpp"

if (allDisplays isEqualTo [findDisplay 0] && !is3DEN) exitWith {};

[GVAR(buttons), GVAR(arsenals)] remoteExecCall [QEFUNC(ace,interactions), 0, true];
