class GVAR(ACRERadioOptions) {
	collapsed = 1;
	displayName = "ACRE Radio Options";
	class Attributes {
		class GVAR(acreEnabled) {
			displayName = "ACRE Enabled";
			tooltip = "Toggle usage of ACRE-related scripts within the framework";
			property = QGVAR(acreEnabled);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(personalRadio) {
			displayName = "Personal Radio";
			tooltip = "Personal Radio to be used\n\nThis radio is given to all players and used for squad communication";
			property = QGVAR(personalRadio);
			control = "COMBO";
			typeName = "NUMBER";
			defaultValue = 1;
			class Values {
				class GVAR(personalRadio_NONE) {
					name = "NONE";
					value = 0;
				};
				class GVAR(personalRadio_PRC343) {
					name = "AN/PRC-343";
					value = 1;
					//picture = "acre_sys_prc343\Data\static\prc343_icon.paa"; To-do:  get the icon for this and others to work ffs
				};
				class GVAR(personalRadio_888S) {
					name = "Beofeng 888S";
					value = 2;
				};
				class GVAR(personalRadio_SEM52SL) {
					name = "SEM-52SL";
					value = 3;
				};
			};
		};

		class GVAR(handheldRadio) {
			displayName = "Handheld Radio";
			tooltip = "Handheld Radio to be used\n\nThis radio is given to roles with the 'Has Handheld' trait and is used for command-related communications";
			property = QGVAR(handheldRadio);
			control = "COMBO";
			typeName = "NUMBER";
			defaultValue = "3";
			class Values {
				class GVAR(handheldRadio_NONE) {
					name = "NONE";
					value = 0;
				};
				class GVAR(handheldRadio_PRC343) {
					name = "AN/PRC-343";
					value = 1;
				};
				class GVAR(handheldRadio_PRC148) {
					name = "AN/PRC-148";
					value = 2;
				};
				class GVAR(handheldRadio_PRC152) {
					name = "AN/PRC-152";
					value = 3;
				};
			};
		};

		class GVAR(manpackRadio) {
			displayName = "Manpack Radio";
			tooltip = "Manpack Radio to be used\n\nThis radio is given to roles with the 'Has Manpack' trait and is used for long-range, command-related communications";
			property = QGVAR(manpackRadio);
			control = "COMBO";
			typeName = "NUMBER";
			defaultValue = "1";
			class Values {
				class GVAR(manpackRadio_NONE) {
					name = "NONE";
					value = 0;
				};
				class GVAR(manpackRadio_PRC177F) {
					name = "AN/PRC-177F";
					default = 1;
					value = 1;
				};

				class GVAR(manpackRadio_PRC77) {
					name = "AN/PRC-77";
					value = 2;
				};
				class GVAR(manpackRadio_SEM70) {
					name = "SEM-70";
					value = 3;
				};
			};
		};
	};
};
