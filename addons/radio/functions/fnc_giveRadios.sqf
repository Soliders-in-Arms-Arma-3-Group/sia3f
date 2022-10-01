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

if (!GET_CONFIG(acreEnabled,true) || isDedicated || !("@ACRE2" call EFUNC(core,checkModPresence))) exitWith {
	LOG("fnc_giveRadios: acre not enabled/loaded or script run on server machine.");
}; // Exit if server or if ACRE is disabled.
LOG("fnc_giveRadios started.");

private _rolesHandheldRadio = [];
private _rolesManpackRadio = [];
{
	if (_y # 2) then {
		_rolesHandheldRadio pushBackUnique _x;
	};
	if (_y # 3) then {
		_rolesManpackRadio pushBackUnique _x;
	};
} forEach EGVAR(core,roles);

{
	if (_y # 2) then {
		{ _rolesHandheldRadio pushBackUnique _x } forEach _y # 5;
	};
	if (_y # 3) then {
		{ _rolesManpackRadio pushBackUnique _x } forEach _y # 5;
	};
} forEach EGVAR(core,groups);
TRACE_2("Radio roles",_rolesHandheldRadio,_rolesManpackRadio);

private _personalRadioClassname = missionNameSpace getVariable [QGVAR(personalRadio),"ACRE_PRC343"];
private _handheldRadioClassname = missionNameSpace getVariable [QGVAR(handheldRadio),"ACRE_PRC152"];
private _manpackRadioClassname = missionNameSpace getVariable [QGVAR(manpackRadio),"ACRE_PRC117F"];
TRACE_3("Radio classnames",_personalRadioClassname,_handheldRadioClassname,_manpackRadioClassname);

private _role = player getVariable [QEGVAR(configuration,role), "default"];

[
	{ ([] call acre_api_fnc_isInitialized) },
	{
		params ["_role", "_personalRadioClassname", "_handheldRadioClassname", "_manpackRadioClassname", "_rolesWithHandheldRadio", "_rolesManpackRadio"];
		if (!([player, _personalRadioClassname] call acre_api_fnc_hasKindOfRadio) && _personalRadioClassname != "NONE") then { player addItem _personalRadioClassname };
		if (_role in _rolesWithHandheldRadio && !([player, _handheldRadioClassname] call acre_api_fnc_hasKindOfRadio) && _handheldRadioClassname != "NONE") then { player addItem _handheldRadioClassname };
		if (_role in _rolesManpackRadio && !([player, _manpackRadioClassname] call acre_api_fnc_hasKindOfRadio) && _manpackRadioClassname != "NONE") then { player addItem _manpackRadioClassname };

		[((group player) getVariable [QEGVAR(configuration,radioChannel), 1]), _personalRadioClassname] spawn FUNC(setRadioChannel);
	},
	[_role, _personalRadioClassname, _handheldRadioClassname, _manpackRadioClassname, _rolesHandheldRadio, _rolesManpackRadio]
] call CBA_fnc_waitUntilAndExecute;

INFO("fnc_giveRadios executed.");
