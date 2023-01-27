#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (allDisplays isEqualTo [findDisplay 0]) exitWith {};

// ToDo: fetch orbat info from config and store in editable hashmap or namespace

ADDON = true;
