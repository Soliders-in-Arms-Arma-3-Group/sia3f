#include "script_component.hpp"
// basically initServer.sqf

GVAR(startTime) = date;
setTimeMultiplier 0.1;

missionNamespace setVariable [QGVAR(setupPhase), "Waiting", true];
missionNamespace setVariable [QGVAR(missionStarted), false, true];

if (!isNil QEGVAR(configuration,arsenals)) then {
	publicVariable QEGVAR(configuration,arsenals);

	// === Setup Global Arsenal ===

	/* Likely unecessary data type check. */
	//if (EGVAR(configuration,arsenals) isEqualTo []) then { ["setupGlobalArsenal Error: Invalid Parameters: %1", _this select 0] call BIS_fnc_error }

	// Add basic items.
	if (GVAR(configuration,haveBasics)) then {
		/* To-do: learn a way to allow end-user to modify data below */
		private _arr = ["ACE_fieldDressing","ACE_elasticBandage","ACE_packingBandage","ACE_quikclot","ACE_bloodIV","ACE_bloodIV_250","ACE_bloodIV_500","ACE_CableTie","ACE_Chemlight_Shield","ACE_EarPlugs","ACE_epinephrine","ACE_MapTools","ACE_morphine","ACE_RangeCard","ACE_splint","ACE_tourniquet","ACE_surgicalKit","ACE_salineIV","ACE_salineIV_250","ACE_salineIV_500","ToolKit","ACE_artilleryTable","Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow","ItemWatch","ItemCompass","ItemMap","ACE_Canteen","ACE_WaterBottle"];
		{ [_x, _arr, true] call ace_arsenal_fnc_addVirtualItems } forEach EGVAR(configuration,arsenals);
	};

	// Add ACRE radio items.
	if (GVAR(configuration,acreEnabled)) then {
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
	switch (GVAR(configuration,haveKATMedical)) do {

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
		["enableGlobalMessage", false] call TPD_fnc_teleport; // Disable global message
		{
			["addActions", [_x]] call TPD_fnc_teleport; 
			_x setObjectTextureGlobal [0, "sia_f\images\ace_button_img.jpg"];
		} forEach EGVAR(configuration,buttons); // Add 'Teleport Menu' to objects
	};
};
