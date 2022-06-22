#include "script_component.hpp"

/*
 * Author: McKendrick, Siege
 * Add player's radios to inventory.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_acre_fnc_giveRadios
*/

if (!sia_f_acreEnabled || !hasInterface) exitWith {}; // Exit if not player or if ACRE is set to disabled.

private _role = player getVariable ["role", "none"];

private _rolesWithHandheldRadio = ["sql", "tl", "pltco", "pltsgt", "gm", "drone_op", "spotter", "sniper", "medic"];
private _rolesManpackRadio = [];

if !([player, sia_f_personalRadio] call BIS_fnc_hasItem) then { player addItem sia_f_personalRadio };
if (_role in _rolesWithHandheldRadio && !([player, sia_f_handheldRadio] call BIS_fnc_hasItem)) then { player addItem sia_f_handheldRadio };
if (_role in _rolesManpackRadio && !([player, sia_f_manpackRadio] call BIS_fnc_hasItem)) then { player addItem sia_f_manpackRadio };
