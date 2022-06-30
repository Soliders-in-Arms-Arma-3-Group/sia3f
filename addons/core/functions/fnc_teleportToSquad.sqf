#include "script_component.hpp"

/*
 * Author: McKendrick
 * Teleports the player to any possible member of their group, starting with their leader.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * spawn sia3f_core_fnc_teleportToSquad
*/

if (!hasInterface) exitWith {}; // Exit if not a player.

private _clearText = { //Clears any text;
	sleep 1.5;
	1 cutText ["","PLAIN",-1,true];
};

private _sl = leader player;	
private _i = 0;
private _safezone = 150;

if (count (units group player) <= 1) exitWith {
	1 cutText ["Teleport failed, squad is empty!", "PLAIN", -1, true];
	[] spawn _clearText;
};

//Searches squad for another player not in the safezone
while { player == _sl || ((_sl distance player) < _safezone) } do {
	if (_i >= (count units group player)) exitWith {
		1 cutText ["Teleport failed, squad is in safezone", "PLAIN", -1, true];
		_sl = player;
	};
	_sl =  (units group player) select _i;
	_i = _i + 1;
};

if (player == _sl) exitWith { [] spawn _clearText }; //Checks if the search for another player worked

//Check if sl is on foot
if (vehicle _sl == _sl) then {
	//Teleport effects
	1 cutText ["Teleporting...", "PLAIN", -1, true];
	sleep 0.5;
	2 cutText ["", "BLACK OUT", 1];
	sleep 1;

	//Teleport player 0.3m behind squad
	_LX = (getPos _sl select 0) + (0.3 * sin ((getDir _sl) - 180));
	_LY = (getPos _sl select 1) + (0.3 * cos ((getDir _sl) - 180));
	_LZ = (getPos _sl select 2);
	player setPos [_LX, _LY, _LZ];

	//Teleport effects
	sleep 0.5;
	2 cutText ["", "BLACK IN", .5];
	1 cutText ["", "PLAIN", -1, true];
} else {
	//Move into vehicle, or print vehicle is full
	if ((vehicle _sl) emptyPositions "cargo" == 0) then {
		1 cutText ["Teleport failed\nNo room in the squad's vehicle!", "PLAIN", -1, true];
	} else {
		//Teleport effects
		1 cutText ["Teleporting...", "PLAIN", -1, true];
		sleep 0.5;
		2 cutText ["", "BLACK OUT", 1];
		sleep 1;

		player moveInCargo vehicle _sl;

		//Teleport effects
		sleep 0.5;
		2 cutText ["", "BLACK IN", .5];
		1 cutText ["","PLAIN",-1,true];
	};
};

sleep 1.5;
1 cutText ["","PLAIN",-1,true];
