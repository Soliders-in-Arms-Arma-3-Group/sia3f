#include "script_component.hpp"
// should behave identically to initPlayerLocal

if (!("@ace" call EFUNC(core,checkModPresence)) || is3DEN) exitWith {};

/* ACE3 Interactions */
private ["_action", "_statement"];
private _buttons = EGVAR(configuration,buttons);
private _arsenals = EGVAR(configuration,arsenals);
private _commonObjects = _buttons;
{
  _commonObjects pushBackUnique _x;
} forEach _arsenals;

// =======================================================================================
// Player Self Actions 

// SIA Parent Action
_action = [QGVAR(siaActions), " SIA Options", QPATHTOEF(core,ui\logo_sia3f_tiny.paa), {}, { true }] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToClass;

// Go AFK
if GET_CONFIG(enableGoAFK,true) then {
	private _action = [QGVAR(AFK), "Go AFK", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\wait_ca.paa", { [] spawn EFUNC(core,goAFK) }, { !(player getVariable [QEGVAR(core,isAFK), false]) }] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", QGVAR(siaActions)], _action] call ace_interact_menu_fnc_addActionToClass;
};

// Setup safeStart Hint
_action = [QGVAR(safeStartHint), "Show Mission Info", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\unknown_ca.paa", { call EFUNC(core,hint) }, { true }] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", QGVAR(siaActions)], _action] call ace_interact_menu_fnc_addActionToClass;

_statement = {
	if (player getVariable [QEGVAR(core,safeStartHintEnabled), true]) then {
		player setVariable [QEGVAR(core,safeStartHintEnabled), false];
		hint "Setup Hint is now DISABLED";
	} else {
		player setVariable [QEGVAR(core,safeStartHintEnabled), true];
		hint "Setup Hint is now ENABLED";
	};
};

