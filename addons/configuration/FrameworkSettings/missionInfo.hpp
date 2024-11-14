class GVAR(missionInfo) {
	collapsed = 0;
	displayName = "Mission Info";
	class Attributes {
		class GVAR(missionLocationName) {
			displayName = "Mission Location Name";
			tooltip = "Optional custom name for location of the mission\n\nIf blank, the name of the map will be used by default instead";
			property = QGVAR(missionLocationName);
			control = "Edit";
			defaultValue = "''";
		};

		class GVAR(westFactionName) {
			displayName = "Blufor Faction Name";
			tooltip = "Optional custom faction name for the BLUFOR players\n\nNo effect if there are no players are on this side";
			property = QGVAR(westFactionName);
			control = "Edit";
			defaultValue = "''";
		};

		class GVAR(independentFactionName) {
			displayName = "Independent Faction Name";
			tooltip = "Optional custom faction name for the Independent players\n\nNo effect if there are no players are on this side";
			property = QGVAR(independentFactionName);
			control = "Edit";
			defaultValue = "''";
		};

		class GVAR(eastFactionName) {
			displayName = "Opfor Faction Name";
			tooltip = "Optional custom faction name for the OPFOR players\n\nNo effect if there are no players are on this side";
			property = QGVAR(eastFactionName);
			control = "Edit";
			defaultValue = "''";
		};

		class GVAR(showSafestartHint) {
			displayName = "Show SafeStart Hint";
			tooltip = "Toggle persistent info display";
			property = QGVAR(showSafestartHint);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(enableSafestartSafety) {
			displayName = "Enable SafeStart Safety";
			tooltip = "Toggle the weapon, throwable, and explosive safety system";
			property = QGVAR(enableSafestartSafety);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(showIntroText) {
			displayName = "Show Intro Text";
			tooltip = "Show cinematic intro text on mission start";
			property = QGVAR(showIntroText);
			control = "Checkbox";
			defaultValue = true;
		};
	};
};
