class GVAR(onMissionStart) {
	collapsed = 1;
	displayName = "On Mission Start";
	class Attributes {
		class GVAR(onMissionStartCode) {
			displayName = "On Mission Start Code";
			tooltip = "Insert code to be executed on Zeus mission start.";
			property = QGVAR(onMissionStartCode);
			control = "EditCodeMulti5";
			defaultValue = "''";
			validate = "expression";
			typeName = "STRING";
		};
	};
};
