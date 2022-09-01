#include "script_component.hpp"

/*
 * Author: mharis001 (ACE 3), modified by Siege
 * Adds compatible attachments or magazines for all weapons in the add additional items GUI.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_configuration_fnc_additionalAddCompatible
 */

private _category = lbCurSel ((findDisplay 8502) displayCtrl 2300);

// Exit if selected category is not attachments or magazines
if !(_category in [4, 5, 6, 7, 8]) exitWith {};

private _configItems = +(uiNamespace getVariable [QGVAR(configItems), []]);
private _roleItems = uiNamespace getVariable [QGVAR(roleItems), []];

// Get list of all weapons in attribute items
(_configItems select 0) params ["_primaryWeapons", "_secondaryWeapons", "_handgunWeapons"];
private _attributeWeapons = _roleItems select { _x in _primaryWeapons || { _x in _secondaryWeapons } || { _x in _handgunWeapons } };

// Add compatible attachments or magazines to attribute
private _cfgWeapons = configFile >> "CfgWeapons";
private _itemsToAdd = [];

if (_category == 8) then {
    private _magazineGroups = uiNamespace getVariable QGVAR(magazineGroups);
    private _cfgMagazines = configFile >> "CfgMagazines";

    {
        private _weaponConfig = _cfgWeapons >> _x;

        {
            private _muzzleConfig = if (_x == "this") then { _weaponConfig } else { _weaponConfig >> _x };

            // Only add existent magazines and ensure correct classname case
            private _magazines = getArray (_muzzleConfig >> "magazines") select { isClass (_cfgMagazines >> _x) };
            _magazines = _magazines apply { configName (_cfgMagazines >> _x) };
            _itemsToAdd append _magazines;

            {
                _itemsToAdd append (_magazineGroups get (toLower _x));
            } forEach getArray (_muzzleConfig >> "magazineWell");
        } forEach getArray (_weaponConfig >> "muzzles");
    } forEach _attributeWeapons;
} else {
    private _attachmentCategory = _category - 4;
    private _filter = ["optic", "pointer", "muzzle", "bipod"] select _attachmentCategory;

    {
        _itemsToAdd append ([_x, _filter] call CBA_fnc_compatibleItems);
    } forEach _attributeWeapons;

    // Only add items with scope of 2 and ensure correct classname case
    _itemsToAdd = _itemsToAdd select { getNumber (_cfgWeapons >> _x >> "scope") == 2 };
    _itemsToAdd = _itemsToAdd apply { configName (_cfgWeapons >> _x) };
};

_roleItems append _itemsToAdd;
_roleItems = _roleItems arrayIntersect _roleItems;

// Refresh the list for new items
uiNamespace setVariable [QGVAR(roleItems), _roleItems];
call FUNC(additionalItemsAddItems);
