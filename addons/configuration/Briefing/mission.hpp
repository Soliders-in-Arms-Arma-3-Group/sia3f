class GVAR(mission) { 
	collapsed = 0;
	displayName = "Mission";
	class Attributes {
		class GVAR(missionTabName) {
			displayName = "Tab Name";
			tooltip = "Name of the tab (default ""Mission"")";
			property = QGVAR(missionTabName);
			control = "Edit";
			typeName = "STRING";
			defaultValue = "'Mission'";
		};

		class GVAR(missionTabText) {
			displayName = "Tab Text";
			tooltip = "Mission tab text";
			property = QGVAR(missionTabText);
			control = "EditMulti5";
			typeName = "STRING";
			defaultValue = "''";
		};
	};
};
