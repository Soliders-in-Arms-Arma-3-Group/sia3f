#include "script_component.hpp"

/*
 * Author: Siege
 * Updates the Role Editor GUI to reflect changes made when selecting/creating/deleting a role.
 *
 * Arguments:
 * 0: Index of role to be viewed.  Negative numbers will count from the bottom (e.g, -1 is the bottom role) <SCALAR> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_roleChangedEditRoles
*/

params [
	["_index", 0, [0]]
];

private _lbCtrl = (findDisplay 8501) displayCtrl 1500;
