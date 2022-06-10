#include "script_component.hpp"

#include "XEH_PREP.sqf"

ADDON = true;

[SIA_ArsenalOptions_arsenalEnabled, {
    hint "Test message";

	private _info = "Diary Test";
    player createDiaryRecord ["Diary", ["Framework Info", _info]];

}] call CBA_fnc_addEventHandler;