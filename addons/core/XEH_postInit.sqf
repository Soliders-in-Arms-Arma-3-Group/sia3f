#include "script_component.hpp"

// ToDo: move to main script_macros
#define GET_CONFIG(var1) getMissionConfigValue QUOTE(var1)

 [] call FUNC(test);

hint "Test message";

if (GET_CONFIG(SIA_arsenalEnabled)) then {
    private _info = "Diary Test";
    player createDiaryRecord ["Diary", ["Framework Info", _info]];
};
