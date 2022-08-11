#include "script_component.hpp"
// should behave identically to initPlayerLocal

/* ACE3 Interactions */
private ["_action", "_statement"];

// =======================================================================================
// Player Self Actions 

// SIA Parent Action
_action = ["SIA", " SIA Options", "sia_f\images\sia_tiny.paa", {}, { true }] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToClass;

// Go AFK
if GET_CONFIG(enableGoAFK) then {
	private _action = ["SIA_AFK", "Go AFK", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\wait_ca.paa", { [] spawn sia_f_fnc_goAFK }, { !(player getVariable ["sia_isAFK", false]) }] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "SIA"], _action] call ace_interact_menu_fnc_addActionToClass;
};

// Persistent Hint
_action = ["SIA_Hint", "Show Mission Info", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\unknown_ca.paa", { call sia_f_fnc_hint }, { true }] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "SIA"], _action] call ace_interact_menu_fnc_addActionToClass;

_statement = {
	if (GVAR(showStatusHint)) then {
		GVAR(showStatusHint) = false;
		hint "Persistent Hint is now DISABLED";
	} else {
		GVAR(showStatusHint) = true;
		hint "Persistent Hint is now ENABLED";
	};
};

// Music Control
_action = ["SIA_Hint_Toggle", "Toggle Persistent Hint", "", _statement, { true }] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "SIA", "SIA_Hint"], _action] call ace_interact_menu_fnc_addActionToClass;

_action = ["SIA_MusicStop", "Stop Music", "\A3\Ui_F\Data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_music_OFF_ca.paa", { playMusic "" }, { true }] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "SIA"], _action] call ace_interact_menu_fnc_addActionToClass;

_action = ["SIA_MusicMute", "Mute All Music", "", { 1 fadeMusic 0 }, { musicVolume > 0 }] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "SIA", "SIA_MusicStop"], _action] call ace_interact_menu_fnc_addActionToClass;

_action = ["SIA_MusicUnmute", "Unmute All Music", "", { 1 fadeMusic 0.5 }, { musicVolume <= 0 }] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "SIA", "SIA_MusicStop"], _action] call ace_interact_menu_fnc_addActionToClass;

// =======================================================================================
// Arsenal/Button Actions

