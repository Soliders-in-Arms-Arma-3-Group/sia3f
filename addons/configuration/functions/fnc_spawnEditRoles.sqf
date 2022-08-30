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

(findDisplay 313) createDisplay QGVAR(editRole);
[0] call FUNC(refreshEditRolesGUI);
