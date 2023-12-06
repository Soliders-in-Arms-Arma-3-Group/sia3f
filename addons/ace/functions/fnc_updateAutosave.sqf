#include "script_component.hpp"

/*
 * Author: Siege
 * Handles changing the Loadout Autosave setting.
 *
 * Arguments:
 * 0: Setting value <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Example:
 * true call sia3f_ace_fnc_updateAutosave
*/

LOG_FUNC_START;

if (GET_CONFIG(enableManageKit,true)) then {
	if (_this) then {
		GVAR(arsenalClosedEH) = ["ace_arsenal_displayClosed", {
			if ((player getVariable [QEGVAR(core,savedLoadout), []]) isEqualTo []) then {
				player setVariable [QEGVAR(core,savedLoadout), getUnitLoadout player];
				hint "Kit saved automatically. Will be loaded on respawn.";
			};
		}] call CBA_fnc_addEventHandler;
	} else {
		["ace_arsenal_displayClosed", GVAR(arsenalClosedEH)] call CBA_fnc_removeEventHandler;
	};
};

LOG_FUNC_END;
