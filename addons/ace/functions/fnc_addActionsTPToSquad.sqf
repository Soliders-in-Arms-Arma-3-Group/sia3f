#include "script_component.hpp"

/*
 * Author: McKendrick, Siege
 * Add 'Teleport to Squad' actions to the given objects.
 *
 * Arguments:
 * 0: button objects <ARRAY of OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[someButton, someOtherButton]] call sia3f_ace_fnc_addActionsTPToSquad
*/

params [
	["_objects", [], [[]]]
];

if (!GET_CONFIG(enableTPToSquad,true) || _objects isEqualTo []) exitWith {
	LOG_FUNC_END_ERROR("enableTPToSquad disabled or invalid/empty params");
};
LOG_FUNC_START;

TRACE_1("params",_objects);

if ("@ace" call EFUNC(core,checkModPresence)) then {
	private _tpToSquadAction = [QGVAR(TpSquad), "Teleport to Squad", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\meet_ca.paa", { [] spawn EFUNC(core,teleportToSquad) }, { true }] call ace_interact_menu_fnc_createAction;
	{ [_x, 0, ["ACE_MainActions"], _tpToSquadAction, true] call ace_interact_menu_fnc_addActionToObject; } forEach _objects;
} else {
	{ 
		_x addAction ["<img image='\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\meet_ca.paa'/> Teleport to Squad", { [] spawn EFUNC(core,teleportToSquad); }];
	} forEach _objects;
};

LOG_FUNC_END;
