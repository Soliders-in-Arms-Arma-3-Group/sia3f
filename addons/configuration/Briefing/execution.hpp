class GVAR(execution) { 
	collapsed = 0;
	displayName = "Execution";
	class Attributes {
		class GVAR(execTabName) {
			displayName = "Tab Name";
			tooltip = "Name of the tab (default ""Execution"")";
			property = QGVAR(execTabName);
			control = "Edit";
			typeName = "STRING";
			defaultValue = "'Execution'";
		};

		class GVAR(execTabText) {
			displayName = "Tab Text";
			tooltip = "Execution tab text";
			property = QGVAR(execTabText);
			control = "EditMulti5";
			typeName = "STRING";
			defaultValue = "''";
		};
	};
};
