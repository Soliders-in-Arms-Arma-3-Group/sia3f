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

LOG_FUNC_START;
params [
   [ "_unit", player]
];

_unit allowDamage false; // Make the zeus(es) invincible.

if (_unit in (allCurators apply { getAssignedCuratorUnit _x })) exitWith { LOG_FUNC_END_ERROR("unit is a curator (zeus)"); };

{ [_unit, _x, true] call ace_safemode_fnc_setWeaponSafety } forEach (weapons _unit);
_unit setVariable ["ace_common_effect_blockThrow", 1]; // force use vanilla throwing so the event handler works (need to make ensure that another function doesn't set it to 0)
_unit setVariable ["ace_explosives_PlantingExplosive", true]; // This is the only way to stop planting of explosives that I could find

private _FiredMan_EH = _unit addEventHandler ["FiredMan", {
	deleteVehicle (_this # 6);
	
	if (_this # 1 == "Throw") then {
		(_this # 0) addItem (_this # 4); // replace lost grenades, smokes, etc.
	};
}];

while { !(missionNamespace getVariable [QGVAR(missionStarted), false]) } do { 
	waitUntil { (_unit getVariable ["ace_safemode_safedWeapons", []]) isNotEqualTo (weapons _unit) || (missionNamespace getVariable [QGVAR(missionStarted), false]) };
	if (!(missionNamespace getVariable [QGVAR(missionStarted), false])) then {
		{ [_unit, _x, true] call ace_safemode_fnc_setWeaponSafety } forEach ((weapons _unit) - (_unit getVariable "ace_safemode_safedWeapons"));
	};
};

// reset everything to their proper states
_unit allowDamage true;
{ [_unit, _x, false] call ace_safemode_fnc_setWeaponSafety } forEach (weapons _unit);
_unit setVariable ["ace_common_effect_blockThrow", 0];
_unit setVariable ["ace_explosives_PlantingExplosive", false];
_unit removeEventHandler ["FiredMan", _FiredMan_EH];

LOG_FUNC_END;
