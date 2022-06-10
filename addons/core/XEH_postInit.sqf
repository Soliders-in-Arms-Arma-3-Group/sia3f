#include "script_component.hpp"

 [] call FUNC(test);

["SIA_ArsenalOptions_arsenalEnabled", {
    hint "Test message";

	private _info = "Diary Test";
    player createDiaryRecord ["Diary", ["Framework Info", _info]];

}] call CBA_fnc_addEventHandler;