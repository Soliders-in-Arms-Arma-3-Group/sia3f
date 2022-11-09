#include "script_component.hpp"

if (allDisplays isEqualTo [findDisplay 0] && !is3DEN) exitWith {};

LOG("blah blah ablahsdf");
[GVAR(buttons), GVAR(arsenals)] remoteExecCall [QEFUNC(ace,interactions)];
