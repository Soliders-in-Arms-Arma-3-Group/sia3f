class GVAR(hiddenConfigValues) {
	displayName = "You shouldn't be seeing this";

	class AttributeCategories {
		class GVAR(internalValues) {
			collapsed = 0;
			displayName = "Internal Values";

			class Attributes {
				class GVAR(frameworkInit) {
					displayName = "Mission Init";
					property = QGVAR(frameworkInit);
					control = "Checkbox";
					defaultValue = false;
				};

				class GVAR(roles) {
					displayName = "Roles";
					property = QGVAR(roles);
					defaultValue = createHashMap;
				};

				class GVAR(groups) {
					displayName = "Groups";
					property = QGVAR(groups);
					defaultValue = createHashMap;
				};
			};
		};
	};
};