_action = [QGVAR(safeStartHintToggle), "Toggle Setup Hint", "", _statement, { !(missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", QGVAR(siaActions), QGVAR(safeStartHint)], _action] call ace_interact_menu_fnc_addActionToClass;

// Music Control
_action = [QGVAR(MusicStop), "Stop Music", "\A3\Ui_F\Data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_music_OFF_ca.paa", { playMusic "" }, { true }] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", QGVAR(siaActions)], _action] call ace_interact_menu_fnc_addActionToClass;

_action = [QGVAR(MusicMute), "Mute All Music", "", { 1 fadeMusic 0 }, { musicVolume > 0 }] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", QGVAR(siaActions), QGVAR(MusicStop)], _action] call ace_interact_menu_fnc_addActionToClass;

_action = [QGVAR(MusicUnmute), "Unmute All Music", "", { 1 fadeMusic 0.5 }, { musicVolume <= 0 }] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", QGVAR(siaActions), QGVAR(MusicStop)], _action] call ace_interact_menu_fnc_addActionToClass;

// =======================================================================================
// Arsenal/Button Actions

// Teleport to Squad
if (!isNil "_buttons" && GET_CONFIG(enableTPToSquad,true)) then {
	_action = [QGVAR(TpSquad), "Teleport to Squad", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\meet_ca.paa", { [] spawn EFUNC(core,teleportToSquad) }, { true }] call ace_interact_menu_fnc_createAction;
	{ [_x, 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToObject } forEach _buttons;
};

// Manage Loadouts
if GET_CONFIG(enableManageKit,true) then {
	
	_statement = {
		player setVariable [QEGVAR(core,savedLoadout), getUnitLoadout player];
		hint "Kit saved. Will be loaded on respawn.";
	};
	
	_action = [QGVAR(kit), "Save/Manage Kit", "\A3\Ui_F\Data\IGUI\Cfg\Actions\gear_ca.paa", _statement, { true }] call ace_interact_menu_fnc_createAction;
	{ [_x, 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToObject; } forEach _commonobjects;

	_action = [QGVAR(kitSave), "Save Current Kit", "\A3\Ui_F\Data\GUI\Rsc\RscDisplayArcadeMap\icon_save_ca.paa", _statement, { true }] call ace_interact_menu_fnc_createAction;
	{ [_x, 0, ["ACE_MainActions", QGVAR(kit)], _action, true] call ace_interact_menu_fnc_addActionToObject; } forEach _commonobjects;

	_action = [QGVAR(kitLoad), "Load Saved Kit", "\A3\Ui_F\Data\IGUI\Cfg\Actions\reammo_ca.paa", { player setUnitLoadout (player getVariable [QEGVAR(core,savedLoadout), []]); hint "Saved kit loaded." }, { true }] call ace_interact_menu_fnc_createAction;
	{ [_x, 0, ["ACE_MainActions", QGVAR(kit)], _action, true] call ace_interact_menu_fnc_addActionToObject; } forEach _commonobjects;

	_action = [QGVAR(kitClear), "Remove Saved Kit", "z\ace\addons\arsenal\data\iconClearContainer.paa", { player setVariable [QEGVAR(core,savedLoadout), nil]; hint "Saved kit cleared. Will use kit from death when respawned" }, { true }] call ace_interact_menu_fnc_createAction;
	{ [_x, 0, ["ACE_MainActions", QGVAR(kit)], _action, true] call ace_interact_menu_fnc_addActionToObject; } forEach _commonobjects;
};

// Update Loadout Info
if (GET_CONFIG(enableLoadoutInfo,true) && GET_CONFIG(briefLoadout,true)) then {
	_action = [QGVAR(loadoutNotesRefresh), "Update Team Loadout Info", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\documents_ca.paa", {
		call EFUNC(core,loadoutNotes);
		[
			{
				openMap true;
				player selectDiarySubject "Diary";
			},
			[],
			0.2
		] call CBA_fnc_waitAndExecute;
	}, { !(missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", QGVAR(siaActions)], _action] call ace_interact_menu_fnc_addActionToClass;
};

// =======================================================================================
// Zeus Actions

// Preop Phases
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

private _phaseActions = [_actionPhaseBriefUpper, _actionPhaseBriefLower, _actionPhaseKit, _actionPhaseMount, _actionPhaseStandby];
[["ACE_ZeusActions"], _actionSetPhase] call ace_interact_menu_fnc_addActionToZeus;
{ [["ACE_ZeusActions", QEGVAR(core,safeStart_phase)], _x] call ace_interact_menu_fnc_addActionToZeus } forEach _phaseActions;

// Give plt leader access to phase change.
if ((player getVariable [QEGVAR(configuration,role), "none"]) == "pltco" ) then {
	[(typeOf player), 1, ["ACE_SelfActions", QGVAR(siaActions)], _actionSetPhase] call ace_interact_menu_fnc_addActionToClass;
	{
		[(typeOf player), 1, ["ACE_SelfActions", QGVAR(siaActions), QEGVAR(core,safeStart_phase)], _x] call ace_interact_menu_fnc_addActionToClass;
	} forEach _phaseActions;
}; 

// Start Mission Action + Confirmation
_action = [QGVAR(safeStart_missionStart), "Start Mission", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\getin_ca.paa", {}, { !(missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;

_action = [QGVAR(safeStart_missionStartConfirm), "Confirm", "", { call EFUNC(core,startMission) }, { !(missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction; // To-do: Link to start mission
[["ACE_ZeusActions", QGVAR(safeStart_missionStart)], _action] call ace_interact_menu_fnc_addActionToZeus;

// End Mission Action + Confirmation
_action = [QGVAR(safeStart_missionEnd), "End Mission", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\getOut_ca.paa", {}, { (missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;

_action = [QGVAR(safeStart_missionEndWin), "Win", "", { ["end1", true, true] remoteExecCall ["BIS_fnc_endMission", 0] }, { (missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction; // To-do: Link to end mission
[["ACE_ZeusActions", QGVAR(safeStart_missionEnd)], _action] call ace_interact_menu_fnc_addActionToZeus;

_action = [QGVAR(safeStart_missionEndLose), "Lose", "", { ["end1", false, true] remoteExecCall ["BIS_fnc_endMission", 0] }, { (missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction; // To-do: Link to end mission
[["ACE_ZeusActions", QGVAR(safeStart_missionEnd)], _action] call ace_interact_menu_fnc_addActionToZeus;