// Teleport to Squad
if (!isNil QGVAR(ACEButtons) && GET_CONFIG(enableTPToSquad)) then {
	_action = ["TpSquad", "Teleport to Squad", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\meet_ca.paa", { [_this select 1] spawn sia_f_fnc_teleportToSquad }, { true }] call ace_interact_menu_fnc_createAction;
	{ [_x, 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToObject } forEach sia_f_ACEButtons;
};

// Manage Loadouts
if GET_CONFIG(enableManageKit) then {
	_statement = {
		player setVariable [QGVAR(savedLoadout), getUnitLoadout player];
		hint "Kit saved. Will be loaded on respawn.";
	};
	_action = ["siaKit", "Save/Manage Kit", "\A3\Ui_F\Data\IGUI\Cfg\Actions\gear_ca.paa", _statement, { true }] call ace_interact_menu_fnc_createAction;
	{ [_x, 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToObject; } forEach (GVAR(ACEButtons) + GVAR(arsenals));

	_action = ["SaveKit", "Save Current Kit", "\A3\Ui_F\Data\GUI\Rsc\RscDisplayArcadeMap\icon_save_ca.paa", _statement, { true }] call ace_interact_menu_fnc_createAction;
	{ [_x, 0, ["ACE_MainActions", "siaKit"], _action, true] call ace_interact_menu_fnc_addActionToObject; } forEach (GVAR(ACEButtons) + GVAR(arsenals));

	_action = ["LoadKit", "Load Saved Kit", "\A3\Ui_F\Data\IGUI\Cfg\Actions\reammo_ca.paa", { player setUnitLoadout (player getVariable [QGVAR(savedLoadout), []]); hint "Saved kit loaded." }, { true }] call ace_interact_menu_fnc_createAction;
	{ [_x, 0, ["ACE_MainActions", "siaKit"], _action, true] call ace_interact_menu_fnc_addActionToObject; } forEach (GVAR(ACEButtons) + GVAR(arsenals));

	_action = ["ClearKit", "Remove Saved Kit", "z\ace\addons\arsenal\data\iconClearContainer.paa", { player setVariable [QGVAR(savedLoadout), nil]; hint "Saved kit cleared. Will use kit from death when respawned" }, { true }] call ace_interact_menu_fnc_createAction;
	{ [_x, 0, ["ACE_MainActions", "siaKit"], _action, true] call ace_interact_menu_fnc_addActionToObject; } forEach (GVAR(ACEButtons) + GVAR(arsenals));
};

// Update Loadout Info
if (GET_CONFIG(enableLoadoutInfo) && GET_CONFIG(briefLoadout)) then {
	_action = ["loadoutInfo", "Update Team Loadout Info", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\documents_ca.paa", {
		call FUNC(loadoutNotes);
		[] spawn {
			sleep 0.2; openMap true;
			player selectDiarySubject "Diary";
		};
	}, { !GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "SIA"], _action] call ace_interact_menu_fnc_addActionToClass;
};

// =======================================================================================
// Zeus Actions

// Preop Phases
_action = ["setupPhase", "Set Phase", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa", {}, { !GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;
if ((player getVariable ["role", ""]) == "pltco") then { [(typeOf player), 1, ["ACE_SelfActions", "SIA"], _action] call ace_interact_menu_fnc_addActionToClass; }; // Give plt leader access to phase change.

_action = ["upperbrief", "Upper-level Brief", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\whiteboard_ca.paa", {
	["setupPhase", ["The upper-level brief is commencing!", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\whiteboard_ca.paa"]] remoteExec ["BIS_fnc_showNotification"];
	GVAR(setupPhase) = "Upper-level Briefing";
	publicVariable QGVAR(setupPhase);
}, { !GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions", "setupPhase"], _action] call ace_interact_menu_fnc_addActionToZeus;
[(typeOf player), 1, ["ACE_SelfActions", "SIA", "setupPhase"], _action] call ace_interact_menu_fnc_addActionToClass;

_action = ["lowerbrief", "Lower-level Brief", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\whiteboard_ca.paa", {
	["setupPhase", ["The lower-level brief is commencing!", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\whiteboard_ca.paa"]] remoteExec ["BIS_fnc_showNotification"];
	GVAR(setupPhase) = "Lower-level Briefing";
	publicVariable QGVAR(setupPhase);
}, { !GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions", "setupPhase"], _action] call ace_interact_menu_fnc_addActionToZeus;
[(typeOf player), 1, ["ACE_SelfActions", "SIA", "setupPhase"], _action] call ace_interact_menu_fnc_addActionToClass;

_action = ["kitUp", "Kit Up", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rearm_ca.paa", {
	["setupPhase", ["Time to kit up!", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rearm_ca.paa"]] remoteExec ["BIS_fnc_showNotification"];
	GVAR(setupPhase) = "Kitting Up";
	publicVariable QGVAR(setupPhase);
}, { !GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions", "setupPhase"], _action] call ace_interact_menu_fnc_addActionToZeus;
[(typeOf player), 1, ["ACE_SelfActions", "SIA", "setupPhase"], _action] call ace_interact_menu_fnc_addActionToClass;

_action = ["mountUp", "Mount Up", "\A3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_loadDevice_ca.paa", {
	["setupPhase", ["Time to mount up!", "\A3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_loadDevice_ca.paa"]] remoteExec ["BIS_fnc_showNotification"];
	GVAR(setupPhase) = "Mounting Up";
	publicVariable QGVAR(setupPhase);
}, { !GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions", "setupPhase"], _action] call ace_interact_menu_fnc_addActionToZeus;
[(typeOf player), 1, ["ACE_SelfActions", "SIA", "setupPhase"], _action] call ace_interact_menu_fnc_addActionToClass;

_action = ["standby", "Stand By", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\wait_ca.paa", {
	["setupPhase", ["Stand By", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\wait_ca.paa"]] remoteExec ["BIS_fnc_showNotification"];
	GVAR(setupPhase) = "Standing By";
	publicVariable QGVAR(setupPhase);
}, { !GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions", "setupPhase"], _action] call ace_interact_menu_fnc_addActionToZeus;
[(typeOf player), 1, ["ACE_SelfActions", "SIA", "setupPhase"], _action] call ace_interact_menu_fnc_addActionToClass;

// Start Mission Action + Confirmation
_action = ["missionStart", "Start Mission", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\getin_ca.paa", {}, { !GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;

_action = ["missionStartConfirm", "Confirm", "", { /*[[player], "sia_f\startMission.sqf"] remoteExec ["execVM", 2]*/ }, { !GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction; // To-do: Link to start mission
[["ACE_ZeusActions", "missionStart"], _action] call ace_interact_menu_fnc_addActionToZeus;

// End Mission Action + Confirmation
_action = ["missionEnd", "End Mission", "\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\getOut_ca.paa", {}, { GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;

_action = ["missionEndWin", "Win", "", { /*[[true, (side group player)],"sia_f\endMission.sqf"] remoteExec ["execVM", 2]*/ }, { GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction; // To-do: Link to end mission
[["ACE_ZeusActions", "missionEnd"], _action] call ace_interact_menu_fnc_addActionToZeus;

_action = ["missionEndLose", "Lose", "", { /*[[false, (side group player)],"sia_f\endMission.sqf"] remoteExec ["execVM", 2]*/ }, { GVAR(missionStarted) }] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions", "missionEnd"], _action] call ace_interact_menu_fnc_addActionToZeus;
