#define RADIO_VAR(radio) ACRE_radio

#define GET_HASH profileNamespace getVariable [ \
	QGVAR(ACREDefaultSpatial), \
	["ACRE_PRC343", "ACRE_PRC148", "ACRE_PRC152", "ACRE_PRC77", "ACRE_PRC117F"] createHashMapFromArray ["RIGHT", "LEFT", "LEFT", "LEFT", "LEFT"] \
] // Load player's current default spatial settings.

#define SPATIALIZATION_SETTINGS_VALUE_INFO [[0, 1, 2], ["Left", "Both", "Right"], 1]
#define SPATIALIZATION_SETTINGS(RADIO,displayName) [ \
	QGVAR(RADIO_VAR(RADIO)), \
	"LIST", \
	displayName, \
	["SIA Mission Framework", "Spatialization Settings"], \
	SPATIALIZATION_SETTINGS_VALUE_INFO, \
	false, \
	{ \
		TRACE_2(QUOTE(ACRE RADIO (displayName) settings updated),_this); \
	}, \
	false \
] call CBA_fnc_addSetting
// ToDo: add call to setDefaultSpatial in expression
// ["sia3f_settingChanged", [QGVAR(CONCAT_2(spatializationZone,RADIO), _this]] call CBA_fnc_localEvent;