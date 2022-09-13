#include "script_component.hpp"

#define SAFESTART_HINT_REFRESH 30; 
/*
 * Author: McKendrick
 * Safe Start initlization for safety and hint.
 *
 * Arguments:
 * 0: If safeStart Hint feature is enabled <BOOLEAN> (default: True)
 * 1: If safeStart Safety feature is enabled <BOOLEAN> (default: True)
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_core_fnc_safeStartInit

*/
LOG("fnc_safeStartHint.sqf started.");

params [
	["_safeStartHintEnabled", true, [true]],
	["_safeStartSafetyEnabled", true, [true]]
];

/* Safe Start Hint */
if (_safeStartHintEnabled && isServer) then {
    [] spawn {
        while { !(missionNamespace getVariable [QGVAR(missionStarted), false]) } do {
            remoteExec [QFUNC(safeStartHint)];
            sleep SAFESTART_HINT_REFRESH;
        };
    };
};

/* Safe Start Safety */
if (_safeStartSafetyEnabled && hasInterface) then {
	player allowDamage false;

	if (player in (allCurators apply { getAssignedCuratorUnit _x })) exitWith { LOG("fnc_safeStartInit.sqf loop exited: player is curator.") };

	{ [player, _x, true] call ace_safemode_fnc_setWeaponSafety } forEach (weapons player);
	player setVariable ["ace_common_effect_blockThrow", 1]; // force use vanilla throwing so the EH works
	player setVariable ["ace_explosives_PlantingExplosive", true]; // prevent planting explosives

	private _firedMan_EH = player addEventHandler ["FiredMan", {
		deleteVehicle (_this # 6); // delete object as it is fired
		
		if (_this # 1 == "Throw") then {
			(_this # 0) addItem (_this # 4); // replace whatever was thrown.
		};
	}];

	[_firedMan_EH] call FUNC(safeStartLoop);
};

INFO("fnc_safeStartInit.sqf fully executed.");
