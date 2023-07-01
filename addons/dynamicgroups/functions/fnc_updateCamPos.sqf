#include "script_component.hpp"

/*
 * Author: Karel Moricky, modified by Alganthe (from ace_arsenal_fnc_updateCamPos) and Siege
 * Update camera position
 * 
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_dynamicgroups_fnc_updateCamPos
*/

GVAR(cameraPosition) params ["_distance", "_dirH", "_dirV"];
[GVAR(cameraHelper), [_dirH + 180, - _dirV, 0]] call BIS_fnc_setObjectRotation;
GVAR(cameraHelper) attachTo [player, GVAR(cameraPosition) select 3, ""]; // Reattach for smooth movement

GVAR(camera) setPos (GVAR(cameraHelper) modelToWorld [0, -_distance, 0]);
GVAR(camera) setVectorDirAndUp [vectorDir GVAR(cameraHelper), vectorUp GVAR(cameraHelper)];