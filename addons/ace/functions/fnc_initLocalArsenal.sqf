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
private _roleValues = GVAR(roles) getOrDefault [_role, [false, false, false, false, [], ""]];
private _roleItems = _roleValues # 4;

// get group items if role is in a group
if ((_roleValues # 5) in GVAR(groups)) then {
	private _groupItems = (GVAR(groups) get (_roleValues # 5)) # 4;
};

TRACE_3("local arsenal added items",_loadout,_roleItems,_groupItems);
