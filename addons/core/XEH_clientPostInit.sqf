#include "script_component.hpp"

if (
	allDisplays isEqualTo [findDisplay 0] ||
	is3DEN ||
	!GET_CONFIG(frameworkInit,false)
) exitWith {};

player addEventHandler ["Killed", {
	params ["_unit"];

	GVAR(deathLoadout) = getUnitLoadout _unit;
	GVAR(lastGroup) = group _unit;

	if ("@ace" call FUNC(checkModPresence)) then {
		GVAR(hadEarplugsIn) = [_unit] call ace_hearing_fnc_hasEarPlugsIn; 
		[_unit, 4] call ace_medical_treatment_fnc_setTriageStatus; // Set player's corpse triage to "Deceased"

		// disable arsenal on respawn
		if (GET_CONFIG(disableArsenalOnRespawn,false) && isNil QGVAR(arsenalContents) && (missionNamespace getVariable [QGVAR(missionStarted), false])) then {
			GVAR(arsenalContents) = keys ([EGVAR(configuration,arsenals) # 0] call ace_arsenal_fnc_getVirtualItems); // save arsenal contents in case it is reenabled
			{ [_x] call ace_arsenal_fnc_removeBox; } forEach EGVAR(configuration,arsenals);
		};
	};
}];

player addEventHandler ["Respawn", {
	params ["_unit"];

	// Load saved _unit loadout
	private _loadout = GVAR(savedLoadout);

	// If _unit does not have a saved loadout, load loadout from death
	if (isNil "_loadout") then {
		_unit setUnitLoadout GVAR(deathLoadout);
		hint "Gear from previous death loaded.";
	} else {
		_unit setUnitLoadout _loadout;
		hint "Saved kit loaded.";
	};

	// Check if _unit had earplugs in on death, and put them back in.
	if ("@ace" call FUNC(checkModPresence)) then {
		if (GVAR(hadEarplugsIn)) then {
			_unit removeItem "ACE_EarPlugs"; // replace with conditional to check if unit already has earplugs
			_unit addItem "ACE_EarPlugs";
			[_unit, true] call ace_hearing_fnc_putInEarplugs;
		};
	};

	// Failsafe add _unit to old group
	private _grp = GVAR(lastGroup);
	if (group _unit != _grp) then { _unit joinSilent _grp };

	// Exit _unit from AFK if still set as AFK
	if (_unit getVariable [QGVAR(isAFK), false]) then {
		call FUNC(exitAFK);
	};
}];


private _role = player getVariable [QEGVAR(configuration,role), "default"];
private _roleValues = GVAR(roles) getOrDefault [_role, [false, false, false, false, [], []]]; // [isMedic, isEngineer, hasHandheldRadio, hasManpackRadio, roleItems, roleGroups]

// account for roles in groups (group setting only applies if role setting is false)
if (({ _x in GVAR(groups) } count _roleValues # 5) > 0) then {
	{
		private _group = GVAR(groups) get _x;
		if (!(_roleValues # 0)) then { _roleValues set [0, _group # 0]; };
		if (!(_roleValues # 1)) then { _roleValues set [1, _group # 1]; };
	} forEach _roleValues # 5;
};

TRACE_2("initializing role values",_role,_roleValues);

player setUnitTrait ["medic", _roleValues # 0];
player setUnitTrait ["engineer", _roleValues # 1];
player setUnitTrait ["explosiveSpecialist", _roleValues # 1];

if ("@ace" call FUNC(checkModPresence)) then {
	player setVariable ["ace_medical_medicClass", parseNumber (_roleValues # 0), true];
	player setVariable ["ACE_isEngineer", parseNumber (_roleValues # 1), true];
	player setVariable ["ACE_isEOD", _roleValues # 1, true];
};
