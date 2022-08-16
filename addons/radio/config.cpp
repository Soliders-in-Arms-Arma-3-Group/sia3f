#include "script_component.hpp"

class CfgPatches {
	class SIA_Framework_ACRE {
		name = COMPONENT_NAME;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { "sia3f_core" };
		author = "Soldiers in Arms";
		authors[] = { "" };
		url = "https://github.com/Soliders-in-Arms-Arma-3-Group";
		VERSION_CONFIG;
	};
};

#include "CfgEventHandlers.hpp"