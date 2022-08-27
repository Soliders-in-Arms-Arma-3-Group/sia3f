#include "script_component.hpp"

/*
 * Author: Siege
 * Updates the Role Editor GUI to reflect changes made when selecting/creating/deleting a role.
 *
 * Arguments:
 * 0: Index of role to be viewed.  Negative numbers will count from the bottom (e.g, -1 is the bottom role) <SCALAR> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_roleChangedEditRoles
*/

params [
	["_index", 0, [0]]
];

if (floor _index != _index) exitWith {
	// error, index must be an integer
};

private _lbCtrl = (findDisplay 8501) displayCtrl 1500;

lbClear _lbCtrl;
{
	_lbCtrl lbAdd _x;
	// systemChat str _y;
} forEach GET_CONFIG(roles,createHashMap);
lbSort _lbCtrl;

if (_index < 0) then {
	_index = lbSize _lbCtrl + _index;
};
_lbCtrl lbSetCurSel _index; // ToDo: find a way to select the new index without firing the 'onLbSelChanged' event handler, like lbSetCurSel does.
