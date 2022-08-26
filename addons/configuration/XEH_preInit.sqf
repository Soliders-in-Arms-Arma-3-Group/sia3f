#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(roles) = createHashMap;
GVAR(roles) set ["some role", [true, false, true, false, []]];
GVAR(roles) set ["some OP role", [true, true, true, true, []]];
GVAR(roles) set ["some rifleman role", [false, false, false, false, []]];

ADDON = true;
