#include "script_component.hpp"

/*
 * Author: Siege
 * Exports the in-game scoreboard to the RPT log for use with the scoreboardToSheets script.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Generated array in format [name, number of deaths] <ARRAY>
 *
 * Example:
 * call sia3f_core_fnc_exportScoreboard
*/

LOG_FUNC_START;
private _arr = [];

// Cycle through all players for name and death.
{
	_arr pushBack [name _x, (getPlayerScores _x) select 4];
} forEach allPlayers - entities "HeadlessClient_F";

// Print data to server log/console.
// ! - THIS IS TEMP TILL BETTER SOLUTION IS IMPLEMENTED

INFO_1("Scoreboard for %1",getMissionConfigValue ["onLoadName", missionName]);
INFO_1("%1",_arr);
LOG_FUNC_END;

_arr
