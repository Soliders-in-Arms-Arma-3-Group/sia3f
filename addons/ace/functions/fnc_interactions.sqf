#include "script_component.hpp"

/*
 * Author: Siege
 * Organizes buttons/arsenals and calls add action functions.
 *
 * Arguments:
 * 0: Buttons <ARRAY of OBJECT>
 * 1: Arsenals <ARRAY of OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_ace_fnc_interactions
*/

// interaction objects
params [
	["_buttons", [], [[]]],
	["_arsenals", [], [[]]]
];
LOG_FUNC_START;
TRACE_2("params",_buttons,_arsenals);

private _commonObjects = +_buttons + _arsenals;
_commonObjects = _commonObjects arrayIntersect _commonObjects;
TRACE_3("interaction objects",_buttons,_arsenals,_commonObjects);

// Arsenal/Button Actions
[_buttons] call FUNC(addActionsTPToSquad);
[_commonObjects] call FUNC(addActionsManageKit);
["addActions", _buttons] call EFUNC(core,teleport);

LOG_FUNC_END;
