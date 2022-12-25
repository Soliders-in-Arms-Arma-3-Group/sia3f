#include "script_component.hpp"

/*
 * Author: McKendrick, Siege
 * Add ace actions for zeus(es)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_ace_fnc_zeusActions
*/

LOG_FUNC_START;

// Pre-OP Phases
private _actionSetPhase = [QEGVAR(core,safeStart_phase), "Set Phase", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa", {}, { !(missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction;

private _actionPhaseBriefUpper = [QGVAR(safeStart_phaseBriefUpper), "Upper-level Brief", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\whiteboard_ca.paa", {
	[QEGVAR(core,safeStart_phase), ["The upper-level brief is commencing!", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\whiteboard_ca.paa"]] remoteExec ["BIS_fnc_showNotification"];
	missionNamespace setVariable [QEGVAR(core,safeStart_phase), "Upper-level Briefing", true];	
}, { !(missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction;

private _actionPhaseBriefLower = [QGVAR(safeStart_phaseBriefLower), "Lower-level Brief", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\whiteboard_ca.paa", {
	[QEGVAR(core,safeStart_phase), ["The lower-level brief is commencing!", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\whiteboard_ca.paa"]] remoteExec ["BIS_fnc_showNotification"];
	missionNamespace setVariable [QEGVAR(core,safeStart_phase), "Lower-level Briefing", true];
}, { !(missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction;

private _actionPhaseKit = [QGVAR(safeStart_phaseKit), "Kit Up", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rearm_ca.paa", {
	[QEGVAR(core,safeStart_phase), ["Time to kit up!", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rearm_ca.paa"]] remoteExec ["BIS_fnc_showNotification"];
	missionNamespace setVariable [QEGVAR(core,safeStart_phase), "Kitting Up", true];
}, { !(missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction;

private _actionPhaseMount = [QGVAR(safeStart_phaseMount), "Mount Up", "\A3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_loadDevice_ca.paa", {
	[QEGVAR(core,safeStart_phase), ["Time to mount up!", "\A3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_loadDevice_ca.paa"]] remoteExec ["BIS_fnc_showNotification"];
	missionNamespace setVariable [QEGVAR(core,safeStart_phase), "Mounting Up", true];
}, { !(missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction;

private _actionPhaseStandby = [QGVAR(safeStart_phaseStandby), "Stand By", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\wait_ca.paa", {
	[QEGVAR(core,safeStart_phase), ["Stand By", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\wait_ca.paa"]] remoteExec ["BIS_fnc_showNotification"];
	missionNamespace setVariable [QEGVAR(core,safeStart_phase), "Standing By", true];
}, { !(missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions"], _actionSetPhase] call ace_interact_menu_fnc_addActionToZeus;
{ [["ACE_ZeusActions", QEGVAR(core,safeStart_phase)], _x] call ace_interact_menu_fnc_addActionToZeus; } forEach [_actionPhaseBriefUpper, _actionPhaseBriefLower, _actionPhaseKit, _actionPhaseMount, _actionPhaseStandby];

// Start Mission Action + Confirmation
private _actionMissionStart = [QGVAR(safeStart_missionStart), "Start Mission", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\getin_ca.paa", {}, { !(missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction;
private _actionConfirm = [QGVAR(safeStart_missionStartConfirm), "Confirm", "", { remoteExecCall [EFUNC(core,startMission)]; }, { !(missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions"], _actionMissionStart] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", QGVAR(safeStart_missionStart)], _actionConfirm] call ace_interact_menu_fnc_addActionToZeus;

// End Mission Action + Confirmation
private _actionMissionEnd = [QGVAR(safeStart_missionEnd), "End Mission", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\getOut_ca.paa", {}, { (missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction;
private _actionEndWin = [QGVAR(safeStart_missionEndWin), "Win", "", { ["end1", true, true] remoteExecCall ["BIS_fnc_endMission"]; }, { (missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction;
private _actionEndLose = [QGVAR(safeStart_missionEndLose), "Lose", "", { ["end1", false, true] remoteExecCall ["BIS_fnc_endMission"]; }, { (missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions"], _actionMissionEnd] call ace_interact_menu_fnc_addActionToZeus;
{ [["ACE_ZeusActions", QGVAR(safeStart_missionEnd)], _x] call ace_interact_menu_fnc_addActionToZeus } forEach [_actionEndWin, _actionEndLose];

LOG_FUNC_END;
