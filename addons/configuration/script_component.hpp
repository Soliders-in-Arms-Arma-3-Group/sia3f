#define COMPONENT configuration
#define COMPONENT_BEAUTIFIED Configuration
#include "\z\sia3f\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_BLANK
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_BLANK
    #define DEBUG_SETTINGS DEBUG_SETTINGS_BLANK
#endif

#include "\z\sia3f\addons\main\script_macros.hpp"


#define SET_CONFIG(section,var,value) QGVAR(section) set3DENMissionAttribute [QGVAR(var), value]
