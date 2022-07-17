class GVAR(briefing) { 
	collapsed = 0;
	displayName = "Briefing";
	class Attributes {
		class GVAR(situation) {
			displayName = "Situation";
			tooltip = "Briefing Situation tab text.";
			property = QGVAR(situation);
			control = "EditMulti5";
			typeName = "STRING";
			defaultValue = "''";
		};

		class GVAR(mission) {
			displayName = "Mission";
			tooltip = "Briefing Mission tab text.";
			property = QGVAR(mission);
			control = "EditMulti5";
			typeName = "STRING";
			defaultValue = "''";
		};

		class GVAR(execution) {
			displayName = "Execution";
			tooltip = "Briefing Execution tab text.";
			property = QGVAR(execution);
			control = "EditMulti5";
			typeName = "STRING";
			defaultValue = "''";
		};

		class GVAR(support) {
			displayName = "Support";
			tooltip = "Briefing Support tab text.";
			property = QGVAR(support);
			control = "EditMulti5";
			typeName = "STRING";
			defaultValue = "''";
		};
		
		class GVAR(signal) {
			displayName = "Signal";
			tooltip = "Briefing Signal tab text.";
			property = QGVAR(signal);
			control = "EditMulti5";
			typeName = "STRING";
			defaultValue = "''";
		};
	};
};
