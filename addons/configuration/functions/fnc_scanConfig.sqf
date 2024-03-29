#include "script_component.hpp"

/*
 * Author: Dedmen (ACE 3), modified by Siege
 * Cache an array of all the compatible items for the role additional items editor.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_scanConfig
*/

LOG_FUNC_START;
private _cargo = [
	[[], [], []], // Weapons 0, primary, secondary, handgun
	[[], [], [], []], // WeaponAccessories 1, optic,side,muzzle,bipod
	[ ], // Magazines 2
	[ ], // Headgear 3
	[ ], // Uniform 4
	[ ], // Vest 5
	[ ], // Backpacks 6
	[ ], // Goggles 7
	[ ], // NVGs 8
	[ ], // Binoculars 9
	[ ], // Map 10
	[ ], // Compass 11
	[ ], // Radio slot 12
	[ ], // Watch slot  13
	[ ], // Comms slot 14
	[ ], // WeaponThrow 15
	[ ], // WeaponPut 16
	[ ] // InventoryItems 17
];

private _configCfgWeapons = configFile >> "CfgWeapons"; // Save this lookup in variable for perf improvement

{
	private _configItemInfo = _x >> "ItemInfo";
	private _simulationType = getText (_x >> "simulation");
	private _className = configName _x;
	private _hasItemInfo = isClass (_configItemInfo);
	private _itemInfoType = if (_hasItemInfo) then { getNumber (_configItemInfo >> "type") } else { 0 };
	private _isMiscItem = _className isKindOf ["CBA_MiscItem", (_configCfgWeapons)];

	switch true do {
		/* Weapon acc */
		case (
				_hasItemInfo &&
				{ _itemInfoType in [101, 201, 301, 302] } &&
				{ !_isMiscItem }
			): {

			//Convert type to array index
			(_cargo select 1) select ([201, 301, 101, 302] find _itemInfoType) pushBackUnique _className;
		};
		/* Headgear */
		case (_itemInfoType == 605): {
			(_cargo select 3) pushBackUnique _className;
		};
		/* Uniform */
		case (_itemInfoType == 801): {
			(_cargo select 4) pushBackUnique _className;
		};
		/* Vest */
		case (_itemInfoType == 701): {
			(_cargo select 5) pushBackUnique _className;
		};
		/* NVgs */
		case (_simulationType == "NVGoggles"): {
			(_cargo select 8) pushBackUnique _className;
		};
		/* Binos */
		case (_simulationType == "Binocular" ||
			((_simulationType == 'Weapon') && { (getNumber (_x >> 'type') == 4096) })): {
			(_cargo select 9) pushBackUnique _className;
		};
		/* Map */
		case (_simulationType == "ItemMap"): {
			(_cargo select 10) pushBackUnique _className;
		};
		/* Compass */
		case (_simulationType == "ItemCompass"): {
			(_cargo select 11) pushBackUnique _className;
		};
		/* Radio */
		case (_simulationType == "ItemRadio"): {
			(_cargo select 12) pushBackUnique _className;
		};
		/* Watch */
		case (_simulationType == "ItemWatch"): {
			(_cargo select 13) pushBackUnique _className;
		};
		/* GPS */
		case (_simulationType == "ItemGPS"): {
			(_cargo select 14) pushBackUnique _className;
		};
		/* UAV terminals */
		case (_itemInfoType == 621): {
			(_cargo select 14) pushBackUnique _className;
		};
		/* Weapon, at the bottom to avoid adding binos */
		case (isClass (_x >> "WeaponSlotsInfo") &&
			{ getNumber (_x >> 'type') != 4096 }): {
			switch (getNumber (_x >> "type")) do {
				case 1: {
					(_cargo select 0) select 0 pushBackUnique (_className call bis_fnc_baseWeapon);
				};
				case 2: {
					(_cargo select 0) select 2 pushBackUnique (_className call bis_fnc_baseWeapon);
				};
				case 4: {
					(_cargo select 0) select 1 pushBackUnique (_className call bis_fnc_baseWeapon);
				};
			};
		};
		/* Misc items */
		case (
				_hasItemInfo &&
				(_itemInfoType in [101, 201, 301, 302] &&
				{ _isMiscItem }) ||
				{ _itemInfoType in [401, 619, 620] } ||
				{ (getText ( _x >> "simulation")) == "ItemMineDetector" }
			): {
			(_cargo select 17) pushBackUnique _className;
		};
	};
} foreach configProperties [_configCfgWeapons, "isClass _x && { (if (isNumber (_x >> 'scopeArsenal')) then { getNumber (_x >> 'scopeArsenal') } else { getNumber (_x >> 'scope') }) == 2 } && { getNumber (_x >> 'ace_arsenal_hide') != 1 }", true];

