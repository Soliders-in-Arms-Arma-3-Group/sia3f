#include "script_component.hpp"

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

if (!hasInterface) exitWith {}; // Exit if not a player.

private _units = (units group player) - [player];
private _safezone = 100;
private _target = objNull;
private _i = 0;

if (count _units < 1) exitWith {
	1 cutText ["Teleport failed, squad is empty!", "PLAIN", -1, true];
	false
};

{
	if (
	((player distance _x) > _safezone) &&	
	(side _x == side player) &&
	isAbleToBreathe _x &&
	simulationEnabled _x &&
	((vehicle _x == _x) || ((vehicle _x) emptyPositions "cargo" > 0))
	) exitWith { _target = _x };
} forEach _units;

if (isNull _target) then {
	1 cutText ["Teleport Failed: No suitable unit found.", "PLAIN DOWN", -1, true];
	false
} else {
	private _str = "Teleporting to " + (name _target) + "...";
	if (vehicle _target != _target) then { _str = _str + "\nVehicle: " + getText (configFile >> "cfgVehicles" >> (typeOf (vehicle _target)) >> "displayName") };
	1 cutText [_str, "PLAIN DOWN", -1, true];
		[{ 0 cutText ["", "BLACK OUT", 1] }, [], 0.5] call CBA_fnc_waitAndExecute;

		//Teleport player 0.3m behind squad
		if (vehicle _target == _target) then {
		_LX = (getPos _target select 0) + (0.3 * sin ((getDir _target) - 180));
		_LY = (getPos _target select 1) + (0.3 * cos ((getDir _target) - 180));
		_LZ = (getPos _target select 2);
		[{ player setPos _this }, [_LX, _LY, _LZ], 1.5] call CBA_fnc_waitAndExecute;
		} else {
			[{ player moveInCargo _this }, (vehicle _target), 1.5] call CBA_fnc_waitAndExecute;	 
		};

		//Teleport effects
		[
			{
				0 cutText ["", "BLACK IN", .5];
				1 cutText ["", "PLAIN", -1, true];
			},
			[],
			2
		] call CBA_fnc_waitAndExecute;
		
	true
};
