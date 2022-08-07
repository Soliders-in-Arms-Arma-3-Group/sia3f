/* 
Note: attributes are not set until edited by the user.  Not just opening the
	GUI, but actually changing the value of the attribute and saving.  The
	functions using mission config values will have to account for the possible
	absence of config values by defaulting to the defaultValue.
*/

class Cfg3DEN {
	class Mission { // https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Scenario
		#include "FrameworkSettings\FrameworkSettings.hpp"
		#include "Briefing\Briefing.hpp"
		#include "hiddenConfigValues.hpp"
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
						expression = QUOTE(
							if (isNil QQGVAR(arsenals)) then { GVAR(arsenals) = []; };
							GVAR(arsenals) pushBack _this;
						);
						defaultValue = false;

						// condition should be objectSimulated && !objectControllable && !logicModule
						condition = "objectSimulated * (1 - objectControllable) * (1 - logicModule)"; // https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Condition
					};

					class GVAR(isButton) {
						displayName = "Is Button";
						tooltip = "Check if this object is meant to be a button.";
						property = QGVAR(isButton);
						control = "Checkbox";
						defaultValue = false;

						// condition should be objectSimulated && !objectControllable && !logicModule
						condition = "objectSimulated * (1 - objectControllable) * (1 - logicModule)"; // https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Condition
					};

					class GVAR(role) {
						displayName = "Role";
						tooltip = "The unit's role (e.g, ""Rifleman"").  Only needs to be defined on playable units.";
						property = QGVAR(role);
						control = "Edit";
						expression = "_this setVariable ['%s',_value,true];";
						typeName = "STRING";
						defaultValue = "''";

						// only units should have this attribute
						condition = "objectControllable";
					};
				};
			};
		};
	};
};
