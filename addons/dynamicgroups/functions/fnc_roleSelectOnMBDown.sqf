#include "script_component.hpp"

/*
 * Author: Josuan Albin, modified by Siege
 * Handle mouse button down event for role select GUI.
 * 
 * Arguments:
 * 1: Button pressed (0 for LMB, 1 for RMB) <SCALAR>
 * 2: Mouse x position <SCALAR>
 * 3: Mouse y position <SCALAR>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1, 0, 0] call sia3f_dynamicgroups_fnc_roleSelectOnMBDown
*/

params ["_buttonPressed", "_xPos", "_yPos"];

GVAR(mouseButtonState) set [_buttonPressed, [_xPos, _yPos]];
