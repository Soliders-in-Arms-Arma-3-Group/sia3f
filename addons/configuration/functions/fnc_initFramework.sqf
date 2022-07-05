#include "script_component.hpp"

#define ADD_OBJ _addedEntities pushBack create3DENEntity
#define SET_CONFIG(var,value) QGVAR(frameworkSettings) set3DENMissionAttributes [QGVAR(var), value];

/*
 * Author: Siege
 * Creates all objects, modules, etc. for a standard mission and sets all config values to their defaults.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_initFramework
*/

private _startPos = screenToWorld [0.5, 0.5]; // AGL position (z = 0) at the center of the player's screen
private _layer = -1 add3DENLayer "SIA Mission Framework Template";
private _addedEntities = [];

ADD_OBJ ["Object", "B_Soldier_F", _startPos];

{ _x set3DENLayer _layer; } forEach _addedEntities;

SET_CONFIG(enableTPMenu,true);
