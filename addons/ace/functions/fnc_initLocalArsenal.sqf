#include "script_component.hpp"

/*
 * Author: Siege
 * Inits player's local arsenal depending on role.  Execute locally.
 *
 * Arguments:
 * 0: Arsenals <ARRAY of OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_ace_fnc_initLocalArsenal
*/

if (!hasInterface) exitWith {
	LOG_FUNC_END_ERROR("function ran on server");
}; // exit if executed on non client machine

params [
	["_arsenals", [], [[]]]
];

LOG_FUNC_START;

// add player's loadout to arsenal
private _loadout = flatten (getUnitLoadout player);
_loadout = _loadout arrayIntersect _loadout select { _x isEqualType "" && { _x != "" } };

// get role items
private _role = player getVariable [QEGVAR(configuration,role), "default"];
private _roleValues = EGVAR(core,roles) getOrDefault [_role, [false, false, false, false, [], []]];
private _roleItems = _roleValues # 4;

// get radios
private _acreRadios = ([] call acre_api_fnc_getAllRadios) select 0;
if (_roleValues # 2) then {
	if (EGVAR(radio,handheldRadio) != "NONE") then {
		if (EGVAR(radio,handheldRadio) in _acreRadios) then {
			_roleItems pushBackUnique EGVAR(radio,handheldRadio);
		} else {
			ERROR_1("Init Local Arsenal radios, invalid handheld radio type: %1",EGVAR(radio,handheldRadio));
		};
	};
};
if (_roleValues # 3) then {
	if (EGVAR(radio,manpackRadio) != "NONE") then {
		if (EGVAR(radio,manpackRadio) in _acreRadios) then {
			_roleItems pushBackUnique EGVAR(radio,manpackRadio);
		} else {
			ERROR_1("Init Local Arsenal radios, invalid manpack radio type: %1",EGVAR(radio,manpackRadio));
		};
	};
};

// get group items if role is in a group
private _groupItems = [];
if (({ _x in EGVAR(core,groups) } count _roleValues # 5) > 0) then {
	{
		_groupItems append ((EGVAR(core,groups) get _x) # 4);
	} forEach _roleValues # 5;
	
	_groupItems = _groupItems arrayIntersect _groupItems;
};

TRACE_3("local arsenal all items",_loadout,_roleItems,_groupItems);

private _commonItems = +_loadout + _roleItems + _groupItems;
_commonItems = _commonItems arrayIntersect _commonItems;
TRACE_1("local arsenal added items",_commonItems);

{ [_x, _commonItems, false] call ace_arsenal_fnc_addVirtualItems } forEach _arsenals;
LOG_FUNC_END;
