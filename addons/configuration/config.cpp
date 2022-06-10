class CfgPatches {
	class SIA_3DEN_Configuration {
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0; // ToDo (and for all other configs): find correct version number.  Could either put latest game version or actually find what function uses the latest game version and use that.
		requiredAddons[] = { 3DEN };
		is3DENmod = 1;
	};
};

#include "display3DEN.cpp"
#include "Cfg3DEN.cpp"
