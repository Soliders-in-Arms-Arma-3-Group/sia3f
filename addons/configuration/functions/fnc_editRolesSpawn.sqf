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
 * call sia3f_configuration_fnc_editRolesSpawn
*/

LOG_FUNC_START;
(findDisplay 313) createDisplay QGVAR(editRole);
[0] call FUNC(editRolesRefresh);
LOG_FUNC_END;
