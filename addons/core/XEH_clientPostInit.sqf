#include "script_component.hpp"
// should behave identically to initPlayerLocal

player addEventHandler ["Killed", {
	params ["_unit"];

	GVAR(deathLoadout) = getUnitLoadout _unit;
	GVAR(lastGroup) = group _unit;

	if ("@ACRE2" call FUNC(checkModPresence)) then { GVAR(mpttRadioList) = [] call acre_api_fnc_getMultiPushToTalkAssignment; };

	if ("@ace" call FUNC(checkModPresence)) then {
		GVAR(hadEarplugsIn) = [_unit] call ace_hearing_fnc_hasEarPlugsIn; 
		[_unit, 4] call ace_medical_treatment_fnc_setTriageStatus; // Set player's corpse triage to "Deceased"
	};
}];

player addEventHandler ["Respawn", {
	params ["_unit"];

	// Load saved _unit loadout
	private _loadout = GVAR(savedLoadout);

	// If _unit does not have a saved loadout, load loadout from death
	if (isNil "_loadout") then {
		_unit setUnitLoadout GVAR(deathLoadout);
		hint "Gear from previous death loaded."
	} else {
		_unit setUnitLoadout (savedLoadout);
		hint "Saved kit loaded.";
	};

	// Check if _unit had earplugs in on death, and put them back in.
	if ("@ace" call FUNC(checkModPresence)) then {
		if (GVAR(hadEarplugsIn)) then {
			_unit removeItem "ACE_EarPlugs";
			_unit addItem "ACE_EarPlugs";
			[_unit, true] call ace_hearing_fnc_putInEarplugs;
		};
	};

	// Failsafe add _unit to old group
	private _grp = GVAR(lastGroup);
	if (group _unit != _grp) then { _unit joinSilent _grp };

	// Restore ACRE PTT Assignment
	if ("@ACRE2" call FUNC(checkModPresence)) then {
		waitUntil { ([] call acre_api_fnc_isInitialized) };
		["loadRadioDefaultSpatials", []] spawn EFUNC(radio,ACRERadioSetup);
		["reorderRadioMPTT", [GVAR(personalRadio)]] spawn EFUNC(radio,ACRERadioSetup);
	};

	// Exit _unit from AFK if still set as AFK
	if (_unit getVariable [QGVAR(isAFK), false]) then {
		call FUNC(exitAFK);
	};
}];
