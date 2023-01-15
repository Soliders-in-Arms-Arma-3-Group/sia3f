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

				class GVAR(roleGroups) { // used to be GVAR(groups), might have missed some entries
					displayName = "Role Groups";
					property = QGVAR(roleGroups);
					defaultValue = createHashMap;
				};

				class GVAR(dynamicGroups) {
					displayName = "Dynamic Groups";
					property = QGVAR(dynamicGroups);
					defaultValue = "";
				};
			};
		};
	};
};
