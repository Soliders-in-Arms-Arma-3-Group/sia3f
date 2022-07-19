#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		name = COMPONENT_NAME;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION; // ToDo (and for all other configs): find correct version number.  Could either put latest game version or actually find what function uses the latest game version and use that.
		requiredAddons[] = { 3DEN, "sia3f_main" };
		author = "Soldiers in Arms";
		authors[] = { "Siege", "McKendrick" };
		url = "https://github.com/Soliders-in-Arms-Arma-3-Group";
		VERSION_CONFIG;
		is3DENmod = 1;
	};
};

#include "Cfg3DEN.hpp"
#include "display3DEN.hpp"
