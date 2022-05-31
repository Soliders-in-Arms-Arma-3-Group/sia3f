class SIA_ACRERadioOptions {
	collapsed = 1;
	displayName = "ACRE Radio Options";
	class Attributes {
		class SIA_ACRERadioOptions_acreEnabled {
			displayName = "ACRE Enabled";
			property = "SIA_acreEnabled";
			control = "Checkbox";
			defaultValue = true;
		};

		class SIA_ACRERadioOptions_personalRadio {
			displayName = "Personal Radio";
			property = "SIA_personalRadio";
			control = "COMBO";
			typeName = "NUMBER";
			defaultValue = "0";
			class Values {
				class SIA_ACRERadioOptions_personalRadio_PRC343 {
					name = "AN/PRC-343";
					default = 1;
					value = 0;
				};
			};
		};

		class SIA_ACRERadioOptions_handheldRadio {
			displayName = "Handheld Radio";
			property = "SIA_handheldRadio";
			control = "COMBO";
			typeName = "NUMBER";
			defaultValue = "0";
			class Values {
				class SIA_ACRERadioOptions_handheldRadio_PRC152 {
					name = "AN/PRC-152";
					default = 1;
					value = 0;
				};
				class SIA_ACRERadioOptions_handheldRadio_PRC148 {
					name = "AN/PRC-148";
					value = 1;
				};
			};
		};

		class SIA_ACRERadioOptions_manpackRadio {
			displayName = "Manpack Radio";
			property = "SIA_manpackRadio";
			control = "COMBO";
			typeName = "NUMBER";
			defaultValue = "0";
			class Values {
				class SIA_ACRERadioOptions_manpackRadio_PRC177F {
					name = "AN/PRC-177F";
					default = 1;
					value = 0;
				};

				class SIA_ACRERadioOptions_manpackRadio_PRC77 {
					name = "AN/PRC-77";
					value = 1;
				};
			};
		};
	};
};