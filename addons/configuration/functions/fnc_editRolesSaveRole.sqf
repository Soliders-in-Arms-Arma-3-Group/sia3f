#include "script_component.hpp"

#define CTRL(idc) ((findDisplay 8501) displayCtrl idc)

/*
 * Author: Siege
 * Save settings of the selected role.
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
	LOG_FUNC_END_ERROR("no role selected");
};
LOG_FUNC_START;

private _roles = uiNamespace getVariable [QGVAR(roles), createHashMap];
private _role = _lbCtrl lbText _index;

_roles set [_role, [cbChecked CTRL(2801), cbChecked CTRL(2802), cbChecked CTRL(2803), cbChecked CTRL(2804), (_roles get _role) # 4, (_roles get _role) # 5]];
uiNamespace setVariable [QGVAR(roles), _roles];
TRACE_1("new roles value",_roles);
LOG_FUNC_END;
