#include "script_component.hpp"

/*
 * Author: McKendrick, Siege
 * Add 'Manage Kit' actions to the given objects.
 *
 * Arguments:
 * 0: button objects <ARRAY of OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[someButton, someOtherButton]] call sia3f_ace_fnc_addActionsManageKit
*/

params [
	["_objects", [], [[objNull]]]
];

if (!GET_CONFIG(enableManageKit,true) || _objects isEqualTo []) exitWith {
	LOG_FUNC_END_ERROR("enableManageKit disabled or invalid/empty params");
};
LOG_FUNC_START;

TRACE_1("params",_objects);

// Manage Loadouts Expressions
private _statementKitSave = {
	player setVariable [QEGVAR(core,savedLoadout), getUnitLoadout player];
	hint "Kit saved. Will be loaded on respawn.";
};

private _statementKitLoad = {
	player setUnitLoadout (player getVariable [QEGVAR(core,savedLoadout), []]);
	hint "Saved kit loaded.";
};

private _statementKitClear = {
	player setVariable [QEGVAR(core,savedLoadout), nil];
	hint "Saved kit cleared. Will use kit from death when respawned.";
};

if ("@ace" call EFUNC(core,checkModPresence)) then {
	private _mainAction = [QGVAR(kit), "Save/Manage Kit", "\A3\Ui_F\Data\IGUI\Cfg\Actions\gear_ca.paa", _statementKitSave, { true }] call ace_interact_menu_fnc_createAction;
	private _saveAction = [QGVAR(kitSave), "Save Current Kit", "\A3\Ui_F\Data\GUI\Rsc\RscDisplayArcadeMap\icon_save_ca.paa", _statementKitSave, { true }] call ace_interact_menu_fnc_createAction;
	private _loadAction = [QGVAR(kitLoad), "Load Saved Kit", "\A3\Ui_F\Data\IGUI\Cfg\Actions\reammo_ca.paa", _statementKitLoad, { true }] call ace_interact_menu_fnc_createAction;
	private _clearAction = [QGVAR(kitClear), "Remove Saved Kit", "z\ace\addons\arsenal\data\iconClearContainer.paa", _statementKitClear, { true }] call ace_interact_menu_fnc_createAction;

	{
		private _y = _x;
		[_y, 0, ["ACE_MainActions"], _mainAction, true] call ace_interact_menu_fnc_addActionToObject;
		{ [_y, 0, ["ACE_MainActions", QGVAR(kit)], _x, true] call ace_interact_menu_fnc_addActionToObject; } forEach [_saveAction, _loadAction, _clearAction];
	} forEach _objects;

} else {
	{
		_x addAction ["----------", {}]; // 10 indents for spacing
		_x addAction ["<img image='\A3\Ui_F\Data\GUI\Rsc\RscDisplayArcadeMap\icon_save_ca.paa'/> Save Current Kit", _statementKitSave];
		_x addAction ["<img image='\A3\Ui_F\Data\IGUI\Cfg\Actions\reammo_ca.paa'/> Load Saved Kit", _statementKitLoad];
		_x addAction ["<img image='\A3\Ui_F\Data\IGUI\Cfg\Actions\gear_ca.paa'/> Remove Saved Kit", _statementKitClear];
		_x addAction ["----------", {}];
	} forEach _objects;
};

LOG_FUNC_END;
