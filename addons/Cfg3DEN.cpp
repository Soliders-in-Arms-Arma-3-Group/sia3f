/* 
Note: attributes are not set until edited by the user.  Not just opening the
	GUI, but actually changing the value of the attribute and saving.  The
	functions using mission config values will have to account for the possible
	absence of config values.
*/

class Cfg3DEN {
	class Mission { // https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Scenario
		class SIA_FrameworkSettings {
			displayName = "SiA Framework Settings";
			class AttributeCategories {
				class SIA_TestSettings {
					collapsed = 0;
					displayName = "Test Settings";
					class Attributes {
						class SIA_TestOption {
							displayName = "ACRE Enabled (TEST)";
							property = "SIA_TestOption_propertyName";
							control = "Checkbox";
							expression = "[str _value] remoteExec ['systemChat'];";
							defaultValue = "false"; // set3DENMissionAttributes [["SIA_FrameworkSettings","SIA_TestOption_propertyName",true]]
						};
					};
				};
			};
		};
	};
};
