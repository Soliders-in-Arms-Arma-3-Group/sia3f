class ctrlMenuStrip;
class display3DEN { // https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Menu_Bar#Scenario_Attributes
	class Controls {
		class MenuStrip: ctrlMenuStrip {
			class Items {
				items[] += { "SIA_FrameworkFolder" };
				class SIA_FrameworkFolder {
					text = "SIA Mission Framework";
					items[] = { "SIA_MissionSettings", "SIA_ImportExportFolder", "SIA_FrameworkMeta" };
				};
				class SIA_MissionSettings {
					text = "Mission Settings"; // Item text
					action = "edit3DENMissionAttributes 'SIA_FrameworkSettings';";
                    opensNewWindow = 1; // Adds ... to the name of the menu entry, indicating the user that a new window will be opened.
				};

				class SIA_ImportExportFolder {
					text = "Import/Export Mission Settings";
					items[] = { "SIA_Import", "SIA_Export" };
				};

				class SIA_Import {
					text = "Import Mission Settings";
				};

				class SIA_Export {
					text = "Export Mission Settings";
				};

				class SIA_FrameworkMeta {
					text = "Framework Version 0.1.0";
					weblink = "https://github.com/Soliders-in-Arms-Arma-3-Group/SIA_3DEN_framework";
					opensNewWindow = 1;
				};
			};
		};
	};
};
