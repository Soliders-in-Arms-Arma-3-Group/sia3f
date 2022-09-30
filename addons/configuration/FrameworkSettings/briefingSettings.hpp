class GVAR(briefingSettings) {
	collapsed = 1;
	displayName = "Briefing Additional Settings";
	class Attributes {
		class GVAR(briefORBAT) {
			displayName = "Player ORBAT";
			tooltip = "Add ORBAT information to briefing";
			property = QGVAR(briefORBAT);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(briefWeather) {
			displayName = "Weather Information";
			tooltip = "Add weather report to briefing";
			property = QGVAR(briefWeather);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(briefLoadout) {
			displayName = "Loadout Information";
			tooltip = "Add loadout information to briefing";
			property = QGVAR(briefLoadout);
			control = "Checkbox";
			defaultValue = true;
		};
	};
};
