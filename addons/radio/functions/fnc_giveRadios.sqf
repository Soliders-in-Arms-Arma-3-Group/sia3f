#include "script_component.hpp"

/*
 * Authors: McKendrick, Siege
 * Add player's radios to inventory.  Execute on server.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_radio_fnc_giveRadios
*/

if (!GET_CONFIG(acreEnabled,true) || !isServer || !("@ACRE2" call EFUNC(core,checkModPresence))) exitWith {
	LOG("fnc_giveRadios: acre not enabled/loaded or script run on client machine.");
}; // Exit if not server or if ACRE is disabled.
LOG("fnc_giveRadios started.");

private _rolesHandheldRadio = [];
private _rolesManpackRadio = [];
{
	if (_x # 2) then {
		_rolesHandheldRadio pushBackUnique _y;
	};
	if (_x # 3) then {
		_rolesManpackRadio pushBackUnique _y;
	};
} forEach EGVAR(core,roles);

{
	if (_x # 2) then {
		{ _rolesHandheldRadio pushBackUnique _x } forEach _x # 5;
	};
	if (_x # 3) then {
		{ _rolesManpackRadio pushBackUnique _x } forEach _x # 5;
	};
} forEach EGVAR(core,groups);
TRACE_2("Radio roles",_rolesHandheldRadio,_rolesManpackRadio);

private _personalRadioClassname = ["ACRE_PRC343", "ACRE_BF888S"] select GET_CONFIG(personalRadio,0);
private _handheldRadioClassname = ["ACRE_PRC152", "ACRE_PRC148"] select GET_CONFIG(handheldRadio,0);
private _manpackRadioClassname = ["ACRE_PRC117F", "ACRE_PRC77"] select GET_CONFIG(manpackRadio,0);
TRACE_3("Radio classnames",_personalRadioClassname,_handheldRadioClassname,_manpackRadioClassname);

{
	private _player = _x;
	private _role = _player getVariable [QEGVAR(core,role), "none"];

	if (!([_player, _personalRadioClassname] call BIS_fnc_hasItem)) then { _player addItem _personalRadioClassname };
	if (_role in _rolesHandheldRadio && !([_player, _handheldRadioClassname] call BIS_fnc_hasItem)) then { _player addItem _handheldRadioClassname };
	if (_role in _rolesManpackRadio && !([_player, _manpackRadioClassname] call BIS_fnc_hasItem)) then { _player addItem _manpackRadioClassname };
} forEach call BIS_fnc_listPlayers;

INFO("fnc_giveRadios executed.");
