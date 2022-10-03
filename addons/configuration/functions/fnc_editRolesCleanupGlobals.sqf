#include "script_component.hpp"

/*
 * Author: Siege
 * Sets all global variables related to the roles GUI to nil.  Should only be done when the edit roles GUI is completely closed.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_editRolesCleanupGlobals
 */

LOG_FUNC_START;
{
	uiNamespace setVariable [_x, nil];
} forEach [
	QGVAR(roles),
	QGVAR(groups),
	QGVAR(editGroupsCurrentMode),
	QGVAR(additionalItems),
	QGVAR(additionalItemsName),
	QGVAR(additionalItemsIsGroup),
	QGVAR(additionalItemsCategory)
];
LOG_FUNC_END;
