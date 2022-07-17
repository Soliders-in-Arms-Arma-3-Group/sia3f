class GVAR(signal) { 
	collapsed = 0;
	displayName = "Signal";
	class Attributes {
		class GVAR(signalTabName) {
			displayName = "Tab Name";
			tooltip = "Name of the tab (default ""Signal"").";
			property = QGVAR(signalTabName);
			control = "Edit";
			typeName = "STRING";
			defaultValue = "'Signal'";
		};

		class GVAR(signalTabText) {
			displayName = "Tab Text";
			tooltip = "Signal tab text.";
			property = QGVAR(signalTabText);
			control = "EditMulti5";
			typeName = "STRING";
			defaultValue = "''";
		};
	};
};
