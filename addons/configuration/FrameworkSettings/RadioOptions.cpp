class GVAR(ACRERadioOptions) {
	collapsed = 1;
	displayName = "ACRE Radio Options";
	class Attributes {
		class GVAR(acreEnabled) {
			displayName = "ACRE Enabled";
			property = QGVAR(acreEnabled);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(personalRadio) {
			displayName = "Personal Radio";
			property = QGVAR(personalRadio);
			control = "COMBO";
			typeName = "NUMBER";
			defaultValue = "0";
			class Values {
				class GVAR(personalRadio_PRC343) {
					name = "AN/PRC-343";
					default = 1;
					value = 0;
				};
			};
		};

		class GVAR(handheldRadio) {
			displayName = "Handheld Radio";
			property = QGVAR(handheldRadio);
			control = "COMBO";
			typeName = "NUMBER";
			defaultValue = "0";
			class Values {
				class GVAR(handheldRadio_PRC152) {
					name = "AN/PRC-152";
					default = 1;
					value = 0;
				};
				class GVAR(handheldRadio_PRC148) {
					name = "AN/PRC-148";
					value = 1;
				};
			};
		};

		class GVAR(manpackRadio) {
			displayName = "Manpack Radio";
			property = QGVAR(manpackRadio);
			control = "COMBO";
			typeName = "NUMBER";
			defaultValue = "0";
			class Values {
				class GVAR(manpackRadio_PRC177F) {
					name = "AN/PRC-177F";
					default = 1;
					value = 0;
				};

				class GVAR(manpackRadio_PRC77) {
					name = "AN/PRC-77";
					value = 1;
				};
			};
		};
	};
};