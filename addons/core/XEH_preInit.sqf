#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (
	allDisplays isEqualTo [findDisplay 0] ||
	is3DEN ||
	!GET_CONFIG(frameworkInit,false)
) exitWith {};

// these should not be updated after initialization
GVAR(roles) = GET_CONFIG(roles,createHashMap);
GVAR(roleGroups) = GET_CONFIG(roleGroups,createHashMap);

TRACE_2("role configuration values",GVAR(roles),GVAR(roleGroups));
if (GVAR(roles) isEqualTo createHashMap) then {
	ERROR_MSG("Roles config is not set!");
};

ADDON = true;
