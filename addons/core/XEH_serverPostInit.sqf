#include "script_component.hpp"

#define SAFESTART_HINT_REFRESH 30; 

if (
	allDisplays isEqualTo [findDisplay 0] ||
	is3DEN ||
	!GET_CONFIG(frameworkInit,false)
) exitWith {};
// basically initServer.sqf

GVAR(startTime) = date;
setTimeMultiplier 0.1;

missionNamespace setVariable [QGVAR(safeStart_phase), "Waiting", true];
missionNamespace setVariable [QGVAR(missionStarted), false, true];

if (!isNil QEGVAR(configuration,arsenals)) then {
	call FUNC(setupGlobalArsenal);
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

// Safe Start
if (GET_CONFIG(showSafestartHint,true)) then {
    [] spawn {
        while { !(missionNamespace getVariable [QGVAR(missionStarted), false]) } do {
            remoteExec [QFUNC(hint)];
            sleep SAFESTART_HINT_REFRESH;
        };
    };
};

// Mission End
addMissionEventHandler ["MPEnded", {
	call FUNC(onMissionEnd);
	call FUNC(exportScoreboard);
}];
