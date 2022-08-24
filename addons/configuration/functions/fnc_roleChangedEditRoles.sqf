#include "script_component.hpp"

/*
 * Author: Siege
 * Changes the currently selected role in the Edit Roles GUI and updates all settings.
 *
 * Arguments:
 * 0: Control of the listbox <CONTROL>
 * 1: Index of the selected item <SCALAR>
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_roleChangedEditRoles
*/

params ["_lbCtrl", "_index"];
