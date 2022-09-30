class GVAR(aceActionOptions) {
	collapsed = 1;
	displayName = "ACE Actions Options";
	class Attributes {
		class GVAR(enableTPMenu) {
			displayName = "Teleport Menu";
			tooltip = "Enable 'Teleport Menu' on ACE Buttons.";
			property = QGVAR(enableTPMenu);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(enableTPToSquad) {
			displayName = "Teleport to Squad";
			tooltip = "Enable 'Teleport to Squad' on ACE Buttons.";
			property = QGVAR(enableTPToSquad);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(enableManageKit) {
			displayName = "Kit Manager";
			tooltip = "Enable 'Manage Kit' on ACE Buttons.";
			property = QGVAR(enableManageKit);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(enableLoadoutInfo) {
			displayName = "Loadout Information";
			tooltip = "Enable 'Update Loadout Info' on ACE Buttons.";
			property = QGVAR(enableLoadoutInfo);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(enableGoAFK) {
			displayName = "Go AFK";
			tooltip = "Enable Self ACE Action to go AFK.";
			property = QGVAR(enableGoAFK);
			control = "Checkbox";
			defaultValue = true;
		};
	};
};
