#include "script_component.hpp"

/*
 * Author: McKendrick
 * Credits: F3 - Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
 * Safe Start, Safety and Invicibility Toggle
 *
 * Arguments:
 * 0: ID of "FiredMan" safety event handler <NUMBER>.
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_core_fnc_safeStartLoop

*/
INFO("fnc_safeStarLoop.sqf started.");

params [
    "_firedMan_EH"
];

[
	{ (_unit getVariable ["ace_safemode_safedWeapons", []]) isNotEqualTo (weapons _unit) || (missionNamespace getVariable [QGVAR(missionStarted), false]) },
	{
		params ["_unit", "_firedMan_EH"];
		if (!(missionNamespace getVariable [QGVAR(missionStarted), false])) then {
			{ [_unit, _x, true] call ace_safemode_fnc_setWeaponSafety } forEach ((weapons _unit) - (_unit getVariable ["ace_safemode_safedWeapons", []]));
			[_firedMan_EH] call FUNC(safeStartLoop);
		} else {
			// End loop; reset everything to their proper states.
			_unit allowDamage true;
			{ [_this select 0, _x, false] call ace_safemode_fnc_setWeaponSafety } forEach (weapons _unit);
			_unit setVariable ["ace_common_effect_blockThrow", 0];
			_unit setVariable ["ace_explosives_PlantingExplosive", false];
			_unit removeEventHandler ["FiredMan", _firedMan_EH];

			INFO("fnc_safeStartLoop.sqf loop ended and player safety disabled.");
		};
	},
	[player, _firedMan_EH]
] call CBA_fnc_waitUntilAndExecute;

INFO("fnc_safeStartLoop.sqf fully executed.");
