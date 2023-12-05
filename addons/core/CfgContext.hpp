class zen_context_menu_actions {
	class overwriteDisableArsenalOnRespawn {
		displayName = "Enable Arsenal";
		condition = QUOTE(_objects call FUNC(canOverwriteArsenal));
		statement = QUOTE(true); // ToDo
	};
};
