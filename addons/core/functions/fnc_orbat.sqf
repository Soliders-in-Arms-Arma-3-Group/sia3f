#include "script_component.hpp"

#define HEX_PINK "#FEAAAA"
#define HEX_RED "#B21A00"
#define HEX_GREEN "#AAFEAA"
#define HEX_BLUE "#AAAAFE"
#define HEX_YELLOW "#FEFEAA"
#define HEX_WHITE "#FFFFFF"
#define HEX_KOROMIKO "#FFB84C" // yellow/orange color

/*
 * Author: McKendrick
 * Adds "ORBAT" tab to briefing that displays a list of players by their squad and roles.  Execute locally.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_core_fnc_orbat
*/

if (!hasInterface || !GET_CONFIG(briefOrbat)) exitWith {}; // Exit if not a player.

if (!isNil QGVAR(orbat)) then { player removeDiaryRecord ["Diary", GVAR(orbat)] }; // If diary entry already exists, then erase it.

// Create array with all player groups matching the player's side
private _allGroupsWithPlayers = [];
{
	if (side _x == side player) then {
		_allGroupsWithPlayers pushBackUnique group _x;
	};
} forEach (call BIS_fnc_listPlayers);

_allGroupsWithPlayers = [_allGroupsWithPlayers, [], { groupId _x }] call BIS_fnc_sortBy; // Sort array by group call signs in alphabetical order

private _contentArr = [];
{
	private _sideColor = [side _x] call BIS_fnc_sideColor; // Get RGBA color value of group's side.
	_sideColor = (_sideColor apply { _x * 2 }) call BIS_fnc_colorRGBAtoHTML; // Brighten the color and convert it to HEX/HTML.
	_contentArr append [format ["<font face='PuristaMedium' size='16' color='%2'>%1</font>", groupId _x, _sideColor], "<br />"]; // Format group call sign with side color.

	{
		private _role = roleDescription _x;
		if (_role == "") then { // If roleDescription is set, then truncate. Else use config name.
			_role = (getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName"));
		} else {
			_role = (_role splitString "@") select 0;
		};

		private _roleColor = if (_x == player) then [{ HEX_RED }, { HEX_WHITE }]; // Set color of player's name to red

		private _teamColor = HEX_KOROMIKO; // If unit not in player's group, then set color to Koromiko

		// Get unit's team and associated color
		if (group _x == group player) then {
			_teamColor = switch (assignedTeam _x) do {
				case "RED": { HEX_PINK };
				case "GREEN": { HEX_GREEN };
				case "BLUE": { HEX_BLUE };
				case "YELLOW": { HEX_YELLOW };
				default { HEX_WHITE };
			};
		};

		private _rankIcon = format ["<img color='%1' image='\A3\Ui_F\Data\GUI\Cfg\Ranks\" + (rank _x) + "_gs.paa' width='15' height='15'/>", _teamColor]; // Get icon of units' rank from config.
		private _roleIcon = format ["<img color='%1' image='\A3\Ui_F\Data\Map\VehicleIcons\" + (getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "icon")) + "_ca.paa' width='15' height='15'/>", _teamColor]; // Get icon of units' role from config.
		_contentArr append [
			"  ",
			_roleIcon,
			"  ",
			format ["<font color='%2' face='%3'>%1: </font>", _role, _roleColor, 'PuristaBold'],
			format ["<font  color='%2' face='%3'>%1</font>", (name _x), _teamColor, 'PuristaLight'],
			"  ",
			_rankIcon,
			"  <br />"
		]; // Combine images, role, and name into one string.
	} forEach ([leader _x] + (units _x - [leader _x])); // Do for all units in group, starting with the group lead.
	_contentArr pushBack "<br />"; // Add extra line break after each group.
} forEach _allGroupsWithPlayers;

private _content = _contentArr joinString "";
GVAR(orbat) = player createDiaryRecord ["Diary", ["ORBAT", "<execute expression='call " + QFUNC(orbat) + ";'>Refresh</execute><br></br><br></br>" + _content]]; // Add ORBAT text to diary along with "Refresh" button.
