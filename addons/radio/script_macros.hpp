#define CONCAT_2(var1,var2) var1####var2

#define SPATIALIZATION_SETTINGS_VALUE_INFO [[-1, 0, 1], ["Left", "Both", "Right"], 1]
#define SPATIALIZATION_SETTINGS(RADIO,displayName) [ \
QGVAR(CONCAT_2(spatializationZone,RADIO)), \
"LIST", \
displayName, \
["SIA Mission Framework", "Spatialization Settings"], \
SPATIALIZATION_SETTINGS_VALUE_INFO, \
false] call CBA_fnc_addSetting
