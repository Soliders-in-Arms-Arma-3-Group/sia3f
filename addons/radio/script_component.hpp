#define COMPONENT radio
#define COMPONENT_BEAUTIFIED Radio
#include "\z\sia3f\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MAIN
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MAIN
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MAIN
#endif

#include "\z\sia3f\addons\main\script_macros.hpp"

#define CONCAT_2(var1,var2) var1####var2

#define SPATIALIZATION_SETTINGS_VALUE_INFO [[-1, 0, 1], ["Left", "Both", "Right"], 1]
#define SPATIALIZATION_SETTINGS(RADIO,displayName) [\
QGVAR(CONCAT_2(spatializationZone,RADIO)),\
"LIST",\
displayName,\
["SIA Mission Framework", "Spatialization Settings"],\
SPATIALIZATION_SETTINGS_VALUE_INFO,\
false] call CBA_fnc_addSetting
