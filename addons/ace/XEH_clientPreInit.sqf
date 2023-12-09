#include "script_component.hpp"

// Addon Settings:
[
	"EnableKitAutosave",
	"CHECKBOX",
	["Loadout Autosave", "Autosave your loadout when exiting arsenal. Will not overwrite a manually saved kit."],
	"SIA Mission Framework",
	true,
	0,
	{
		TRACE_1("Loadout Autosave setting updated",_this);
		_this call FUNC(updateAutosave);
	}
] call CBA_fnc_addSetting;
