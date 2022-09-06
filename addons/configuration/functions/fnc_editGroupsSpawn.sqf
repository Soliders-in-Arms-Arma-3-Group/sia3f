#include "script_component.hpp"

/*
 * Author: Siege
 * Initializes the edit groups GUI.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_editGroupsSpawn
 */

(findDisplay 313) createDisplay QGVAR(editGroups);
[0] call FUNC(editGroupsRefresh);
