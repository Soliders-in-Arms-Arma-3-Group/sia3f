#include "script_component.hpp"

/*
 * Author: Siege
 * Creates the Role Editor GUI.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_spawnEditRoles
*/

private _display = (findDisplay 313) createDisplay "sia3f_configuration_editRole";
private _lbCtrl = _display displayCtrl 1500;

{
	_lbCtrl lbAdd _x;
	// ToDo: load role settings
} forEach GVAR(roles);
