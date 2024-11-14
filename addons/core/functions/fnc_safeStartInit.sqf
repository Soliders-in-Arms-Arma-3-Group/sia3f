#include "script_component.hpp"

#define SAFESTART_HINT_REFRESH 30; 
/*
 * Author: McKendrick
 * Safe Start initialization for safety and hint.
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
LOG_FUNC_START;

params [
	["_safeStartHintEnabled", true, [true]]
];

/* Safe Start Hint */
if (_safeStartHintEnabled && isServer) then {
	[] spawn {
		while { !(missionNamespace getVariable [QGVAR(missionStarted), false]) } do {
			remoteExec [QFUNC(safeStartHint), [0, -2] select isDedicated];
			sleep SAFESTART_HINT_REFRESH;
		};
	};
};

/* Safe Start Safety */
if (hasInterface) then {
	[
		{ !isNull (getAssignedCuratorLogic _this) },
		{ [_this] spawn FUNC(safeStartLoop) },
		player,
		1,
		{ [_this] spawn FUNC(safeStartLoop) }
	] call CBA_fnc_waitUntilAndExecute; // timeout to wait for zeus logic to get setup
};

LOG_FUNC_END;
