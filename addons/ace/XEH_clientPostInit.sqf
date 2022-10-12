#include "script_component.hpp"
// should behave identically to initPlayerLocal

if (
	!("@ace" call EFUNC(core,checkModPresence)) ||
	allDisplays isEqualTo [findDisplay 0] ||
	is3DEN ||
	!GET_CONFIG(frameworkInit,false)
) exitWith {};

// interaction objects
private ["_action", "_statement"];
private _buttons = missionNamespace getVariable [QEGVAR(configuration,buttons), []];
private _arsenals = missionNamespace getVariable [QEGVAR(configuration,arsenals), []];
private _commonObjects = +_buttons + _arsenals;
_commonObjects = _commonObjects arrayIntersect _commonObjects;
TRACE_3("interaction objects",_buttons,_arsenals,_commonObjects);

// Player Self Actions
call FUNC(playerActions);

// Arsenal/Button Actions

[_buttons] call FUNC(buttonActions);
[_commonObjects] call FUNC(commonObjectActions);
