class GVAR(arsenalOptions) {
	collapsed = 1;
	displayName = "Arsenal Options";
	class Attributes {
		class GVAR(disableArsenalOnRespawn) {
			displayName = "Disable Arsenal On Respawn";
			tooltip = "Enforces one-time use of the arsenal.\nWith Zeus Enhanced loaded, right click on a player to reenable the arsenal.\nNote: Players will still be able to save and (more importantly) load kits if the Kit Manager setting is not disabled in the Ace Action Options tab.";
			property = QGVAR(disableArsenalOnRespawn);
			control = "Checkbox";
			defaultValue = false;
		};

		class GVAR(haveBasics) {
			displayName = "Add Basics";
			tooltip = "Add basic items such as compasses, maps, and bandages";
			property = QGVAR(haveBasics);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(haveCTab) {
			displayName = "Add CTab";
			tooltip = "Add CTab items such as the helmet cam and rugged tablet";
			property = QGVAR(haveCTab);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(haveKATMedical) {
			displayName = "KAT Medical Availability";
			tooltip = "Add KAT Advanced Medical items based on the selected preset\n\nFULL: All KAT items including Pharmacy items\n\nLIMITED: Add only basic and essential KAT items, ideal for low-tech/budget scenarios\n\nNONE: No KAT items will be added";
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
