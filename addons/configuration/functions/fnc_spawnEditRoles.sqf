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

private _display = (findDisplay 313) createDisplay QGVAR(editRole);
private _lbCtrl = _display displayCtrl 1500;

[0] call FUNC(refreshEditRolesGUI);
