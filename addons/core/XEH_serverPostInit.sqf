#include "script_component.hpp"

#define SAFESTART_HINT_REFRESH 30; 

if ((allDisplays isEqualTo [findDisplay 0]) || is3DEN) exitWith {};
// basically initServer.sqf

GVAR(startTime) = date;
setTimeMultiplier 0.1;

missionNamespace setVariable [QGVAR(safeStart_phase), "Waiting", true];
missionNamespace setVariable [QGVAR(missionStarted), false, true];

if (!isNil QEGVAR(configuration,arsenals)) then {
	// === Setup Global Arsenal ===

	{
		clearBackpackCargoGlobal _x;
		clearMagazineCargoGlobal _x;
		clearWeaponCargoGlobal _x;
		clearItemCargoGlobal _x;
		[_x, false] remoteExecCall ["ace_dragging_fnc_setDraggable"];
		[_x, false] remoteExecCall ["ace_dragging_fnc_setCarryable"];
		[_x, false] call ace_arsenal_fnc_initBox;
	} forEach EGVAR(configuration,arsenals);

	// Add basic items.
	if (GET_CONFIG(haveBasics,true)) then {
		/* To-do: learn a way to allow end-user to modify data below */
		private _arr = ["ACE_fieldDressing", "ACE_elasticBandage", "ACE_packingBandage", "ACE_quikclot", "ACE_bloodIV", "ACE_bloodIV_250", "ACE_bloodIV_500", "ACE_CableTie", "ACE_Chemlight_Shield", "ACE_EarPlugs", "ACE_epinephrine", "ACE_MapTools", "ACE_morphine", "ACE_RangeCard", "ACE_splint", "ACE_tourniquet", "ACE_surgicalKit", "ACE_salineIV", "ACE_salineIV_250", "ACE_salineIV_500", "ToolKit", "ACE_artilleryTable", "Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow", "ItemWatch", "ItemCompass", "ItemMap", "ACE_Canteen", "ACE_WaterBottle"];
		{ [_x, _arr, true] call ace_arsenal_fnc_addVirtualItems } forEach EGVAR(configuration,arsenals);
	};

	// Add ACRE radio items.
	if (GET_CONFIG(acreEnabled,true) && "@ACRE2" call FUNC(checkModPresence)) then {
		{
			private _acreRadios = ([] call acre_api_fnc_getAllRadios) select 0;
			if (_x != "NONE") then {
				private _y = _x;
				if (_x in _acreRadios) then {
					{ [_x, [_y], true] call ace_arsenal_fnc_addVirtualItems } forEach EGVAR(configuration,arsenals);
				} else {
					ERROR_1("Setup Global Arsenal radios, invalid radio type: %1",_x);
				};
			};
		} forEach [GVAR(personalRadio), GVAR(handheldRadio), GVAR(manpackRadio)];
	};

	// Add cTab items.
	if (GET_CONFIG(haveCTab,true) && "@cTab" call FUNC(checkModPresence)) then { // TODO: double check cTab's mod tag
		private _arr = ["ItemMicroDAGR", "ItemcTabHCam", "ItemAndroid", "ItemcTab"];
		{ [_x, _arr, true] call ace_arsenal_fnc_addVirtualItems } forEach EGVAR(configuration,arsenals);
	};

	// Add KAT Medical items.
	switch (GET_CONFIG(haveKATMedical,2)) do {
		case 2: {
			private _arr = ["kat_aatKit", "kat_accuvac", "kat_guedel", "kat_AED", "kat_X_AED", "kat_larynx", "kat_Pulseoximeter", "kat_chestSeal", "kat_Painkiller", "kat_stretcherBag", "Attachable_Helistretcher", "kat_stethoscope", "KAT_Empty_bloodIV_500", "KAT_Empty_bloodIV_250", "kat_IV_16", "kat_IO_FAST", "kat_amiodarone", "kat_atropine", "kat_lidocaine", "kat_naloxone", "kat_nitroglycerin", "kat_norepinephrine", "kat_phenylephrine", "kat_TXA"];
			{ [_x, _arr, true] call ace_arsenal_fnc_addVirtualItems } forEach EGVAR(configuration,arsenals);
		};

		case 1:
		{ 
			private _arr = ["kat_guedel", "kat_larynx", "kat_chestSeal", "kat_Painkiller", "kat_IV_16", "kat_AED"];
			{ [_x, _arr, true] call ace_arsenal_fnc_addVirtualItems } forEach EGVAR(configuration,arsenals);
		};
	};

	call EFUNC(ace,initLocalArsenal);	
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

/* Safe Start */

if (GET_CONFIG(showSafestartHint,true)) then {
    [] spawn {
        while { !(missionNamespace getVariable [QGVAR(missionStarted), false]) } do {
            remoteExec [QFUNC(hint)];
            sleep SAFESTART_HINT_REFRESH;
        };
    };
};

/* Mission End */

addMissionEventHandler ["MPEnded", {

	// OCAP2 Replay check and export.
	if !(isNil "ocap_fnc_exportData") then {
		private _realDate = "real_date" callExtension "EST+";
		private _outcome = "Mission Completed"; // To do: Add functionality to determine if mission failed.
		if (_realDate != "") then {
			private _opType = "MISC";
			private _weekday = (parseSimpleArray _realDate) # 6;
			switch (_weekday) do {
				case 0: { _opType = "MAIN OP"; }; // sunday
				case 5: { _opType = "SIDE OP"; }; // friday
			};
			[_side, _outcome, _opType] call ocap_fnc_exportData;
		} else {
			[_side, _outcome, "unk"] call ocap_fnc_exportData;
			ERROR("real_date extension not found");
		};
	} else {
		ERROR("ocap_fnc_exportData function not found");
	};

	call FUNC(exportScoreboard);
}];
