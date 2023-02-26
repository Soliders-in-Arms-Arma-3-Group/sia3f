#include "script_component.hpp"

/*
 * Author: Alganthe (from ace_arsenal_fnc_handleMouse), modified by Siege
 * Handle the mouse wheel for zoom
 * 
 * Arguments:
 * 1: Mouse wheel Z position <SCALAR>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call sia3f_dynamicgroups_fnc_handleScrollWheel
*/

params ["_zPos"];

private _distanceMax = ((boundingBoxReal player select 0) vectorDistance (boundingBoxReal player select 1)) * 1.5;
private _distanceMin = _distanceMax * 0.15;
private _distance = GVAR(cameraPosition) select 0;

_distance = (_distance - (_zPos / 10)) max _distanceMin min _distanceMax;
GVAR(cameraPosition) set [0, _distance];
