#include "script_component.hpp"

/*
 * Author: Siege
 * Creates the Role Creator GUI.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_spawnCreateRoles
*/

private _display = (findDisplay 313) createDisplay QGVAR(createRole);
private _lbCtrl = _display displayCtrl 1500;

{
	_lbCtrl lbAdd _x;
} forEach GVAR(roles);
