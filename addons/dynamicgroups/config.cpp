#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		name = COMPONENT_NAME;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { "sia3f_main" };
		author = "Soldiers in Arms";
		authors[] = { "Siege", "McKendrick" };
		url = "https://github.com/Soliders-in-Arms-Arma-3-Group";
		VERSION_CONFIG;
	};
};

#include "CfgEventHandlers.hpp"
#include "guiControls.hpp"
