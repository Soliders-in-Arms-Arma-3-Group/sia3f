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

private _arr = [];

// Cycle through all players for name and death.
{
	_arr pushBack [name _x, (getPlayerScores _x) select 4];
} forEach allPlayers - entities "HeadlessClient_F";

// Print data to server log/console.
// ! - THIS IS TEMP TILL BETTER SOLUTION IS IMPLEMENTED

diag_log format ["SCOREBOARD FOR %1", sia_f_missionName];
diag_log _arr;
_arr