private _grenadeList = [];
{
	_grenadeList append getArray (_configCfgWeapons >> "Throw" >> _x >> "magazines");
} foreach getArray (_configCfgWeapons >> "Throw" >> "muzzles");

private _putList = [];
{
	_putList append getArray (_configCfgWeapons >> "Put" >> _x >> "magazines");
} foreach getArray (_configCfgWeapons >> "Put" >> "muzzles");

{
	private _className = configName _x;

	switch true do {
		// Grenades
		case (_className in _grenadeList): {
			(_cargo select 15) pushBackUnique _className;
		};
		// Put
		case (_className in _putList): {
			(_cargo select 16) pushBackUnique _className;
		};
		// Rifle, handgun, secondary weapons mags
		case (
				(getNumber (_x >> "type") in [256, 512 ,1536, 16, 768]) ||
				{ (getNumber (_x >> QGVAR(hide))) == -1 }
			): {
			(_cargo select 2) pushBackUnique _className;
		};
	};
} foreach configProperties [(configFile >> "CfgMagazines"), "isClass _x && { (if (isNumber (_x >> 'scopeArsenal')) then { getNumber (_x >> 'scopeArsenal') } else { getNumber (_x >> 'scope') }) == 2} && { getNumber (_x >> 'ace_arsenal_hide') != 1 }", true];

{
	if (getNumber (_x >> "isBackpack") == 1) then {
		(_cargo select 6) pushBackUnique (configName _x);
	};
} foreach configProperties [(configFile >> "CfgVehicles"), "isClass _x && { (if (isNumber (_x >> 'scopeArsenal')) then { getNumber (_x >> 'scopeArsenal') } else { getNumber (_x >> 'scope') }) == 2} && { getNumber (_x >> 'ace_arsenal_hide') != 1 }", true];

{
	(_cargo select 7) pushBackUnique (configName _x);
} foreach configProperties [(configFile >> "CfgGlasses"), "isClass _x && { (if (isNumber (_x >> 'scopeArsenal')) then { getNumber (_x >> 'scopeArsenal') } else { getNumber (_x >> 'scope') }) == 2} && { getNumber (_x >> 'ace_arsenal_hide') != 1 }", true];

private _magazineGroups = createHashMap;

private _cfgMagazines = configFile >> "CfgMagazines";

{
	private _magList = [];
	{
		private _magazines = (getArray _x) select { isClass (_cfgMagazines >> _x) }; //filter out non-existent magazines
		_magazines = _magazines apply { configName (_cfgMagazines >> _x) }; //Make sure classname case is correct
		_magList append _magazines;
	} foreach configProperties [_x, "isArray _x", true];

	_magazineGroups set [toLower configName _x, _magList arrayIntersect _magList];
} foreach configProperties [configFile >> "CfgMagazineWells", "isClass _x", true];

uiNamespace setVariable [QGVAR(configItems), _cargo];
// uiNamespace setVariable [QGVAR(configItemsFlat), flatten _cargo];
uiNamespace setVariable [QGVAR(magazineGroups), _magazineGroups];
TRACE_2("configItems and magazineGroups values",_cargo,_magazineGroups);
LOG_FUNC_END;
