class ctrlMenuStrip;
class display3DEN { // https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Menu_Bar#Scenario_Attributes
	class Controls {
		class MenuStrip: ctrlMenuStrip {
			class Items {
				items[] += { QGVAR(frameworkFolder) };
				class GVAR(frameworkFolder) {
					text = "SIA Mission Framework";
					items[] = { QGVAR(missionSettings), QGVAR(briefingSetup), QGVAR(init), /*QGVAR(importExportFolder),*/ QGVAR(rolesFolder), QGVAR(frameworkMeta) };
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
					action = QUOTE(call FUNC(initFramework));
				};

				class GVAR(importExportFolder) {
					text = "Import/Export Mission Settings";
					items[] = { QGVAR(import), QGVAR(export) };
				};

				class GVAR(import) {
					text = "Import Mission Settings";
				};

				class GVAR(export) {
					text = "Export Mission Settings";
				};

				class GVAR(rolesFolder) {
					text = "Role Configuration";
					items[] = { QGVAR(roleCreate), QGVAR(roleEdit) };
				};

				class GVAR(roleCreate) {
					text = "Create Roles";
					action = "";
                    opensNewWindow = 1;
				};

				class GVAR(roleEdit) {
					text = "Edit Roles";
					action = QUOTE(call FUNC(spawnEditRoles));
                    opensNewWindow = 1;
				};

				class GVAR(frameworkMeta) {
					text = "Framework Version 0.1.0";
					weblink = "https://github.com/Soliders-in-Arms-Arma-3-Group/sia3f";
					opensNewWindow = 1;
				};
			};
		};
	};
};
