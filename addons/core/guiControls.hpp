#include "\z\sia3f\addons\main\guiDefines.hpp"

//GUI and script related macros
#include "\a3\3DEN\UI\macros.inc"

#define CTRL_DEFAULT_H (SIZE_M * GRID_H)
#define DIALOG_W 80
#define DIALOG_Y (safezoneY + 2 * CTRL_DEFAULT_H)

class GVAR(TPD_teleport)
{
	idd = -1;
	onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(TPD_Display), _this select 0)];['onLoad', nil, _this select 0] spawn FUNC(teleport));
	class controlsBackground
	{
		class headline: ctrlStaticTitle
		{
			text = "Locations";
			x = 0.5 - DIALOG_W / 2 * GRID_W;
			y = DIALOG_Y;
			w = DIALOG_W * GRID_W;
			h = CTRL_DEFAULT_H;
		};
		class background: ctrlStaticBackground
		{
			x = 0.5 - DIALOG_W / 2 * GRID_W;
			y = DIALOG_Y + CTRL_DEFAULT_H;
			w = DIALOG_W * GRID_W;
			h = 67 * GRID_H;
		};
	};
	class controls
	{
		class locations: ctrlListBox
		{
			idc = 10;
			x = 0.5 - DIALOG_W / 2 * GRID_W + GRID_W;
			y = DIALOG_Y + CTRL_DEFAULT_H + GRID_H;
			w = DIALOG_W * GRID_W - 2 * GRID_W;
			h = 59 * GRID_H;
		};
		class teleport: ctrlButton
		{
			text = "MOVE";
			x = 0.5 - DIALOG_W / 2 * GRID_W + GRID_W;
			y = DIALOG_Y + 66 * GRID_H;
			w = DIALOG_W / 3 * GRID_W - 2 * GRID_W;
			h = CTRL_DEFAULT_H;
			onButtonClick = QUOTE(['teleport', nil, _this select 0] spawn FUNC(teleport));
		};
		class preview: teleport
		{
			text = "PREVIEW";
			x = 0.5 + DIALOG_W / 3 * GRID_W - DIALOG_W / 2 * GRID_W + GRID_W;
			onButtonClick = QUOTE(['previewPosition', nil, _this select 0] call FUNC(teleport));
		};
		class close: teleport
		{
			idc= 1;
			text = "CLOSE";
			x = 0.5 + DIALOG_W / 2 * GRID_W - DIALOG_W / 3 * GRID_W + GRID_W;
			onButtonClick = "";
		};
	};
};


class GVAR(goAFK) {
	onUnload = QUOTE(call FUNC(goAFK));
	idd = 3289;
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
			action = QUOTE(closeDialog 2; spawn FUNC(teleportToSquad););

			text = "Exit & TP"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Exit AFK state and teleport to squad"; //--- ToDo: Localize;
		};
	};
};
