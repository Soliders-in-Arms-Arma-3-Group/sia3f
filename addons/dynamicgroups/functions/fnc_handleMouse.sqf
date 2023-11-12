#include "script_component.hpp"

/*
 * Author: Karel Moricky, modified by Alganthe (from ace_arsenal_fnc_handleMouse) and Siege
 * Update the camera position and pitch/bank.
 * 
 * Arguments:
 * 1: Mouse area control <CONTROL>
 * 2: Mouse X position <SCALAR>
 * 3: Mouse Y position <SCALAR>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controlNull, 0, 0] call sia3f_dynamicgroups_fnc_handleMouse
*/

params ["_control", "_mouseX", "_mouseY"];
GVAR(cameraPosition) params ["_distance", "_dirH", "_dirV", "_helperPos"];
GVAR(mouseButtonState) params ["_LMB", "_RMB"];

private _centerBox = boundingBoxReal player;
private _centerSize = (sqrt ([_centerBox select 0 select 0, _centerBox select 0 select 1] distance [_centerBox select 1 select 0, _centerBox select 1 select 1])) / 4; // restrict view to third of screen size

if (count _LMB > 0) then {
	_LMB params ["_LMBcursorX", "_LMBcursorY"];
	private _dX = (_mouseX - _LMBcursorX); // ToDo: add camInverted setting, see ace arsenal preInit line 11
	private _dY = (_mouseY -_LMBcursorY);
	GVAR(mouseButtonState) set [0, [_mouseX, _mouseY]];

	private _centerSizeBottom = _centerBox select 0 select 2;
	private _centerSizeUp = _centerBox select 1 select 2;

	_helperPos = [_helperPos, _dX * _centerSize, _dirH - 90] call BIS_fnc_relPos;
	_helperPos = [
		[GVAR(cameraOffset) * cos _dirH, -1 * GVAR(cameraOffset) * sin _dirH, ((_helperPos select 2) - _dY * _centerSize) max _centerSizeBottom min _centerSizeUp],
		([GVAR(cameraOffset) * cos _dirH, -1 * GVAR(cameraOffset) * sin _dirH, 0] distance2D _helperPos) min _centerSize,
		[GVAR(cameraOffset) * cos _dirH, -1 * GVAR(cameraOffset) * sin _dirH, 0] getDir _helperPos
	] call BIS_fnc_relPos;

	_helperPos set [2, (_helperPos select 2) max (_centerSizeBottom + 0.2)];

	GVAR(cameraPosition) set [3, _helperPos];
};

if (count _RMB > 0) then {
	_RMB params ["_RMBcursorX", "_RMBcursorY"];
	private _dX = (_RMBcursorX - _mouseX) * 0.75;
	private _dY = (_RMBcursorY - _mouseY) * 0.75;
	_helperPos = [
		[GVAR(cameraOffset) * cos _dirH, -1 * GVAR(cameraOffset) * sin _dirH, _helperPos select 2],
		([GVAR(cameraOffset) * cos _dirH, -1 * GVAR(cameraOffset) * sin _dirH, 0] distance2D _helperPos) min _centerSize,
		([GVAR(cameraOffset) * cos _dirH, -1 * GVAR(cameraOffset) * sin _dirH, 0] getDir _helperPos) - _dX * 360
	] call BIS_fnc_relPos;

	GVAR(cameraPosition) set [1, (_dirH - _dX * 360)];
	GVAR(cameraPosition) set [2, (_dirV - _dY * 100) max -89 min 89];
	GVAR(cameraPosition) set [3, _helperPos];
	GVAR(mouseButtonState) set [1, [_mouseX,_mouseY]];
};

if (!alive player || isNull player) then {
	(ctrlParent _control) closeDisplay 2;
};
