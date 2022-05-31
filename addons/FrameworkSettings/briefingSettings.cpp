class SIA_briefingSettings {
	collapsed = 1;
	displayName = "Briefing Additional Settings";
	class Attributes {
		class SIA_briefingSettings_briefORBAT {
			displayName = "ORBAT Briefing";
			tooltip = "Add ORBAT information to briefing.";
			property = "SIA_briefORBAT";
			control = "Checkbox";
			defaultValue = true;
		};

		class SIA_briefingSettings_briefWeather {
			displayName = "Weather Briefing";
			tooltip = "Add weather report to briefing.";
			property = "SIA_briefWeather";
			control = "Checkbox";
			defaultValue = true;
		};

		class SIA_briefingSettings_briefLoadout {
			displayName = "Loadout Information";
			tooltip = "Add loadout information to briefing.";
			property = "SIA_briefLoadout";
			control = "Checkbox";
			defaultValue = true;
		};
	};
};