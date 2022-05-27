class ctrlMenuStrip;
class display3DEN { // https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Menu_Bar#Scenario_Attributes
	class Controls {
		class MenuStrip: ctrlMenuStrip {
			class Items {
				items[] += { "SIA_FrameworkFolder" };
				class SIA_FrameworkFolder {
					text = "SIA Mission Framework";
					items[] += { "SIA_MissionSettings" };
				};
				class SIA_MissionSettings {
					text = "Mission Settings"; // Item text
					action = "edit3DENMissionAttributes 'SIA_FrameworkSettings';";
                    opensNewWindow = 1; // Adds ... to the name of the menu entry, indicating the user that a new window will be opened.
				};
			};
		};
	};
};
