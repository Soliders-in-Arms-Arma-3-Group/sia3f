/* 
Note: attributes are not set until edited by the user.  Not just opening the
	GUI, but actually changing the value of the attribute and saving.  The
	functions using mission config values will have to account for the possible
	absence of config values by defaulting to the defaultValue.
*/

class Cfg3DEN {

	class Group {
		class AttributeCategories {
			class GVAR(groupSettings) {
				displayName = "SIA Framework";
				collapsed = 0;

				class Attributes {
					class GVAR(radioChannel) {
						displayName = "Radio Channel";
						tooltip = "The channel number this group's personal radio will automatically be set to.";
						property = QGVAR(radioChannel);
						control = "Edit";
						expression = "_this setVariable ['%s',_value,true];";

						defaultValue = "1";
						
						unique = 0;
						validate = "number";
						typeName = "NUMBER";
						// only units should have this attribute
						//condition = "objectControllable";
					};
				};
			};
		};
	};
};
