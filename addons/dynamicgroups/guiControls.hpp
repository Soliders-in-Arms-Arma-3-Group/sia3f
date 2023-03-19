#include "\z\sia3f\addons\main\guiDefines.hpp"


// $[1.063,["roleSelectv1",[[0,0,1,1],0.025,0.04,"GUI_GRID"],2,0,0],[1200,"background: ctrlStaticBackground",[1,"",["0.29375 * safezoneW + safezoneX","0.225 * safezoneH + safezoneY","0.4125 * safezoneW","0.55 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1201,"title",[1,"#(argb,8,8,3)color(0.77,0.51,0.08,0.5)",["0.29375 * safezoneW + safezoneX","0.192 * safezoneH + safezoneY","0.4125 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"titleText",[1,"Role Selection",["0.29375 * safezoneW + safezoneX","0.192 * safezoneH + safezoneY","0.407344 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,"orbat: RscTree",[1,"",["0.298906 * safezoneW + safezoneX","0.236 * safezoneH + safezoneY","0.175313 * safezoneW","0.528 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1800,"",[1,"",["0.29375 * safezoneW + safezoneX","0.225 * safezoneH + safezoneY","0.185625 * safezoneW","0.55 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1100,"roleName",[1,"",["0.505156 * safezoneW + safezoneX","0.236 * safezoneH + safezoneY","0.175313 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1101,"roleDescription",[1,"",["0.494844 * safezoneW + safezoneX","0.291 * safezoneH + safezoneY","0.195937 * safezoneW","0.088 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1111,"rank",[1,"",["0.618594 * safezoneW + safezoneX","0.401 * safezoneH + safezoneY","0.0773437 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1102,"rankTitle",[1,"",["0.494844 * safezoneW + safezoneX","0.401 * safezoneH + safezoneY","0.04125 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1103,"loadoutTitle",[1,"",["0.494844 * safezoneW + safezoneX","0.456 * safezoneH + safezoneY","0.128906 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1112,"loadoutPrimary",[1,"",["0.608281 * safezoneW + safezoneX","0.511 * safezoneH + safezoneY","0.0876563 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1104,"loadoutPrimaryTitle",[1,"",["0.494844 * safezoneW + safezoneX","0.511 * safezoneH + safezoneY","0.0876563 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1113,"loadoutLauncher",[1,"",["0.608281 * safezoneW + safezoneX","0.544 * safezoneH + safezoneY","0.0876563 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1105,"loadoutLauncherTitle",[1,"",["0.494844 * safezoneW + safezoneX","0.544 * safezoneH + safezoneY","0.0876563 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1114,"loadoutSecondary",[1,"",["0.608281 * safezoneW + safezoneX","0.577 * safezoneH + safezoneY","0.0876563 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1106,"loadoutSecondaryTitle",[1,"",["0.494844 * safezoneW + safezoneX","0.577 * safezoneH + safezoneY","0.0876563 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1115,"loadoutUniform",[1,"",["0.608281 * safezoneW + safezoneX","0.621 * safezoneH + safezoneY","0.0876563 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1107,"loadoutUniformTitle",[1,"",["0.494844 * safezoneW + safezoneX","0.621 * safezoneH + safezoneY","0.0876563 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1116,"loadoutVest",[1,"",["0.608281 * safezoneW + safezoneX","0.654 * safezoneH + safezoneY","0.0876563 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1108,"loadoutVestTitle",[1,"",["0.494844 * safezoneW + safezoneX","0.654 * safezoneH + safezoneY","0.0876563 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1117,"loadoutBackpack",[1,"",["0.608281 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.0876563 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1109,"loadoutBackpackTitle",[1,"",["0.494844 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.0876563 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1118,"loadoutHeadgear",[1,"",["0.608281 * safezoneW + safezoneX","0.72 * safezoneH + safezoneY","0.0876563 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1110,"loadoubHeadgearTitle",[1,"",["0.494844 * safezoneW + safezoneX","0.72 * safezoneH + safezoneY","0.0876563 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2700,"cancel",[1,"",["0.29375 * safezoneW + safezoneX","0.786 * safezoneH + safezoneY","0.0773437 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2600,"selectRole",[1,"SELECT ROLE",["0.628906 * safezoneW + safezoneX","0.786 * safezoneH + safezoneY","0.0773437 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]

