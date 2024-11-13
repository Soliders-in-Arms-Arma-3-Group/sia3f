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
diag_log format ["arsenals: %1",_arsenals];

if !("@ace" call EFUNC(core,checkModPresence)) exitWith {};

private _globalItems = [];

if (GET_CONFIG(haveBasics,true)) then {
	// basic items
	private _defaultList = "['ACE_fieldDressing', 'ACE_elasticBandage', 'ACE_packingBandage', 'ACE_quikclot', 'ACE_bloodIV', 'ACE_bloodIV_250', 'ACE_bloodIV_500', 'ACE_CableTie', 'ACE_Chemlight_Shield', 'ACE_EarPlugs', 'ACE_epinephrine', 'ACE_MapTools', 'ACE_morphine', 'ACE_RangeCard', 'ACE_splint', 'ACE_tourniquet', 'ACE_surgicalKit', 'ACE_salineIV', 'ACE_salineIV_250', 'ACE_salineIV_500', 'ACE_painkillers', 'ToolKit', 'ACE_artilleryTable', 'Chemlight_blue', 'Chemlight_green', 'Chemlight_red', 'Chemlight_yellow', 'ItemWatch', 'ItemCompass', 'ItemMap', 'ACE_Canteen', 'ACE_WaterBottle']";
	_globalItems append (parseSimpleArray GET_CONFIG(basicsItems,_defaultList));
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
	private _defaultList = "['ItemMicroDAGR', 'ItemcTabHCam', 'ItemAndroid', 'ItemcTab']";
	_globalItems append (parseSimpleArray GET_CONFIG(cTabItems,_defaultList));
};

if ("@KAT - Advanced Medical" call EFUNC(core,checkModPresence)) then {
	switch (GET_CONFIG(haveKATMedical,2)) do {
		// KAT Medical items
		case 2: {
			private _defaultList = "['kat_aatKit', 'kat_accuvac', 'kat_guedel', 'kat_AED', 'kat_X_AED', 'kat_larynx', 'kat_Pulseoximeter', 'kat_chestSeal', 'kat_Painkiller', 'kat_stretcherBag', 'Attachable_Helistretcher', 'kat_stethoscope', 'KAT_Empty_bloodIV_500', 'KAT_Empty_bloodIV_250', 'kat_IV_16', 'kat_IO_FAST', 'kat_amiodarone', 'kat_atropine', 'kat_lidocaine', 'kat_naloxone', 'kat_nitroglycerin', 'kat_norepinephrine', 'kat_phenylephrine', 'kat_TXA', 'kat_AFAK', 'kat_IFAK', 'kat_MFAK', 'kat_BVM', 'kat_pocketBVM', 'kat_Carbonate', 'kat_oxygenTank_150', 'kat_oxygenTank_300', 'kat_flumazenil']";
			_globalItems append (parseSimpleArray GET_CONFIG(KATMedicalItems,_defaultList));
		};

		case 1:
		{ 
			_globalItems append ["kat_guedel", "kat_larynx", "kat_chestSeal", "kat_Painkiller", "kat_IV_16", "kat_AED"];
		};
	};
};

private _customItems = (parseSimpleArray GET_CONFIG(customItems,"[]"));
if (!(_customItems isEqualType [])) then { 
	["Bad array of custom global arsenal items: %1",_customItems] call BIS_fnc_error;
} else {
	{ _globalItems pushBackUnique _x } forEach _customItems;
};

 private _fnc_setupArsenal = {
	params ["_arsenal", "_itemsToAdd"];
	diag_log format ["_fnc_setupArsenal started with params: %1 and %2",_arsenal,_itemsToAdd];

 	clearBackpackCargoGlobal _arsenal;
	clearMagazineCargoGlobal _arsenal;
	clearWeaponCargoGlobal _arsenal;
	clearItemCargoGlobal _arsenal;

	[_arsenal, false] remoteExecCall ["ace_dragging_fnc_setDraggable"];
	[_arsenal, false] remoteExecCall ["ace_dragging_fnc_setCarryable"];
	
	// wait till object is ready
	private _localItemsToAdd = + _itemsToAdd; // use deep copy to avoid bleeding values
	[
		{ ((_this select 0) call ace_arsenal_fnc_getVirtualItems) isEqualType createHashMap },
		{ 
			params ["_arsenal", "_items"];
			private _hashVirtualItems = _arsenal call ace_arsenal_fnc_getVirtualItems;
			
			// make sure box isn't already an arsenal
			if (_hashVirtualItems isEqualTo createHashMap) then {
				[_arsenal, _items, true] call ace_arsenal_fnc_initBox;
			} else {
				// only add items not already in virtual arsenal
				{ _items pushBackUnique _x } forEach ((toArray _hashVirtualItems) select 0);
				[_arsenal, _items, true] call ace_arsenal_fnc_addVirtualItems;
			};
			diag_log format ["items added to global arsenal: %1 on object %2",_items,_arsenal];
		},
		[_arsenal, _localItemsToAdd],
		1,
		{ 
			params ["_arsenal", "_itemsToAdd"];
			[_arsenal, false, true] call ace_arsenal_fnc_initBox;
			["Arsenal on object failed to initialize: %1", _arsenal] call BIS_fnc_error;
		}
	] call CBA_fnc_waitUntilAndExecute;
};

{ [_x, _globalItems] call _fnc_setupArsenal } forEach _arsenals;

LOG_FUNC_END;
