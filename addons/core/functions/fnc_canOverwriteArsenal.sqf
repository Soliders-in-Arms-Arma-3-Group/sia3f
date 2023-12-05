#include "script_component.hpp"

/*
 * Author: Siege
 * Checks if the overwrite arsenal Zeus Enhanced action is applicable.
 *
 * Arguments:
 * 0: Selected objects <ARRAY of OBJECT>
 *
 * Return Value:
 * True if disable arsenal on respawn is enabled and selected object is a player <BOOLEAN>
 *
 * Example:
 * call sia3f_core_fnc_canOverwriteArsenal
*/

GET_CONFIG(disableArsenalOnRespawn,false) && (_this findIf {alive _x && {_x isKindOf 'CAManBase'}} != -1)