/*
	example init script (manually adding all of the things):

	createDialog "sia3f_dynamicgroups_roleSelect1";
	private _treeCtrl = (findDisplay 8502) displayCtrl 1001;
	private _index = _treeCtrl tvAdd [[], "Alpha"];
	_treeCtrl tvAdd [[_index], "Squad Leader"];
	_treeCtrl tvAdd [[_index], "Team Leader"];
	_treeCtrl tvAdd [[_index], "Rifleman"];
	_treeCtrl tvAdd [[_index], "Autorifleman"];
	_index = _treeCtrl tvAdd [[], "Bravo"];
	_treeCtrl tvAdd [[_index], "Squad Leader"];
	_treeCtrl tvAdd [[_index], "Grenadier"];
	_treeCtrl tvAdd [[_index], "Marksman"];
	_treeCtrl tvAdd [[_index], "Rifleman"];

	private _ctrl = (findDisplay 8502) displayCtrl 1100;
	_ctrl ctrlSetStructuredText parseText "<t align='center' font='PuristaBold' size='1.6'>Rifleman</t>";
	_ctrl = (findDisplay 8502) displayCtrl 1101;
	_ctrl ctrlSetStructuredText parseText "<t align='center' font='PuristaLight'>The rifleman doesn't really do anything and is a super boring role</t>";
	_ctrl = (findDisplay 8502) displayCtrl 1102;
	_ctrl ctrlSetStructuredText parseText "<t font='PuristaLight' valign='bottom' alight='left'>Rank</t>";
	_ctrl = (findDisplay 8502) displayCtrl 1111;
	_ctrl ctrlSetStructuredText parseText "<t font='PuristaLight' valign='bottom' alight='right'><img size='0.8' image='a3\ui_f\data\gui\cfg\ranks\Private_gs.paa'/> Private</t>";
	_ctrl = (findDisplay 8502) displayCtrl 1103;
	_ctrl ctrlSetStructuredText parseText "<t font='PuristaBold' size='1.2'>DEFAULT LOADOUT</t>";
	_ctrl = (findDisplay 8502) displayCtrl 1104;
	_ctrl ctrlSetStructuredText parseText "<t font='PuristaLight' valign='bottom' alight='left'>Primary</t>";
	_ctrl = (findDisplay 8502) displayCtrl 1112;
	_ctrl ctrlSetStructuredText parseText "<t font='PuristaBold' valign='bottom' alight='right'>MX 6.5 mm</t>";
	_ctrl = (findDisplay 8502) displayCtrl 1105;
	_ctrl ctrlSetStructuredText parseText "<t font='PuristaLight' valign='bottom' alight='left'>Launcher</t>";
	_ctrl = (findDisplay 8502) displayCtrl 1113;
	_ctrl ctrlSetStructuredText parseText "<t font='PuristaBold' valign='bottom' alight='right'>-</t>";
	_ctrl = (findDisplay 8502) displayCtrl 1106;
	_ctrl ctrlSetStructuredText parseText "<t font='PuristaLight' valign='bottom' alight='left'>Secondary</t>";
	_ctrl = (findDisplay 8502) displayCtrl 1114;
	_ctrl ctrlSetStructuredText parseText "<t font='PuristaBold' valign='bottom' alight='right'>P07 9 mm</t>";
	_ctrl = (findDisplay 8502) displayCtrl 1107;
	_ctrl ctrlSetStructuredText parseText "<t font='PuristaLight' valign='bottom' alight='left'>Uniform</t>";
	_ctrl = (findDisplay 8502) displayCtrl 1115;
	_ctrl ctrlSetStructuredText parseText "<t font='PuristaBold' valign='bottom' alight='right'>Combat Fatigues (MTP)</t>";
	_ctrl = (findDisplay 8502) displayCtrl 1108;
	_ctrl ctrlSetStructuredText parseText "<t font='PuristaLight' valign='bottom' alight='left'>Vest</t>";
	_ctrl = (findDisplay 8502) displayCtrl 1116;
	_ctrl ctrlSetStructuredText parseText "<t font='PuristaBold' valign='bottom' alight='right'>Carrier Lite (Green)</t>";
	_ctrl = (findDisplay 8502) displayCtrl 1109;
	_ctrl ctrlSetStructuredText parseText "<t font='PuristaLight' valign='bottom' alight='left'>Backpack</t>";
	_ctrl = (findDisplay 8502) displayCtrl 1117;
	_ctrl ctrlSetStructuredText parseText "<t font='PuristaBold' valign='bottom' alight='right'>-</t>";
	_ctrl = (findDisplay 8502) displayCtrl 1110;
	_ctrl ctrlSetStructuredText parseText "<t font='PuristaLight' valign='bottom' alight='left'>Headgear</t>";
	_ctrl = (findDisplay 8502) displayCtrl 1118;
	_ctrl ctrlSetStructuredText parseText "<t font='PuristaBold' valign='bottom' alight='right'>Combat Helmet</t>";
*/


