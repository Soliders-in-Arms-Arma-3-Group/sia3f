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

		class GVAR(basicsItems) {
			displayName = "Basics Items Preset";
			tooltip = "Array of classnames added to framework arsenals if 'Add Basics' is enabled";
			property = QGVAR(basicsItems);
			control = "EditCode";
			defaultValue = "['ACE_fieldDressing', 'ACE_elasticBandage', 'ACE_packingBandage', 'ACE_quikclot', 'ACE_plasmaIV', 'ACE_plasmaIV_250', 'ACE_plasmaIV_500', 'ACE_CableTie', 'ACE_Chemlight_Shield', 'ACE_EarPlugs', 'ACE_epinephrine', 'ACE_MapTools', 'ACE_morphine', 'ACE_RangeCard', 'ACE_splint', 'ACE_tourniquet', 'ACE_surgicalKit', 'ACE_salineIV', 'ACE_salineIV_250', 'ACE_salineIV_500', 'ACE_painkillers', 'ToolKit', 'ACE_artilleryTable', 'Chemlight_blue', 'Chemlight_green', 'Chemlight_red', 'Chemlight_yellow', 'ItemWatch', 'ItemCompass', 'ItemMap', 'ACE_Canteen', 'ACE_WaterBottle', 'ACE_SpareBarrel', 'acex_intelitems_notepad', 'ACE_wirecutter']";
		};

		class GVAR(cTabItems) {
			displayName = "CTab Items Preset";
			tooltip = "Array of classnames added to framework arsenals if 'Add CTab' is enabled";
			property = QGVAR(cTabItems);
			control = "EditCode";
			defaultValue = "['ItemMicroDAGR', 'ItemcTabHCam', 'ItemAndroid', 'ItemcTab']";
		};

		class GVAR(KATMedicalItems) {
			displayName = "KAT Medical Items Preset";
			tooltip = "Array of classnames added to framework arsenals if 'KAT Medical Availability' is set to FULL";
			property = QGVAR(KATMedicalItems);
			control = "EditCode";
			defaultValue = "['kat_aatKit', 'kat_accuvac', 'kat_guedel', 'kat_AED', 'kat_X_AED', 'kat_larynx', 'kat_Pulseoximeter', 'kat_chestSeal', 'kat_Painkiller', 'kat_stretcherBag', 'Attachable_Helistretcher', 'kat_stethoscope', 'KAT_Empty_bloodIV_500', 'KAT_Empty_bloodIV_250', 'kat_IV_16', 'kat_IO_FAST', 'kat_amiodarone', 'kat_atropine', 'kat_lidocaine', 'kat_naloxone', 'kat_nitroglycerin', 'kat_norepinephrine', 'kat_phenylephrine', 'kat_TXA', 'kat_AFAK', 'kat_IFAK', 'kat_MFAK', 'kat_BVM', 'kat_pocketBVM', 'kat_Carbonate', 'kat_oxygenTank_150', 'kat_oxygenTank_300', 'kat_flumazenil']";
		};

		class GVAR(customItems) {
			displayName = "Custom Global Arsenal Items";
			tooltip = "Array of classnames added to all framework arsenals. This works with the export from an Object: ACE Arsenal attributes.";
			property = QGVAR(customItems);
			control = "EditCode";
			defaultValue = "[]";
		};
	};
};
