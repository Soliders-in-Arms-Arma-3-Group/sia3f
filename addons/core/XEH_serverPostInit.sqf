#include "script_component.hpp"

// basically initServer.sqf

GVAR(startTime) = date;
setTimeMultiplier 0.1;

missionNamespace setVariable [QGVAR(safeStart_phase), "Waiting", true];
missionNamespace setVariable [QGVAR(missionStarted), false, true];

if (!isNil QEGVAR(configuration,arsenals)) then {
	publicVariable QEGVAR(configuration,arsenals);

	// === Setup Global Arsenal ===

	/* Likely unecessary data type check. */
	//if (EGVAR(configuration,arsenals) isEqualTo []) then { ["setupGlobalArsenal Error: Invalid Parameters: %1", _this select 0] call BIS_fnc_error }

	// Add basic items.
	if (EGVAR(configuration,haveBasics)) then {
		/* To-do: learn a way to allow end-user to modify data below */
		private _arr = ["ACE_fieldDressing","ACE_elasticBandage","ACE_packingBandage","ACE_quikclot","ACE_bloodIV","ACE_bloodIV_250","ACE_bloodIV_500","ACE_CableTie","ACE_Chemlight_Shield","ACE_EarPlugs","ACE_epinephrine","ACE_MapTools","ACE_morphine","ACE_RangeCard","ACE_splint","ACE_tourniquet","ACE_surgicalKit","ACE_salineIV","ACE_salineIV_250","ACE_salineIV_500","ToolKit","ACE_artilleryTable","Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow","ItemWatch","ItemCompass","ItemMap","ACE_Canteen","ACE_WaterBottle"];
		{ [_x, _arr, true] call ace_arsenal_fnc_addVirtualItems } forEach EGVAR(configuration,arsenals);
	};

	// Add ACRE radio items.
	if (EGVAR(configuration,acreEnabled)) then {
		{
			private _acreRadios = ([] call acre_api_fnc_getAllRadios) select 0;
			if (_x != "NONE") then {
				private _y = _x;
				if (_x in _acreRadios) then {
					{ [_x, [_y], true] call ace_arsenal_fnc_addVirtualItems } forEach EGVAR(configuration,arsenals);
				} else {
					["setupGlobalArsenal Error: Radio type - Invalid option: %1", _x] call BIS_fnc_error; // Log error if wrong input given.
				};
			};
		} forEach [GVAR(personalRadio), GVAR(handheldRadio), GVAR(manpackRadio)];
	};

	// Add cTab items.
	if (sia_f_haveCTab) then {
		private _arr = ["ItemMicroDAGR","ItemcTabHCam","ItemAndroid","ItemcTab"];
		{ [_x, _arr, true] call ace_arsenal_fnc_addVirtualItems } forEach EGVAR(configuration,arsenals);
	};

	// Add KAT Medical items.
	switch (EGVAR(configuration,haveKATMedical)) do {

		case "FULL" : 
		{
			private _arr = ["kat_aatKit","kat_accuvac","kat_guedel","kat_AED","kat_X_AED","kat_larynx","kat_Pulseoximeter","kat_chestSeal","kat_Painkiller","kat_stretcherBag","Attachable_Helistretcher","kat_stethoscope","KAT_Empty_bloodIV_500","KAT_Empty_bloodIV_250","kat_IV_16","kat_IO_FAST","kat_amiodarone","kat_atropine","kat_lidocaine","kat_naloxone","kat_nitroglycerin","kat_norepinephrine","kat_phenylephrine","kat_TXA"];
			{ [_x, _arr, true] call ace_arsenal_fnc_addVirtualItems } forEach EGVAR(configuration,arsenals);
		};

		case "LIMITED" :
		{ 
			private _arr = ["kat_guedel","kat_larynx","kat_chestSeal","kat_Painkiller","kat_IV_16","kat_AED"];
			{ [_x, _arr, true] call ace_arsenal_fnc_addVirtualItems } forEach EGVAR(configuration,arsenals);
		};

		case "NONE" : {};

		case default
		{
			["sia_f_haveKATMedical: Invalid option: %1", sia_f_haveKATMedical] call BIS_fnc_error; // Log error if wrong input given.
		};
	};

	{
		clearBackpackCargoGlobal _x;
		clearMagazineCargoGlobal _x;
		clearWeaponCargoGlobal _x;
		clearItemCargoGlobal _x;
		[_x, false] remoteExecCall ["ace_dragging_fnc_setDraggable"];
		[_x, false] remoteExecCall ["ace_dragging_fnc_setCarryable"];
	} forEach EGVAR(configuration,arsenals);
};

if (!isNil QEGVAR(configuration,buttons)) then {
	if (GET_CONFIG(enableTPMenu,true)) then {
		["enableGlobalMessage", false] call FUNC(teleport); // Disable global message
		{
			["addActions", [_x]] call FUNC(teleport); 
			_x setObjectTextureGlobal [0, QPATHTOEF(core,ui\ace_button_img.paa)];
		} forEach EGVAR(configuration,buttons); // Add 'Teleport Menu' to objects
	};
};

/* Mission End */

addMissionEventHandler ["MPEnded", {

	// OCAP2 Replay check and export.
	if !(isNil "ocap_fnc_exportData") then {
		private _weekDay = [systemTime] call CBA_fnc_weekDay;
		private _outcome = missionNamespace getVariable [QGVAR(missionOutcome), "Mission Completed"];
		if (_weekDay > -1) then {
			private _opType = "MISC";
			switch (_weekday) do {
				case 0: { _opType = "MAIN OP"; }; // sunday
				case 5: { _opType = "SIDE OP"; }; // friday
			};
			[_side, _outcome, _opType] call ocap_fnc_exportData;
		} else {
			[_side, _outcome, "unk"] call ocap_fnc_exportData;
			diag_log "endMission.sqf Error: CBA_fnc_weekDay failed.";
		};
	} else {
		diag_log "endMission.sqf Error: ocap_fnc_exportData function not found.";
	};

	// Generate scoreboard.
	private _arr = [];
	{
		_arr pushBack [name _x, (getPlayerScores _x) select 4];
	} forEach allPlayers - entities "HeadlessClient_F"; // Cycle through all players for name and deaths.

	// Print mission name and scoreboard to console.
	diag_log format ["SCOREBOARD FOR %1", (getMissionConfigValue ["onLoadName", missionName])];
	diag_log _arr;
}];
