#include "script_component.hpp"

/*
 * Author: McKendrick, Siege
 * Add ace actions for both arsenals and buttons.
 *
 * Arguments:
 * 0: Common objects, both buttons and arsenal <ARRAY of OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [someObject, someOtherObject] call sia3f_ace_fnc_commonObjectActions
*/

params [
	["_commonObjects", [], [[objNull]]]
];

if (!GET_CONFIG(enableManageKit,true) || _commonObjects isEqualTo []) exitWith {
	LOG_FUNC_END_ERROR("enableManageKit disabled or invalid/empty params");
};
LOG_FUNC_START;

TRACE_1("params",_commonObjects);

// Manage Loadouts
private _statement = {
	player setVariable [QEGVAR(core,savedLoadout), getUnitLoadout player];
	hint "Kit saved. Will be loaded on respawn.";
};

private _mainAction = [QGVAR(kit), "Save/Manage Kit", "\A3\Ui_F\Data\IGUI\Cfg\Actions\gear_ca.paa", _statement, { true }] call ace_interact_menu_fnc_createAction;
private _saveAction = [QGVAR(kitSave), "Save Current Kit", "\A3\Ui_F\Data\GUI\Rsc\RscDisplayArcadeMap\icon_save_ca.paa", _statement, { true }] call ace_interact_menu_fnc_createAction;
private _loadAction = [QGVAR(kitLoad), "Load Saved Kit", "\A3\Ui_F\Data\IGUI\Cfg\Actions\reammo_ca.paa", {
	player setUnitLoadout (player getVariable [QEGVAR(core,savedLoadout), []]);
	hint "Saved kit loaded.";
}, { true }] call ace_interact_menu_fnc_createAction;
private _clearAction = [QGVAR(kitClear), "Remove Saved Kit", "z\ace\addons\arsenal\data\iconClearContainer.paa", {
	player setVariable [QEGVAR(core,savedLoadout), nil];
	hint "Saved kit cleared. Will use kit from death when respawned.";
}, { true }] call ace_interact_menu_fnc_createAction;

{
	private _y = _x;
	[_y, 0, ["ACE_MainActions"], _mainAction, true] call ace_interact_menu_fnc_addActionToObject;
	{ [_y, 0, ["ACE_MainActions", QGVAR(kit)], _x, true] call ace_interact_menu_fnc_addActionToObject; } forEach [_saveAction, _loadAction, _clearAction];
} forEach _commonObjects;

LOG_FUNC_END;
