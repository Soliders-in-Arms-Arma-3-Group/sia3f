#include "script_component.hpp"

/*
 * Author: McKendrick, Siege
 * Add ace self actions for all players.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_ace_fnc_playerActions
*/

LOG_FUNC_START;

private _parentAction = [QGVAR(siaActions), " SIA Options", QPATHTOEF(core,ui\logo_sia3f_tiny.paa), {}, { true }] call ace_interact_menu_fnc_createAction;
[typeOf player, 1, ["ACE_SelfActions"], _parentAction] call ace_interact_menu_fnc_addActionToClass;

// AFK
if (GET_CONFIG(enableGoAFK,true)) then {
	private _afkAction = [QGVAR(AFK), "Go AFK", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\wait_ca.paa", { [] spawn EFUNC(core,goAFK); }, { !(player getVariable [QEGVAR(core,isAFK), false]) }] call ace_interact_menu_fnc_createAction;
	[typeOf player, 1, ["ACE_SelfActions", QGVAR(siaActions)], _afkAction] call ace_interact_menu_fnc_addActionToClass;
};

// safeStart Hint
private _safeStartAction = [QGVAR(safeStartHint), "Show Mission Info", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\unknown_ca.paa", { call EFUNC(core,hint); }, { true }] call ace_interact_menu_fnc_createAction;
[typeOf player, 1, ["ACE_SelfActions", QGVAR(siaActions)], _safeStartAction] call ace_interact_menu_fnc_addActionToClass;

private _safeStartToggleAction = [QGVAR(safeStartHintToggle), "Toggle Setup Hint", "", {
	if (player getVariable [QEGVAR(core,safeStartHintEnabled), true]) then {
		player setVariable [QEGVAR(core,safeStartHintEnabled), false];
		hint "Setup Hint is now DISABLED";
	} else {
		player setVariable [QEGVAR(core,safeStartHintEnabled), true];
		call EFUNC(core,hint);
		hint "Setup Hint is now ENABLED";
	};
}, { !(missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction;
[typeOf player, 1, ["ACE_SelfActions", QGVAR(siaActions), QGVAR(safeStartHint)], _safeStartToggleAction] call ace_interact_menu_fnc_addActionToClass;

// Music Control
private _musicStopAction = [QGVAR(MusicStop), "Stop Music", "\A3\Ui_F\Data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_music_OFF_ca.paa", { playMusic ""; }, { true }] call ace_interact_menu_fnc_createAction;
private _musicMuteAction = [QGVAR(MusicMute), "Mute All Music", "", { 1 fadeMusic 0; }, { musicVolume > 0 }] call ace_interact_menu_fnc_createAction;
private _musicUnmuteAction = [QGVAR(MusicUnmute), "Unmute All Music", "", { 1 fadeMusic 0.5; }, { musicVolume <= 0 }] call ace_interact_menu_fnc_createAction;

[typeOf player, 1, ["ACE_SelfActions", QGVAR(siaActions)], _musicStopAction] call ace_interact_menu_fnc_addActionToClass;
{ [typeOf player, 1, ["ACE_SelfActions", QGVAR(siaActions), QGVAR(MusicStop)], _x] call ace_interact_menu_fnc_addActionToClass; } forEach [_musicMuteAction, _musicUnmuteAction];

// Update Loadout Info
if (GET_CONFIG(enableLoadoutInfo,true) && GET_CONFIG(briefLoadout,true)) then {
	private _loadoutRefreshAction = [QGVAR(loadoutNotesRefresh), "Update Team Loadout Info", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\documents_ca.paa", {
		call EFUNC(core,loadoutNotes);
		openMap true;
		player selectDiarySubject "Diary";
	}, { !(missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction;
	[typeOf player, 1, ["ACE_SelfActions", QGVAR(siaActions)], _loadoutRefreshAction] call ace_interact_menu_fnc_addActionToClass;
};

// ToDo: Give plt leader access to phase change.

LOG_FUNC_END;
