/* 
Note: attributes are not set until edited by the user.  Not just opening the
	GUI, but actually changing the value of the attribute and saving.  The
	functions using mission config values will have to account for the possible
	absence of config values by defaulting to the defaultValue.
*/

class Cfg3DEN {
	class Mission { // https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Scenario
		#include "FrameworkSettings\FrameworkSettings.cpp"

		class SIA_FrameworkMeta { // this should never be edited directly by the player.  It is added to tell the framework when to run (PostInit)
			displayName = "Meta";
			class AttributeCatagories {
				class SIA_MetaSettings {
					collapsed = 1;
					displayName = "Meta";
					class Attributes {
						class SIA_MetaSettings_runFramework {
							displayName = "Meta";
							property = "SIA_runFramework";
							control = "Checkbox";
							expression = ""; // ToDo: run main framework flow handler
							defaultValue = true;
						};
					};
				};
			};
		};
	};
};
