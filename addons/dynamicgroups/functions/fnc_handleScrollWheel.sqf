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

private _dZ = _zPos / 10;
private _distanceMax = ((boundingBoxReal player select 0) vectorDistance (boundingBoxReal player select 1)) * 1.5;
private _distanceMin = _distanceMax * 0.15;
private _distance = GVAR(cameraPosition) select 0;

_distance = (_distance - _dZ) max _distanceMin min _distanceMax;
GVAR(cameraPosition) set [0, _distance];

if (_distance >= 1) then {
	private _dirH = GVAR(cameraPosition) # 1;
	private _dX = _dZ * tan (GVAR(camera) getRelDir player); // see https://cdn.discordapp.com/attachments/966070504060489788/1173123086787301427/image.png?ex=6562cf03&is=65505a03&hm=1853d86bb40a22f921c64137ccb89fcfa17c0166b161a248e3a2fcbdd6c69062&

	GVAR(cameraOffset) = GVAR(cameraOffset) - _dX; // shift camera bounds

	// practically identical to fnc_handleMouse LMB case with irrelevant lines removed
	private _centerBox = boundingBoxReal player;
	private _centerSize = (sqrt ([_centerBox select 0 select 0, _centerBox select 0 select 1] distance [_centerBox select 1 select 0, _centerBox select 1 select 1])) / 4; // ToDo: adjust size so that it gets smaller as you zoom in.  Remember to adjust the move camera command value too.
	private _centerSizeBottom = _centerBox select 0 select 2;
	private _centerSizeUp = _centerBox select 1 select 2;

	private _helperPos = GVAR(cameraPosition) # 3;
	
	// this still isn't perfect, but I think good enough once we get the bounds fixed:
	_helperPos = [_helperPos, _dX * _centerSize * 4, _dirH - 90] call BIS_fnc_relPos; // move camera to correct zoom
	_helperPos = [
		[GVAR(cameraOffset) * cos _dirH, -1 * GVAR(cameraOffset) * sin _dirH, (_helperPos select 2) max _centerSizeBottom min _centerSizeUp],
		([GVAR(cameraOffset) * cos _dirH, -1 * GVAR(cameraOffset) * sin _dirH, 0] distance2D _helperPos) min _centerSize,
		[GVAR(cameraOffset) * cos _dirH, -1 * GVAR(cameraOffset) * sin _dirH, 0] getDir _helperPos
	] call BIS_fnc_relPos;

	_helperPos set [2, (_helperPos select 2) max (_centerSizeBottom + 0.2)];

	GVAR(cameraPosition) set [3, _helperPos];
};
