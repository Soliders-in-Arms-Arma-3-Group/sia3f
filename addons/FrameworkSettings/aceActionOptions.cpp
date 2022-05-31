class SIA_aceActionOptions {
	collapsed = 1;
	displayName = "ACE Actions Options";
	class Attributes {
		class SIA_aceActionOptions_enableTPMenu {
			displayName = "Enable TP Menu";
			tooltip = "Enable 'Teleport Menu' on ACE Buttons.";
			property = "SIA_enableTPMenu";
			control = "Checkbox";
			defaultValue = true;
		};

		class SIA_aceActionOptions_enableTPToSquad {
			displayName = "Enable TP To Squad";
			tooltip = "Enable 'Teleport to Squad' on ACE Buttons.";
			property = "SIA_enableTPToSquad";
			control = "Checkbox";
			defaultValue = true;
		};

		class SIA_aceActionOptions_enableManageKit {
			displayName = "Enable Manage Kit";
			tooltip = "Enable 'Manage Kit' on ACE Buttons.";
			property = "SIA_enableManageKit";
			control = "Checkbox";
			defaultValue = true;
		};

		class SIA_aceActionOptions_enableLoadoutInfo {
			displayName = "Enable Loadout Info";
			tooltip = "Enable 'Update Loadout Info' on ACE Buttons.";
			property = "SIA_enableLoadoutInfo";
			control = "Checkbox";
			defaultValue = true;
		};

		class SIA_aceActionOptions_enableGoAFK {
			displayName = "Enable Go AFK";
			tooltip = "Enable Self ACE Action to go AFK.";
			property = "SIA_enableGoAFK";
			control = "Checkbox";
			defaultValue = true;
		};
	};
};