#include "script_component.hpp"

/*
 * Author: Siege
 * Closes the select role GUI.
 * 
 * Arguments:
 * 0: Arsenal display, unused <DISPLAY>
 * 1: Exit code, 1 is for ok, 2 is for cancel <SCALAR>
 *
 * Return Value:
 * None
 *
 * Example:
 * [displayNull] call sia3f_dynamicgroups_fnc_roleSelectOnLoad
*/

// modified from ace_arsenal_fnc_onArsenalClose by Alganthe

params ["", "_exitCode"];

removeMissionEventHandler ["draw3D", GVAR(camPosUpdateHandle)];

camDestroy GVAR(camera);
deleteVehicle GVAR(cameraHelper);

// ToDo: Save loadout?

// Restore curator camera state
if (!isNull curatorCamera) then {
	GVAR(curatorCameraData) params ["_position", "_dirAndUp"];

	curatorCamera setPosASL _position;
	curatorCamera setVectorDirAndUp _dirAndUp;
};

GVAR(camera) = nil;
GVAR(cameraHelper) = nil;
GVAR(mouseButtonState) = nil;
GVAR(center) = nil;
GVAR(curatorCameraData) = nil;
GVAR(mouseButtonState) = nil;
