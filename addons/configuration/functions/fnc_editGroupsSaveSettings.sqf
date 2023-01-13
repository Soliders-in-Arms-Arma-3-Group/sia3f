#include "script_component.hpp"

#define CTRL(idc) ((findDisplay 8504) displayCtrl idc)

/*
 * Author: Siege
 * Save settings of the selected group.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_editGroupsSaveSettings
*/

// todo: check for correct mode

private _lbCtrl = CTRL(1500);
private _index = lbCurSel _lbCtrl;

if (_index == -1) exitWith {
	LOG_FUNC_END_ERROR("no group selected");
};
LOG_FUNC_START;

private _groups = uiNamespace getVariable [QGVAR(roleGroups), createHashMap];
private _group = _lbCtrl lbText _index;

_groups set [_group, [cbChecked CTRL(2801), cbChecked CTRL(2802), cbChecked CTRL(2803), cbChecked CTRL(2804), (_groups get _group) # 4, (_groups get _group) # 5]];
uiNamespace setVariable [QGVAR(roleGroups), _groups];
TRACE_1("new groups value",_groups);
LOG_FUNC_END;
