#include "script_component.hpp"
// should behave identically to initPlayerLocal

/* ACE3 Interactions */
private ["_action", "_statement"];

// =======================================================================================
// Player Self Actions 

// SIA Parent Action
_action = [QGVAR(siaActions), " SIA Options", "sia_f\images\sia_tiny.paa", {}, { true }] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToClass;

// Go AFK
if GET_CONFIG(enableGoAFK,true) then {
	private _action = ["SIA_AFK", "Go AFK", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\wait_ca.paa", { [] spawn sia_f_fnc_goAFK }, { !(player getVariable [QGVAR(isAFK), false]) }] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", QGVAR(siaActions)], _action] call ace_interact_menu_fnc_addActionToClass;
};

// Setup safeStart Hint
_action = [QGVAR(safeStartHint), "Show Mission Info", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\unknown_ca.paa", { call sia_f_fnc_hint }, { true }] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", QGVAR(siaActions)], _action] call ace_interact_menu_fnc_addActionToClass;

_statement = {
	if (GVAR(safeStartHintEnabled)) then {
		GVAR(safeStartHintEnabled) = false;
		hint "Setup Hint is now DISABLED";
	} else {
		GVAR(safeStartHintEnabled) = true;
		hint "Setup Hint is now ENABLED";
	};
};

