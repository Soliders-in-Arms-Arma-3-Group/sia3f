/* 
Note: attributes are not set until edited by the user.  Not just opening the
	GUI, but actually changing the value of the attribute and saving.  The
	functions using mission config values will have to account for the possible
	absence of config values by defaulting to the defaultValue.
*/

class Cfg3DEN {
	class Mission { // https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Scenario
		#include "FrameworkSettings\FrameworkSettings.cpp"
	};

	class Object {
		class AttributeCategories {
			class GVAR(objectSettings) {
				displayName = "SIA Framework";
				collapsed = 0;

				class Attributes {
					class GVAR(isArsenal) {
						displayName = "Is Arsenal";
						tooltip = "Check if this object is meant to be an arsenal.";
						property = QGVAR(isArsenal);
						control = "Checkbox";
						defaultValue = false;

						// condition should be objectSimulated && !objectControllable && !logicModule
						condition = "objectSimulated * (1 - objectControllable) * (1 - logicModule)"; // https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Condition
					};
				};
			};
		};
	};
};
