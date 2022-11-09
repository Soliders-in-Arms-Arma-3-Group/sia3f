#include "script_component.hpp"

/*
 * Author: McKendrick, Siege
 * Add ace actions for all buttons.
 *
 * Arguments:
 * 0: button objects <ARRAY of OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [someButton, someOtherButton] call sia3f_ace_fnc_buttonActions
*/

params [
	["_buttons", [], [[]]]
];

if (_buttons isEqualTo []) exitWith {
	LOG_FUNC_END_ERROR("invalid/empty params");
};
LOG_FUNC_START;

if (GET_CONFIG(enableTPToSquad,true)) then {
	private _tpToSquadAction = [QGVAR(TpSquad), "Teleport to Squad", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\meet_ca.paa", { [] spawn EFUNC(core,teleportToSquad); }, { true }] call ace_interact_menu_fnc_createAction;
	{ [_x, 0, ["ACE_MainActions"], _tpToSquadAction, true] call ace_interact_menu_fnc_addActionToObject; } forEach _buttons;
};

LOG_FUNC_END;
