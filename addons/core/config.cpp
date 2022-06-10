#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		name = "SIA 3DEN Core Handlers";
		author = "McKendrick";
		
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = { SIA_Framework_Handlers };
	};
};

#include "CfgEventHandlers.hpp"