#include "script_component.hpp"

/*
 * Author: Siege
 * Inits player's local arsenal depending on role.  Execute locally.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_ace_fnc_initLocalArsenal
*/

if (!hasInterface) exitWith {}; // exit if executed on non client machine

// add player's loadout to arsenal
private _loadout = getUnitLoadout player;
_loadout = (str _loadout splitString "[],") joinString ",";
_loadout = parseSimpleArray ("[" + _loadout + "]");
_loadout = _loadout arrayIntersect _loadout select { _x isEqualType "" && { _x != "" } };

// get role items
private _role = player getVariable [QEGVAR(configuration,role), "default"];
private _roleValues = EGVAR(core,roles) getOrDefault [_role, [false, false, false, false, [], []]];
private _roleItems = _roleValues # 4;

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

{ [_x, _commonItems, false] call ace_arsenal_fnc_addVirtualItems } forEach EGVAR(configuration,arsenals);
