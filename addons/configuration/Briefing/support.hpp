class GVAR(support) { 
	collapsed = 0;
	displayName = "Support";
	class Attributes {
		class GVAR(supportTabName) {
			displayName = "Tab Name";
			tooltip = "Name of the tab (default ""Support"").";
			property = QGVAR(supportTabName);
			control = "Edit";
			typeName = "STRING";
			defaultValue = "'Support'";
		};

		class GVAR(supportTabText) {
			displayName = "Tab Text";
			tooltip = "Support tab text.";
			property = QGVAR(supportTabText);
			control = "EditMulti5";
			typeName = "STRING";
			defaultValue = "''";
		};
	};
};
