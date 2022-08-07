class GVAR(hiddenConfigValues) {
	displayName = "You shouldn't be seeing this";

	class AttributeCategories {
		class GVAR(initializationValues) {
			collapsed = 0;
			displayName = "Initialization Values";

			class Attributes {
				class GVAR(frameworkInit) {
					displayName = "Mission Init";
					property = QGVAR(frameworkInit);
					control = "Checkbox";
					defaultValue = false;
				};
			};
		};
	};
};
