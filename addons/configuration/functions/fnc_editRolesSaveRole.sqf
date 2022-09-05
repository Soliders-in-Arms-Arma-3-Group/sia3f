#include "script_component.hpp"

#define CTRL(idc) ((findDisplay 8501) displayCtrl idc)

/*
 * Author: Siege
 * Save settings of the selected role.  Called when the user clicks "ok", but does not close the display.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_editRolesSaveRole
*/

private _lbCtrl = CTRL(1500);
private _index = lbCurSel _lbCtrl;

if (_index == -1) exitWith {
	// nothing is selected
};

private _roles = uiNamespace getVariable [QGVAR(roles), createHashMap];
private _role = _lbCtrl lbText _index;

_roles set [_role, [cbChecked CTRL(2801), cbChecked CTRL(2802), cbChecked CTRL(2803), cbChecked CTRL(2804), []]];
uiNamespace setVariable [QGVAR(roles), _roles];
