class SIA_ArsenalOptions {
	collapsed = 1;
	displayName = "Arsenal Options";
	class Attributes {
		class SIA_ArsenalOptions_arsenalEnabled {
			displayName = "Arsenal Enabled";
			property = "SIA_arsenalEnabled";
			control = "Checkbox";
			defaultValue = true;
		};

		class SIA_ArsenalOptions_disableArsenalOnRespawn {
			displayName = "Disable Arsenal On Respawn";
			tooltip = "Currently no functionality.";
			property = "SIA_disableArsenalOnRespawn";
			control = "Checkbox";
			defaultValue = false;
		};

		class SIA_ArsenalOptions_haveBasics {
			displayName = "Have Basics";
			tooltip = "Add basic items such as compasses, maps, and bandages.";
			property = "SIA_haveBasics";
			control = "Checkbox";
			defaultValue = true;
		};

		class SIA_ArsenalOptions_haveCTab {
			displayName = "Have CTab";
			tooltip = "Add CTab items such as the helmet cam and rugged tablet.";
			property = "SIA_haveCTab";
			control = "Checkbox";
			defaultValue = true;
		};

		class SIA_ArsenalOptions_haveKATMedical {
			displayName = "KAT Medical Availability";
			property = "SIA_haveKATMedical";
			control = "COMBO";
			typeName = "NUMBER";
			defaultValue = "2";
			class Values {
				class SIA_ArsenalOptions_haveKATMedical_Full {
					name = "FULL";
					default = 1;
					value = 2;
				};

				class SIA_ArsenalOptions_haveKATMedical_Limited {
					name = "LIMITED";
					value = 1;
				};

				class SIA_ArsenalOptions_haveKATMedical_None {
					name = "NONE";
					value = 0;
				};
			};
		};
	};
};