_action = [QGVAR(safeStartHintToggle), "Toggle Setup Hint", "", _statement, { true }] call ace_interact_menu_fnc_createAction;
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
if (!isNil QGVAR(ACEButtons) && GET_CONFIG(enableTPToSquad,true)) then {
	_action = ["TpSquad", "Teleport to Squad", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\meet_ca.paa", { [_this select 1] spawn sia_f_fnc_teleportToSquad }, { true }] call ace_interact_menu_fnc_createAction;
	{ [_x, 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToObject } forEach sia_f_ACEButtons;
};

// Manage Loadouts
if GET_CONFIG(enableManageKit,true) then {
	_statement = {
		player setVariable [QGVAR(savedLoadout), getUnitLoadout player];
		hint "Kit saved. Will be loaded on respawn.";
	};
	_action = [QGVAR(kit), "Save/Manage Kit", "\A3\Ui_F\Data\IGUI\Cfg\Actions\gear_ca.paa", _statement, { true }] call ace_interact_menu_fnc_createAction;
	{ [_x, 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToObject; } forEach (GVAR(ACEButtons) + GVAR(arsenals));

	_action = [QGVAR(kitSave), "Save Current Kit", "\A3\Ui_F\Data\GUI\Rsc\RscDisplayArcadeMap\icon_save_ca.paa", _statement, { true }] call ace_interact_menu_fnc_createAction;
	{ [_x, 0, ["ACE_MainActions", QGVAR(kit)], _action, true] call ace_interact_menu_fnc_addActionToObject; } forEach (GVAR(ACEButtons) + GVAR(arsenals));

	_action = [QGVAR(kitLoad), "Load Saved Kit", "\A3\Ui_F\Data\IGUI\Cfg\Actions\reammo_ca.paa", { player setUnitLoadout (player getVariable [QGVAR(savedLoadout), []]); hint "Saved kit loaded." }, { true }] call ace_interact_menu_fnc_createAction;
	{ [_x, 0, ["ACE_MainActions", QGVAR(kit)], _action, true] call ace_interact_menu_fnc_addActionToObject; } forEach (GVAR(ACEButtons) + GVAR(arsenals));

	_action = [QGVAR(kitClear), "Remove Saved Kit", "z\ace\addons\arsenal\data\iconClearContainer.paa", { player setVariable [QGVAR(savedLoadout), nil]; hint "Saved kit cleared. Will use kit from death when respawned" }, { true }] call ace_interact_menu_fnc_createAction;
	{ [_x, 0, ["ACE_MainActions", QGVAR(kit)], _action, true] call ace_interact_menu_fnc_addActionToObject; } forEach (GVAR(ACEButtons) + GVAR(arsenals));
};

// Update Loadout Info
if (GET_CONFIG(enableLoadoutInfo,true) && GET_CONFIG(briefLoadout,true)) then {
	_action = [QGVAR(loadoutNotesRefresh), "Update Team Loadout Info", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\documents_ca.paa", {
		call FUNC(loadoutNotes);
		[] spawn {
			sleep 0.2; openMap true;
			player selectDiarySubject "Diary";
		};
	}, { !GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", QGVAR(siaActions)], _action] call ace_interact_menu_fnc_addActionToClass;
};

// =======================================================================================
// Zeus Actions

// Preop Phases
_action = [QGVAR(safeStart_phase), "Set Phase", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa", {}, { !GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;
if ((player getVariable ["role", ""]) == "pltco") then { [(typeOf player), 1, ["ACE_SelfActions", QGVAR(siaActions)], _action] call ace_interact_menu_fnc_addActionToClass; }; // Give plt leader access to phase change.

_action = [QGVAR(safeStart_phaseBriefUpper), "Upper-level Brief", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\whiteboard_ca.paa", {
	[QGVAR(safeStart_phase), ["The upper-level brief is commencing!", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\whiteboard_ca.paa"]] remoteExec ["BIS_fnc_showNotification"];
	
	missionNamespace setVariable [QGVAR(safeStart_phase), "Upper-level Briefing", true];
	
}, { !GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions", QGVAR(safeStart_phase)], _action] call ace_interact_menu_fnc_addActionToZeus;
[(typeOf player), 1, ["ACE_SelfActions", QGVAR(siaActions), QGVAR(safeStart_phase)], _action] call ace_interact_menu_fnc_addActionToClass;

_action = [QGVAR(safeStart_phaseBriefLower), "Lower-level Brief", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\whiteboard_ca.paa", {
	[QGVAR(safeStart_phase), ["The lower-level brief is commencing!", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\whiteboard_ca.paa"]] remoteExec ["BIS_fnc_showNotification"];
	missionNamespace setVariable [QGVAR(safeStart_phase), "Lower-level Briefing", true];
}, { !GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions", QGVAR(safeStart_phase)], _action] call ace_interact_menu_fnc_addActionToZeus;
[(typeOf player), 1, ["ACE_SelfActions", QGVAR(siaActions), QGVAR(safeStart_phase)], _action] call ace_interact_menu_fnc_addActionToClass;

_action = [QGVAR(safeStart_phaseKit), "Kit Up", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rearm_ca.paa", {
	[QGVAR(safeStart_phase), ["Time to kit up!", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rearm_ca.paa"]] remoteExec ["BIS_fnc_showNotification"];
	missionNamespace setVariable [QGVAR(safeStart_phase), "Kitting Up", true];
}, { !GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions", QGVAR(safeStart_phase)], _action] call ace_interact_menu_fnc_addActionToZeus;
[(typeOf player), 1, ["ACE_SelfActions", QGVAR(siaActions), QGVAR(safeStart_phase)], _action] call ace_interact_menu_fnc_addActionToClass;

_action = [QGVAR(safeStart_phaseMount), "Mount Up", "\A3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_loadDevice_ca.paa", {
	[QGVAR(safeStart_phase), ["Time to mount up!", "\A3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_loadDevice_ca.paa"]] remoteExec ["BIS_fnc_showNotification"];
	missionNamespace setVariable [QGVAR(safeStart_phase), "Mounting Up", true];
}, { !GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions", QGVAR(safeStart_phase)], _action] call ace_interact_menu_fnc_addActionToZeus;
[(typeOf player), 1, ["ACE_SelfActions", QGVAR(siaActions), QGVAR(safeStart_phase)], _action] call ace_interact_menu_fnc_addActionToClass;

_action = [QGVAR(safeStart_phaseStandby), "Stand By", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\wait_ca.paa", {
	[QGVAR(safeStart_phase), ["Stand By", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\wait_ca.paa"]] remoteExec ["BIS_fnc_showNotification"];
	missionNamespace setVariable [QGVAR(safeStart_phase), "Standing By", true];
}, { !GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions", QGVAR(safeStart_phase)], _action] call ace_interact_menu_fnc_addActionToZeus;
[(typeOf player), 1, ["ACE_SelfActions", QGVAR(siaActions), QGVAR(safeStart_phase)], _action] call ace_interact_menu_fnc_addActionToClass;


// Start Mission Action + Confirmation
_action = [QGVAR(safeStart_missionStart), "Start Mission", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\getin_ca.paa", {}, { !GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;

_action = [QGVAR(safeStart_missionStartConfirm), "Confirm", "", {}, { !GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction; // To-do: Link to start mission
[["ACE_ZeusActions", QGVAR(safeStart_missionStart)], _action] call ace_interact_menu_fnc_addActionToZeus;

// End Mission Action + Confirmation
_action = [QGVAR(safeStart_missionEnd), "End Mission", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\getOut_ca.paa", {}, { GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;

_action = [QGVAR(safeStart_missionEndWin), "Win", "", {}, { GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction; // To-do: Link to end mission
[["ACE_ZeusActions", QGVAR(safeStart_missionEnd)], _action] call ace_interact_menu_fnc_addActionToZeus;

_action = [QGVAR(safeStart_missionEndLose), "Lose", "", {}, { GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction; // To-do: Link to end mission
[["ACE_ZeusActions", QGVAR(safeStart_missionEnd)], _action] call ace_interact_menu_fnc_addActionToZeus;
