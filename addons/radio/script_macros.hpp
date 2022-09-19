#define RADIO_VAR(radio) ACRE_radio

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
		["setRadioDefaultSpatial", [QUOTE(RADIO_VAR(radio)), ["Left", "Both", "Right"] select _this]] call FUNC(acreRadioSetup); \
	}, \
	false \
] call CBA_fnc_addSetting
// ["sia3f_settingChanged", [QGVAR(CONCAT_2(spatializationZone,RADIO), _this]] call CBA_fnc_localEvent;