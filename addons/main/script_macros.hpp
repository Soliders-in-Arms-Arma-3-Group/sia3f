#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp" // not used here but potentially required by script_macros_common.hpp

// Default versioning level
#define DEFAULT_VERSIONING_LEVEL 2

// Player GUI colors
// From https://github.com/zen-mod/ZEN/blob/3473e812d0e2e807fea39b4dd2f871ba40b1e8aa/addons/main/script_macros.hpp#L86-L91
#define GUI_THEME_RGB_R "(profileNamespace getVariable ['GUI_BCG_RGB_R',0.13])"
#define GUI_THEME_RGB_G "(profileNamespace getVariable ['GUI_BCG_RGB_G',0.54])"
#define GUI_THEME_RGB_B "(profileNamespace getVariable ['GUI_BCG_RGB_B',0.21])"
#define GUI_THEME_ALPHA "(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"
#define GUI_THEME_COLOR {GUI_THEME_RGB_R,GUI_THEME_RGB_G,GUI_THEME_RGB_B,GUI_THEME_ALPHA}

#define GET_CONFIG(var1) (getMissionConfigValue QEGVAR(configuration,var1))
#define GET_CONFIG_DEFAULT(var,default) (getMissionConfigValue [QEGVAR(configuration,var1), default])

// from ACE 3
#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(fncName) FUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif
