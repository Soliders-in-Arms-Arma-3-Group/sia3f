#define SPATIALIZATION_SETTINGS_NAME(NAME) NAME##_spatialization
#define SPATIALIZATION_SETTINGS_VALUE_INFO(DEFAULT) [[0, 1, 2], ["Left", "Both", "Right"], DEFAULT]
#define SPATIALIZATION_SETTINGS(RADIO,DISPLAY_NAME,DEFAULT) [ \
	QGVAR(SPATIALIZATION_SETTINGS_NAME(RADIO)), \
	"LIST", \
	DISPLAY_NAME, \
	["SIA Mission Framework", "Spatialization Settings"], \
	SPATIALIZATION_SETTINGS_VALUE_INFO(DEFAULT), \
	false, \
	{ \
		TRACE_2(QUOTE(RADIO settings updated),_this); \
		[QUOTE(RADIO), _this] spawn FUNC(setDefaultSpatial); \
	}, \
	false \
] call CBA_fnc_addSetting
