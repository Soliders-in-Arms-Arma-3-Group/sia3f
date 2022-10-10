#include "script_component.hpp"
// should behave identically to initPlayerLocal

if (
	!("@ace" call EFUNC(core,checkModPresence)) ||
	allDisplays isEqualTo [findDisplay 0] ||
	is3DEN ||
	!GET_CONFIG(frameworkInit,false)
) exitWith {};

/* ACE3 Interactions */
private ["_action", "_statement"];
private _buttons = missionNamespace getVariable [QEGVAR(configuration,buttons), []];
private _arsenals = missionNamespace getVariable [QEGVAR(configuration,arsenals), []];
private _commonObjects = +_buttons + _arsenals;
_commonObjects = _commonObjects arrayIntersect _commonObjects;

// Player Self Actions

// SIA Parent Action
_action = [QGVAR(siaActions), " SIA Options", QPATHTOEF(core,ui\logo_sia3f_tiny.paa), {}, { true }] call ace_interact_menu_fnc_createAction;
[typeOf player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToClass;

// Go AFK
if (GET_CONFIG(enableGoAFK,true)) then {
	private _action = [QGVAR(AFK), "Go AFK", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\wait_ca.paa", { [] spawn EFUNC(core,goAFK) }, { !(player getVariable [QEGVAR(core,isAFK), false]) }] call ace_interact_menu_fnc_createAction;
	[typeOf player, 1, ["ACE_SelfActions", QGVAR(siaActions)], _action] call ace_interact_menu_fnc_addActionToClass;
};

// Setup safeStart Hint
_action = [QGVAR(safeStartHint), "Show Mission Info", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\unknown_ca.paa", { call EFUNC(core,hint) }, { true }] call ace_interact_menu_fnc_createAction;
[typeOf player, 1, ["ACE_SelfActions", QGVAR(siaActions)], _action] call ace_interact_menu_fnc_addActionToClass;

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
[typeOf player, 1, ["ACE_SelfActions", QGVAR(siaActions), QGVAR(safeStartHint)], _action] call ace_interact_menu_fnc_addActionToClass;

// Music Control
_action = [QGVAR(MusicStop), "Stop Music", "\A3\Ui_F\Data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_music_OFF_ca.paa", { playMusic "" }, { true }] call ace_interact_menu_fnc_createAction;
[typeOf player, 1, ["ACE_SelfActions", QGVAR(siaActions)], _action] call ace_interact_menu_fnc_addActionToClass;

_action = [QGVAR(MusicMute), "Mute All Music", "", { 1 fadeMusic 0 }, { musicVolume > 0 }] call ace_interact_menu_fnc_createAction;
[typeOf player, 1, ["ACE_SelfActions", QGVAR(siaActions), QGVAR(MusicStop)], _action] call ace_interact_menu_fnc_addActionToClass;

_action = [QGVAR(MusicUnmute), "Unmute All Music", "", { 1 fadeMusic 0.5 }, { musicVolume <= 0 }] call ace_interact_menu_fnc_createAction;
[typeOf player, 1, ["ACE_SelfActions", QGVAR(siaActions), QGVAR(MusicStop)], _action] call ace_interact_menu_fnc_addActionToClass;

// =======================================================================================
// Arsenal/Button Actions

// Teleport to Squad
if (!isNil "_buttons" && GET_CONFIG(enableTPToSquad,true)) then {
	_action = [QGVAR(TpSquad), "Teleport to Squad", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\meet_ca.paa", { [] spawn EFUNC(core,teleportToSquad) }, { true }] call ace_interact_menu_fnc_createAction;
	{ [_x, 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToObject } forEach _buttons;
};

[_commonObjects] call FUNC(commonObjectActions);

// Update Loadout Info
if (GET_CONFIG(enableLoadoutInfo,true) && GET_CONFIG(briefLoadout,true)) then {
	_action = [QGVAR(loadoutNotesRefresh), "Update Team Loadout Info", "\A3\Ui_F\Data\IGUI\Cfg\simpleTasks\types\documents_ca.paa", {
		call EFUNC(core,loadoutNotes);
		openMap true;
		player selectDiarySubject "Diary";
	}, { !(missionNamespace getVariable [QEGVAR(core,missionStarted), false]) }] call ace_interact_menu_fnc_createAction;
	[typeOf player, 1, ["ACE_SelfActions", QGVAR(siaActions)], _action] call ace_interact_menu_fnc_addActionToClass;
};

// ToDo: Give plt leader access to phase change.
