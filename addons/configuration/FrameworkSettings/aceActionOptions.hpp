class GVAR(aceActionOptions) {
	collapsed = 1;
	displayName = "ACE Actions Options";
	class Attributes {
		class GVAR(enableTPMenu) {
			displayName = "Enable TP Menu";
			tooltip = "Enable 'Teleport Menu' on ACE Buttons";
			property = QGVAR(enableTPMenu);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(enableTPToSquad) {
			displayName = "Enable TP To Squad";
			tooltip = "Enable 'Teleport to Squad' on ACE Buttons";
			property = QGVAR(enableTPToSquad);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(enableManageKit) {
			displayName = "Enable Manage Kit";
			tooltip = "Enable 'Manage Kit' on ACE Buttons";
			property = QGVAR(enableManageKit);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(enableLoadoutInfo) {
			displayName = "Enable Loadout Info";
			tooltip = "Enable 'Update Loadout Info' on ACE Buttons";
			property = QGVAR(enableLoadoutInfo);
			control = "Checkbox";
			defaultValue = true;
		};

		class GVAR(enableGoAFK) {
			displayName = "Enable Go AFK";
			tooltip = "Enable Self ACE Action to go AFK";
			property = QGVAR(enableGoAFK);
			control = "Checkbox";
			defaultValue = true;
		};
	};
};
