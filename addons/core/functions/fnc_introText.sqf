#include "script_component.hpp"

/*
 * Author: McKendrick
 * Formats and displays information about the current mission in the form of a hint. Execute locally.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call sia3f_core_fnc_introText

*/

LOG("fnc_introText.sqf started.");

private _faction = (getMissionConfigValue [("sia3f_configuration_" + str side player + "FactionName"), (getText (configFile >> "CfgFactionClasses" >> (faction player) >> "displayName"))]);
private _missionLocation = GET_CONFIG(missionLocationName, worldName);
private _role = player getVariable [QGVAR(role), (roleDescription player)];
_role = if (_role != "") then [{ (_role splitString "@") select 0 }, { getText (configFile >> "CfgVehicles" >> (typeOf player) >> "displayName") }];

TRACE_3("fnc_introText.sqf content",_faction,_missionLocation,_role);

[ 
	[_faction, "font = 'PuristaSemibold'"],
	["", "<br/>"],
	[(_role + ", " + (groupId (group player))), "font = 'PuristaLight'"],
	["", "<br/>"],
	[((player call BIS_fnc_locationDescription) + ", " + _missionLocation), "font = 'PuristaMedium'"]
]  execVM "\a3\missions_f_bootcamp\Campaign\Functions\GUI\fn_SITREP.sqf";


INFO("fnc_introText.sqf fully executed.");