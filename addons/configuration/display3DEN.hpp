class ctrlMenuStrip;
class display3DEN { // https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Menu_Bar#Scenario_Attributes
	class Controls {
		class MenuStrip: ctrlMenuStrip {
			class Items {
				items[] += { QGVAR(frameworkFolder) };
				class GVAR(frameworkFolder) {
					text = "SIA Mission Framework";
					items[] = { QGVAR(missionSettings), QGVAR(briefingSetup), QGVAR(init), /*QGVAR(importExportFolder),*/ QGVAR(roleEdit), GVAR(templateLink), QGVAR(frameworkMeta) };
				};

				class GVAR(missionSettings) {
					text = "Mission Settings";
					action = QUOTE(edit3DENMissionAttributes QQGVAR(frameworkSettings););
					opensNewWindow = 1;
				};
 
				class GVAR(briefingSetup) {
					text = "Configure Briefing";
					action = QUOTE(edit3DENMissionAttributes QQGVAR(briefing););
					opensNewWindow = 1;
				};

				class GVAR(init) {
					text = "Initialize Framework";
					action = QUOTE(call FUNC(initFramework););
				};

				class GVAR(importExportFolder) { // ToDo
					text = "Import/Export Mission Settings";
					items[] = { QGVAR(import), QGVAR(export) };
				};

				class GVAR(import) {
					text = "Import Mission Settings";
				};

				class GVAR(export) {
					text = "Export Mission Settings";
				};

				class GVAR(roleEdit) {
					text = "Edit Roles";
					action = QUOTE(call FUNC(editRolesSpawn););
					opensNewWindow = 1;
				};

				class GVAR(templateLink) {
					text = "Template Composition";
					picture = "\a3\3DEN\Data\Controls\ctrlMenu\link_ca.paa";
					weblink = "https://steamcommunity.com/sharedfiles/filedetails/?id=2868675434";
					opensNewWindow = 1;
				};

				class GVAR(frameworkMeta) {
					text = "Framework Version 1.0.4";
					picture = "\a3\3DEN\Data\Controls\ctrlMenu\link_ca.paa";
					weblink = "https://github.com/Soliders-in-Arms-Arma-3-Group/sia3f";
					opensNewWindow = 1;
				};
			};
		};
	};
};
