#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if ((allDisplays isEqualTo [findDisplay 0]) || !is3DEN) exitWith {};

private _respawnTemplates = "Multiplayer" get3DENMissionAttribute "RespawnTemplates";
if ("ace_spectator" in _respawnTemplates) then {
	if ("MenuInventory" in _respawnTemplates) then {
		systemChat("Respawn ruleset 'Select respawn loadout' is incompatible with 'ACE Spectator'.  Removing 'Select respawn loadout' ruleset...");
		"Multiplayer" set3DENMissionAttribute ["RespawnTemplates", _respawnTemplates - ["MenuInventory"]];
		LOG("MenuInventory respawnTemplate removed");
		do3DENAction "MissionSave";
	};

	if ("MenuPosition" in _respawnTemplates) then {
		systemChat("Respawn ruleset 'Select respawn position' is incompatible with 'ACE Spectator'.  Removing 'Select respawn position' ruleset...");
		"Multiplayer" set3DENMissionAttribute ["RespawnTemplates", _respawnTemplates - ["MenuPosition"]];
		LOG("MenuPosition respawnTemplate removed");
		do3DENAction "MissionSave";
	};
};

ADDON = true;
