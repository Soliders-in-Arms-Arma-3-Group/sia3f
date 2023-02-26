#include "script_component.hpp"

/*
 * Author: Josuan Albin, modified by Siege
 * Handle mouse button up event for role select GUI.
 * 
 * Arguments:
 * 1: Button pressed (0 for LMB, 1 for RMB) <SCALAR>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call sia3f_dynamicgroups_fnc_roleSelectOnMBUp
*/

params ["_buttonPressed"];

GVAR(mouseButtonState) set [_buttonPressed, []];
