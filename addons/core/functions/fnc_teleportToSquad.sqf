#include "script_component.hpp"

#define SAFEZONE 100

/*
 * Author: McKendrick
 * Teleports the player to any possible member of their group, starting with their leader.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Whether the teleport was successful <BOOLEAN>
 *
 * Example:
 * spawn sia3f_core_fnc_teleportToSquad
*/

if (!hasInterface) exitWith {
	LOG_FUNC_END_ERROR("function ran on server");
}; // Exit if not a player.
LOG_FUNC_START;

private _units = (units group player) - [player];
private _target = objNull;

if (count _units < 1) exitWith {
	1 cutText ["Teleport failed, squad is empty!", "PLAIN", -1, true];
	LOG_FUNC_END_ERROR("empty squad");
	false
};

{
	if (
		(player distance _x) > SAFEZONE && // more than 100 meters away
		side _x == side player && // same side
		isAbleToBreathe _x && // not underwater
		simulationEnabled _x && // not AFK
		((vehicle _x == _x) || ((vehicle _x) emptyPositions "cargo" > 0)) // if player is in a vehicle, there are empty positions
	) exitWith { _target = _x; };
} forEach _units;

if (isNull _target) then {
	1 cutText ["Teleport Failed: No suitable unit found.", "PLAIN DOWN", -1, true];
	LOG_FUNC_END_ERROR("found no suitable target");
	false
} else {
	private _str = "Teleporting to " + (name _target) + "...";
	if (vehicle _target != _target) then { _str = _str + "\nVehicle: " + getText (configFile >> "cfgVehicles" >> (typeOf (vehicle _target)) >> "displayName"); };
	1 cutText [_str, "PLAIN DOWN", -1, true];
	[{ 0 cutText ["", "BLACK OUT", 1] }, [], 0.5] call CBA_fnc_waitAndExecute;

	//Teleport player 0.3m behind squad
	if (vehicle _target == _target) then {
		_LX = (getPos _target select 0) + (0.3 * sin ((getDir _target) - 180));
		_LY = (getPos _target select 1) + (0.3 * cos ((getDir _target) - 180));
		_LZ = (getPos _target select 2);
		[{ player setPos _this }, [_LX, _LY, _LZ], 2.5] call CBA_fnc_waitAndExecute;
	} else {
		[{ player moveInCargo _this }, (vehicle _target), 2.5] call CBA_fnc_waitAndExecute;	 
	};

	//Teleport effects
	[
		{
			0 cutText ["", "BLACK IN", .5];
			1 cutText ["", "PLAIN", -1, true];
		},
		[],
		3
	] call CBA_fnc_waitAndExecute;

	TRACE_1("teleport target",name _target);
	
	true
};

LOG_FUNC_END;
