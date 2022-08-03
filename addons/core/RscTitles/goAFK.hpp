onUnload = "[] spawn sia_f_fnc_exitAFK;";
idd = 3289
class controls {
	class AFK_background: RscPicture
	{
		idc = 1200;

		text = "#(argb,8,8,3)color(0,0,0,0.5)";
		x = 0.407187 * safezoneW + safezoneX;
		y = 0.445 * safezoneH + safezoneY;
		w = 0.185625 * safezoneW;
		h = 0.088 * safezoneH;
	};
	class AFK_title: RscPicture
	{
		idc = 1201;

		text = "#(argb,8,8,3)color(0.77,0.51,0.08,0.5)";
		x = 0.407187 * safezoneW + safezoneX;
		y = 0.412 * safezoneH + safezoneY;
		w = 0.185625 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class AFK_titleText: RscText
	{
		idc = 1000;

		text = "AFK Menu"; //--- ToDo: Localize;
		x = 0.407187 * safezoneW + safezoneX;
		y = 0.412 * safezoneH + safezoneY;
		w = 0.175313 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class AFK_exitButton: RscButton
	{
		idc = 1600;
		colorBackgroundActive[] = {0,0,0,0.7};
		action = "closeDialog 2;";

		text = "Exit"; //--- ToDo: Localize;
		x = 0.427812 * safezoneW + safezoneX;
		y = 0.478 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.022 * safezoneH;
		tooltip = "Exit AFK state at current position"; //--- ToDo: Localize;
	};
	class AFK_exitAndTPButton: RscButton
	{
		idc = 1601;
		colorBackgroundActive[] = {0,0,0,0.7};
		action = "closeDialog 2; [player] spawn sia_f_fnc_teleportToSquad;";

		text = "Exit & TP"; //--- ToDo: Localize;
		x = 0.510312 * safezoneW + safezoneX;
		y = 0.478 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.022 * safezoneH;
		tooltip = "Exit AFK state and teleport to squad"; //--- ToDo: Localize;
	};
};


