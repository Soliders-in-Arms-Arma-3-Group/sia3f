class GVAR(arsenalOptions) {
	collapsed = 1;
	displayName = "Arsenal Options";
	class Attributes {
		class GVAR(disableArsenalOnRespawn) {
			displayName = "Disable Arsenal On Respawn";
			tooltip = "Currently no functionality.";
			property = QGVAR(disableArsenalOnRespawn);
			control = "Checkbox";
			defaultValue = false;
		};

		class GVAR(haveBasics) {
			displayName = "Have Basics";
			tooltip = "Add basic items such as compasses, maps, and bandages.";
			property = QGVAR(haveBasics);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(haveCTab) {
			displayName = "Have CTab";
			tooltip = "Add CTab items such as the helmet cam and rugged tablet.";
			property = QGVAR(haveCTab);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(haveKATMedical) {
			displayName = "KAT Medical Availability";
			property = QGVAR(haveKATMedical);
			control = "COMBO";
			typeName = "NUMBER";
			defaultValue = "2";
			class Values {
				class GVAR(haveKATMedical_Full) {
					name = "FULL";
					default = 1;
					value = 2;
				};

				class GVAR(haveKATMedical_Limited) {
					name = "LIMITED";
					value = 1;
				};

				class GVAR(haveKATMedical_None) {
					name = "NONE";
					value = 0;
				};
			};
		};
	};
};