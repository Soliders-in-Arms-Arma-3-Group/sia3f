#include "script_component.hpp"

/*
 * Author: Siege
 * Initializes the edit presets GUI.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_editPresetsSpawn
 */

(findDisplay 313) createDisplay QGVAR(editPresets);

// ToDo: fetch and display presets and available roles.
