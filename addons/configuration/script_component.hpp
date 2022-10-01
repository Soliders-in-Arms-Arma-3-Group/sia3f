#define COMPONENT configuration
#define COMPONENT_BEAUTIFIED Configuration
#include "\z\sia3f\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_BLANK
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_BLANK
    #define DEBUG_SETTINGS DEBUG_SETTINGS_BLANK
#endif

#include "\z\sia3f\addons\main\script_macros.hpp"

// GUI includes
#include "\a3\3DEN\UI\macros.inc" // GUI and script related macros
#include "\a3\ui_f\hpp\defineDIKCodes.inc" // DIK Key Codes
#include "\a3\ui_f\hpp\defineCommonGrids.inc" // Common GRIDs
#include "\a3\3DEN\UI\resincl.inc" // Eden Editor IDDs and IDCs as well as controls types and styles and macros

#include "\z\sia3f\addons\configuration\script_macros.hpp"
