class GVAR(missionInfo) {
	collapsed = 0;
	displayName = "Mission Info";
	class Attributes {
		class GVAR(missionLocationName) {
			displayName = "Mission Location Name";
			property = QGVAR(missionLocationName);
			control = "Edit";
			defaultValue = "''";
		};

		class GVAR(westFactionName) {
			displayName = "Blufor Faction Name";
			property = QGVAR(westFactionName);
			control = "Edit";
			defaultValue = "''";
		};

		class GVAR(independentFactionName) {
			displayName = "Independent Faction Name";
			property = QGVAR(independentFactionName);
			control = "Edit";
			defaultValue = "''";
		};

		class GVAR(eastFactionName) {
			displayName = "Opfor Faction Name";
			property = QGVAR(eastFactionName);
			control = "Edit";
			defaultValue = "''";
		};

		class GVAR(showStatusHint) {
			displayName = "Show Status Hint";
			tooltip = "Toggle persistent info display.";
			property = QGVAR(showStatusHint);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(showIntroText) {
			displayName = "Show Intro Text";
			tooltip = "Show cinematic intro text on mission start.";
			property = QGVAR(showIntroText);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(showReplay) {
			displayName = "Show Replay";
			tooltip = "Record and playback the mission using the GRAD Replay system.";
			property = QGVAR(showReplay);
			control = "Checkbox";
			defaultValue = true;
		};
	};
};