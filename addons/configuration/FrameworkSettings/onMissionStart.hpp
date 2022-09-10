class GVAR(onMissionStart) {
	collapsed = 1;
	displayName = "On Mission Start";
	class Attributes {
		class GVAR(onMissionStartCode) {
			displayName = "On Mission Start Code";
			tooltip = "Insert code to be executed on mission start.";
			property = QGVAR(onMissionStartCode);
			control = "EditMulti5";
			defaultValue = "''";
			validate = "expression";
			typeName = "STRING";
		};
	};
};
