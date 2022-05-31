class SIA_MissionInfo {
	collapsed = 0;
	displayName = "Mission Info";
	class Attributes {
		class SIA_MissionInfo_missionLocationName {
			displayName = "Mission Location Name";
			property = "SIA_missionLocationName";
			control = "Edit";
			defaultValue = "''";
		};

		class SIA_MissionInfo_bluforFactionName {
			displayName = "Blufor Faction Name";
			property = "SIA_bluforFactionName";
			control = "Edit";
			defaultValue = "''";
		};

		class SIA_MissionInfo_indepFactionName {
			displayName = "Independent Faction Name";
			property = "SIA_indepFactionName";
			control = "Edit";
			defaultValue = "''";
		};

		class SIA_MissionInfo_opforFactionName {
			displayName = "Opfor Faction Name";
			property = "SIA_opforFactionName";
			control = "Edit";
			defaultValue = "''";
		};

		class SIA_MissionInfo_showStatusHint {
			displayName = "Show Status Hint";
			tooltip = "Toggle persistent info display.";
			property = "SIA_showStatusHint";
			control = "Checkbox";
			defaultValue = true;
		};

		class SIA_MissionInfo_showIntroText {
			displayName = "Show Intro Text";
			tooltip = "Show cinematic intro text on mission start.";
			property = "SIA_showIntroText";
			control = "Checkbox";
			defaultValue = true;
		};

		class SIA_MissionInfo_showReplay {
			displayName = "Show Replay";
			tooltip = "Record and playback the mission using the GRAD Replay system.";
			property = "SIA_showReplay";
			control = "Checkbox";
			defaultValue = true;
		};
	};
};