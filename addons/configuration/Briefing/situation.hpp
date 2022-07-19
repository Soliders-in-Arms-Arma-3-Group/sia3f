class GVAR(situation) { 
	collapsed = 0;
	displayName = "Situation";
	class Attributes {
		class GVAR(situationTabName) {
			displayName = "Tab Name";
			tooltip = "Name of the tab (default ""Situation"").";
			property = QGVAR(situationTabName);
			control = "Edit";
			typeName = "STRING";
			defaultValue = "'Situation'";
		};

		class GVAR(situationTabText) {
			displayName = "Tab Text";
			tooltip = "Situation tab text.";
			property = QGVAR(situationTabText);
			control = "EditMulti5";
			typeName = "STRING";
			defaultValue = "''";
		};
	};
};
