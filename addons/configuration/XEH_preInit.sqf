#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if ((allDisplays isEqualTo [findDisplay 0]) || !is3DEN) exitWith {};

ADDON = true;
