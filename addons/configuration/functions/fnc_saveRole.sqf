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
 * call sia3f_configuration_fnc_saveEditRoles
*/

private _lbCtrl = CTRL(1500);
private _index = lbCurSel _lbCtrl;

if (_index == -1) exitWith {
	// nothing is selected
};

private _hash = GET_CONFIG(roles,createHashMap);
private _role = _lbCtrl lbText _index;

_hash set [_role, [cbChecked CTRL(2801), cbChecked CTRL(2802), cbChecked CTRL(2803), cbChecked CTRL(2804), []]]; // ToDo: additional items update
SET_CONFIG(hiddenConfigValues,roles,_hash);
do3DENAction "MissionSave";