class GVAR(roleSelect1) {
	idd = 8502;

	class controls {
		DISABLE_BACKGROUND
		class background: ctrlStaticBackground
		{
			idc = 1200;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class title: RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(0.77,0.51,0.08,0.5)";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class titleText: RscText
		{
			idc = 1000;
			text = "Role Selection"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.407344 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class orbat: RscTree
		{
			idc = 1001;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.528 * safezoneH;
		};
		class RscFrame_1800: RscFrame
		{
			idc = 1800;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class roleName: RscStructuredText
		{
			idc = 1100;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class roleDescription: RscStructuredText
		{
			idc = 1101;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class rank: RscStructuredText
		{
			idc = 1111;
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class rankTitle: RscStructuredText
		{
			idc = 1102;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class loadoutTitle: RscStructuredText
		{
			idc = 1103;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class loadoutPrimary: RscStructuredText
		{
			idc = 1112;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class loadoutPrimaryTitle: RscStructuredText
		{
			idc = 1104;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class loadoutLauncher: RscStructuredText
		{
			idc = 1113;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class loadoutLauncherTitle: RscStructuredText
		{
			idc = 1105;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class loadoutSecondary: RscStructuredText
		{
			idc = 1114;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class loadoutSecondaryTitle: RscStructuredText
		{
			idc = 1106;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class loadoutUniform: RscStructuredText
		{
			idc = 1115;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class loadoutUniformTitle: RscStructuredText
		{
			idc = 1107;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class loadoutVest: RscStructuredText
		{
			idc = 1116;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class loadoutVestTitle: RscStructuredText
		{
			idc = 1108;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class loadoutBackpack: RscStructuredText
		{
			idc = 1117;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class loadoutBackpackTitle: RscStructuredText
		{
			idc = 1109;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class loadoutHeadgear: RscStructuredText
		{
			idc = 1118;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class loadoubHeadgearTitle: RscStructuredText
		{
			idc = 1110;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class cancel: RscButtonMenuCancel
		{
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class selectRole: RscButtonMenuOK
		{
			text = "SELECT ROLE"; //--- ToDo: Localize;
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

// $[1.063,["roleSelectTest",[[0,0,1,1],0.025,0.04,"GUI_GRID"],2,0,0],[1200,"header_background",[1,"#(argb,8,8,3)color(0,0,0,0.5)",["0 * safezoneW + safezoneX","0 * safezoneH + safezoneY","1 * safezoneW","0.1 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1100,"header_opName",[1,"",["0.0410937 * safezoneW + safezoneX","0.016 * safezoneH + safezoneY","0.366094 * safezoneW","0.066 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1101,"header_factionName",[1,"",["0.587656 * safezoneW + safezoneX","0.016 * safezoneH + safezoneY","0.366094 * safezoneW","0.066 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1201,"squadSelect_background",[1,"#(argb,8,8,3)color(0,0,0,0.5)",["0.0153125 * safezoneW + safezoneX","0.17 * safezoneH + safezoneY","0.221719 * safezoneW","0.737 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"squadSelect_text",[1,"SQUADS",["0.0116562 * safezoneW + safezoneX","0.137 * safezoneH + safezoneY","0.221719 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","1.25"],[]],[1003,"squadSelect: RscTree",[1,"",["0.025625 * safezoneW + safezoneX","0.192 * safezoneH + safezoneY","0.201094 * safezoneW","0.693 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1202,"roleSelect_background",[1,"#(argb,8,8,3)color(0,0,0,0.5)",["0.248344 * safezoneW + safezoneX","0.17 * safezoneH + safezoneY","0.185625 * safezoneW","0.737 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,"roleSelect_text",[1,"ROLE SELECT",["0.244187 * safezoneW + safezoneX","0.137 * safezoneH + safezoneY","0.185625 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","1.25"],[]],[1500,"roleSelect",[1,"",["0.257656 * safezoneW + safezoneX","0.192 * safezoneH + safezoneY","0.165 * safezoneW","0.693 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1203,"loadout_background",[1,"#(argb,8,8,3)color(0,0,0,0.5)",["0.443281 * safezoneW + safezoneX","0.17 * safezoneH + safezoneY","0.273281 * safezoneW","0.737 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"loadout_text",[1,"LOADOUT - ROLE NAME",["0.439325 * safezoneW + safezoneX","0.137 * safezoneH + safezoneY","0.273281 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","1.25"],[]],[1102,"loadout",[1,"",["0.453594 * safezoneW + safezoneX","0.192 * safezoneH + safezoneY","0.252656 * safezoneW","0.693 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2700,"cancel",[1,"",["0.0153125 * safezoneW + safezoneX","0.929 * safezoneH + safezoneY","0.0773437 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2600,"selectRole",[1,"SELECT ROLE",["0.907344 * safezoneW + safezoneX","0.929 * safezoneH + safezoneY","0.0773437 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]

class GVAR(roleSelect2) {
	idd = 8503;
	onLoad = QUOTE(_this call FUNC(roleSelectOnLoad));
	onMouseButtonDown = QUOTE([ARR_3(_this # 1, _this # 2, _this # 3)] call FUNC(roleSelectOnMBDown););
	onMouseButtonUp = QUOTE(_this # 1 call FUNC(roleSelectOnMBUp););

	class ControlsBackground {
		class mouseArea: ctrlStatic {
			idc = IDC_mouseArea;
			style = 16;
			onMouseMoving = QUOTE(_this call FUNC(handleMouse););
			onMouseHolding = QUOTE(_this call FUNC(handleMouse););
			onMouseZChanged = QUOTE(_this # 1 call FUNC(handleScrollWheel););
			x = QUOTE(safezoneX);
			y = QUOTE(safezoneY);
			w = QUOTE(safezoneW);
			h = QUOTE(safezoneH);
		};
	};

	class controls {
		class header_background: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(0,0,0,0.5)";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class header_opName: RscStructuredText
		{
			idc = 1100;
			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.366094 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class header_factionName: RscStructuredText
		{
			idc = 1101;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.366094 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class squadSelect_background: RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(0,0,0,0.5)";
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.737 * safezoneH;
		};
		class squadSelect_text: RscText
		{
			idc = 1000;
			text = "SQUADS"; //--- ToDo: Localize;
			x = 0.0116562 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 1.25 * GUI_GRID_H;
		};
		class squadSelect: RscTree
		{
			idc = 1003;
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.693 * safezoneH;
		};
		class roleSelect_background: RscPicture
		{
			idc = 1202;
			text = "#(argb,8,8,3)color(0,0,0,0.5)";
			x = 0.248344 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.737 * safezoneH;
		};
		class roleSelect_text: RscText
		{
			idc = 1001;
			text = "ROLE SELECT"; //--- ToDo: Localize;
			x = 0.244187 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 1.25 * GUI_GRID_H;
		};
		class roleSelect: RscListbox
		{
			idc = 1500;
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.693 * safezoneH;
		};
		class loadout_background: RscPicture
		{
			idc = 1203;
			text = "#(argb,8,8,3)color(0,0,0,0.5)";
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.737 * safezoneH;
		};
		class loadout_text: RscText
		{
			idc = 1002;
			text = "LOADOUT - ROLE NAME"; //--- ToDo: Localize;
			x = 0.439325 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 1.25 * GUI_GRID_H;
		};
		class loadout: RscStructuredText
		{
			idc = 1102;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.693 * safezoneH;
		};
		class cancel: RscButtonMenuCancel
		{
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class selectRole: RscButtonMenuOK
		{
			text = "SELECT ROLE"; //--- ToDo: Localize;
			x = 0.907344 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
