#include "script_component.hpp"

/*
 * Author: McKendrick, Siege
 * Configures arsenal objects and adds global items.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_ace_fnc_setupGlobalArsenal
*/

LOG_FUNC_START;
private _arsenals = EGVAR(configuration,arsenals);
TRACE_1("arsenals",_arsenals);

{
	clearBackpackCargoGlobal _x;
	clearMagazineCargoGlobal _x;
	clearWeaponCargoGlobal _x;
	clearItemCargoGlobal _x;

	if !("@ace" call EFUNC(core,checkModPresence)) exitWith {};

	[_x, false] remoteExecCall ["ace_dragging_fnc_setDraggable"];
	[_x, false] remoteExecCall ["ace_dragging_fnc_setCarryable"];
	if ((_x call ace_arsenal_fnc_getVirtualItems) isEqualTo []) then { // make sure box isn't already an arsenal, I think init will wipe box
		[_x, false] call ace_arsenal_fnc_initBox;	
	};

	private _globalItems = [];

	if (GET_CONFIG(haveBasics,true)) then {
		// basic items
		// ToDo: allow end-user to modify data below
		_globalItems append ["ACE_fieldDressing", "ACE_elasticBandage", "ACE_packingBandage", "ACE_quikclot", "ACE_bloodIV", "ACE_bloodIV_250", "ACE_bloodIV_500", "ACE_CableTie", "ACE_Chemlight_Shield", "ACE_EarPlugs", "ACE_epinephrine", "ACE_MapTools", "ACE_morphine", "ACE_RangeCard", "ACE_splint", "ACE_tourniquet", "ACE_surgicalKit", "ACE_salineIV", "ACE_salineIV_250", "ACE_salineIV_500", "ToolKit", "ACE_artilleryTable", "Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow", "ItemWatch", "ItemCompass", "ItemMap", "ACE_Canteen", "ACE_WaterBottle"];
	};

	if (GET_CONFIG(acreEnabled,true) && "@ACRE2" call EFUNC(core,checkModPresence)) then {
		// ACRE radio items
		private _acreRadios = ([] call acre_api_fnc_getAllRadios) select 0;
		if (EGVAR(radio,personalRadio) != "NONE") then {
			if (EGVAR(radio,personalRadio) in _acreRadios) then {
				_globalItems pushBackUnique EGVAR(radio,personalRadio);
			} else {
				ERROR_1("Setup Global Arsenal radio, invalid radio type: %1",EGVAR(radio,personalRadio));
			};
		};
	};

	if (GET_CONFIG(haveCTab,true) && "@cTab" call EFUNC(core,checkModPresence)) then {
	// cTab items
		_globalItems append ["ItemMicroDAGR", "ItemcTabHCam", "ItemAndroid", "ItemcTab"];
	};

	switch (GET_CONFIG(haveKATMedical,2)) do {
		// KAT Medical items
		case 2: {
			_globalItems append ["kat_aatKit", "kat_accuvac", "kat_guedel", "kat_AED", "kat_X_AED", "kat_larynx", "kat_Pulseoximeter", "kat_chestSeal", "kat_Painkiller", "kat_stretcherBag", "Attachable_Helistretcher", "kat_stethoscope", "KAT_Empty_bloodIV_500", "KAT_Empty_bloodIV_250", "kat_IV_16", "kat_IO_FAST", "kat_amiodarone", "kat_atropine", "kat_lidocaine", "kat_naloxone", "kat_nitroglycerin", "kat_norepinephrine", "kat_phenylephrine", "kat_TXA", "kat_AFAK", "kat_IFAK", "kat_MFAK", "kat_BVM", "kat_pocketBVM", "kat_Carbonate", "kat_oxygenTank_150", "kat_oxygenTank_300", "kat_flumazenil"];
		};

		case 1:
		{ 
			_globalItems append ["kat_guedel", "kat_larynx", "kat_chestSeal", "kat_Painkiller", "kat_IV_16", "kat_AED"];
		};
	};

	TRACE_1("items added to global arsenal",_globalItems);
	[_x, _globalItems, true] call ace_arsenal_fnc_addVirtualItems;
} forEach _arsenals;

LOG_FUNC_END;
