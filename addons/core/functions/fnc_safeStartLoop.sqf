#include "script_component.hpp"

/*
 * Author: McKendrick, Siege
 * Make player invincible and stop them from shooting, throwing grenades, and planting explosives until mission start.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * spawn sia3f_core_fnc_safeStartLoop

*/

if (!hasInterface) exitWith {};

INFO("fnc_safeStarLoop.sqf started.");

player allowDamage false; // Make the zeus(es) invincible.

if (player in (allCurators apply { getAssignedCuratorUnit _x })) exitWith { LOG("fnc_safeStartLoop.sqf was exited: unit is a curator.") };

if ("@ace" call FUNC(checkModPresence)) then {
	{ [player, _x, true] call ace_safemode_fnc_setWeaponSafety } forEach (weapons player);
	player setVariable ["ace_common_effect_blockThrow", 1]; // force use vanilla throwing so the event handler works (need to make ensure that another function doesn't set it to 0)
	player setVariable ["ace_explosives_PlantingExplosive", true]; // This is the only way to stop planting of explosives that I could find
};

private _FiredMan_EH = player addEventHandler ["FiredMan", {
	deleteVehicle (_this # 6);
	
	if (_this # 1 == "Throw") then {
		(_this # 0) addItem (_this # 4); // replace lost grenades, smokes, etc.
	};
}];

if ("@ace" call FUNC(checkModPresence)) then {
	while { !(missionNamespace getVariable [QGVAR(missionStarted), false]) } do { 
		waitUntil { (player getVariable ["ace_safemode_safedWeapons", []]) isNotEqualTo (weapons player) || (missionNamespace getVariable [QGVAR(missionStarted), false]) };
		if (!(missionNamespace getVariable [QGVAR(missionStarted), false])) then {
			{ [player, _x, true] call ace_safemode_fnc_setWeaponSafety } forEach ((weapons player) - (player getVariable "ace_safemode_safedWeapons"));
		};
	};
} else {
	waitUntil { missionNamespace getVariable [QGVAR(missionStarted), false] };
};

// reset everything to their proper states
player allowDamage true;
player removeEventHandler ["FiredMan", _FiredMan_EH];
if ("@ace" call FUNC(checkModPresence)) then {
	{ [player, _x, false] call ace_safemode_fnc_setWeaponSafety } forEach (weapons player);
	player setVariable ["ace_common_effect_blockThrow", 0];
	player setVariable ["ace_explosives_PlantingExplosive", false];
};

INFO("fnc_safeStartLoop.sqf fully executed.");
