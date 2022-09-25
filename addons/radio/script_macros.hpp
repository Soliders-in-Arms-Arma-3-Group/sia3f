#define SPATIALIZATION_SETTINGS_NAME(NAME) NAME##_spatialization
#define SPATIALIZATION_SETTINGS_VALUE_INFO [[0, 1, 2], ["Left", "Both", "Right"], 1]
#define SPATIALIZATION_SETTINGS(RADIO,displayName) [ \
	QGVAR(SPATIALIZATION_SETTINGS_NAME(RADIO)), \
	"LIST", \
	displayName, \
	["SIA Mission Framework", "Spatialization Settings"], \
	SPATIALIZATION_SETTINGS_VALUE_INFO, \
	false, \
	{ \
		TRACE_2(QUOTE(RADIO settings updated),_this); \
		[QUOTE(RADIO), _this] spawn FUNC(setDefaultSpatial); \
	}, \
	false \
] call CBA_fnc_addSetting
