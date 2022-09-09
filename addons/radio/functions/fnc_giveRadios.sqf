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

// ToDo: allow GM to customize
private _rolesWithHandheldRadio = ["sql", "tl", "pltco", "pltsgt", "gm", "drone_op", "spotter", "sniper", "medic"];
private _rolesManpackRadio = ["pltco"];

private _personalRadioClassname = ["ACRE_PRC343", "ACRE_BF888S"] select GET_CONFIG(personalRadio,0);
private _handheldRadioClassname = ["ACRE_PRC152", "ACRE_PRC148"] select GET_CONFIG(handheldRadio,0);
private _manpackRadioClassname = ["ACRE_PRC117F", "ACRE_PRC77"] select GET_CONFIG(manpackRadio,0);
TRACE_3("Radio classnames",_personalRadioClassname,_handheldRadioClassname,_manpackRadioClassname);

private _role = player getVariable [QEGVAR(core,role), "none"];

[
	{
		params ["_role", "_personalRadioClassname", "_handheldRadioClassname", "_manpackRadioClassname", "_rolesWithHandheldRadio", "_rolesManpackRadio"];
		if (!([player, _personalRadioClassname] call acre_api_fnc_hasKindOfRadio)) then { player addItem _personalRadioClassname };
		if (_role in _rolesWithHandheldRadio && !([player, _handheldRadioClassname] call acre_api_fnc_hasKindOfRadio)) then { player addItem _handheldRadioClassname };
		if (_role in _rolesManpackRadio && !([player, _manpackRadioClassname] call acre_api_fnc_hasKindOfRadio)) then { player addItem _manpackRadioClassname };

		[((group player) getVariable [QEGVAR(configuration,radioChannel), 1]), _personalRadioClassname] spawn FUNC(setRadioChannel);
	},
	[_role, _personalRadioClassname, _handheldRadioClassname, _manpackRadioClassname, _rolesWithHandheldRadio, _rolesManpackRadio],
	1
] call CBA_fnc_waitAndExecute;

INFO("fnc_giveRadios executed.");
