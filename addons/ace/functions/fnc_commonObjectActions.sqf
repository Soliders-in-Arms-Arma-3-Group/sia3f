#import "script_component.hpp"

/*
 * Author: McKendrick, Siege
 * Add ace actions for both arsenals and buttons.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_ace_fnc_commonObjectActions
*/

params [
	["_commonObjects", [], [[objNull]]]
];

LOG_FUNC_START;
// Manage Loadouts
if (!GET_CONFIG(enableManageKit,true)) exitWith {
	LOG_FUNC_END_ERROR("enableManageKit disabled");
};

TRACE_1("params",_commonObjects);

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
	[_x, 0, ["ACE_MainActions"], _mainAction, true] call ace_interact_menu_fnc_addActionToObject;
	[_x, 0, ["ACE_MainActions", QGVAR(kit)], _saveAction, true] call ace_interact_menu_fnc_addActionToObject;
	[_x, 0, ["ACE_MainActions", QGVAR(kit)], _loadAction, true] call ace_interact_menu_fnc_addActionToObject;
	[_x, 0, ["ACE_MainActions", QGVAR(kit)], _clearAction, true] call ace_interact_menu_fnc_addActionToObject;
} forEach _commonObjects;

LOG_FUNC_END;
