#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// these should not be updated after initialization
GVAR(roles) = GET_CONFIG(roles,createHashMap);
GVAR(groups) = GET_CONFIG(groups,createHashMap);

TRACE_2("role configuration values",GVAR(roles),GVAR(groups));
if (GVAR(roles) isEqualTo createHashMap) then {
	ERROR_MSG("Roles config is not set!");
};

ADDON = true;
