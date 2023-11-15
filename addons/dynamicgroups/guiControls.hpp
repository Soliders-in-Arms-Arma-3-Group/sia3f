#include "\z\sia3f\addons\main\guiDefines.hpp"

// Note: not able to load in multiplayer...
// $[1.063,["roleSelectTest",[[0,0,1,1],0.025,0.04,"GUI_GRID"],2,0,0],[1200,"header_background",[1,"#(argb,8,8,3)color(0,0,0,0.5)",["0 * safezoneW + safezoneX","0 * safezoneH + safezoneY","1 * safezoneW","0.1 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1100,"header_opName",[1,"",["0.0410937 * safezoneW + safezoneX","0.016 * safezoneH + safezoneY","0.366094 * safezoneW","0.066 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1101,"header_factionName",[1,"",["0.587656 * safezoneW + safezoneX","0.016 * safezoneH + safezoneY","0.366094 * safezoneW","0.066 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1201,"squadSelect_background",[1,"#(argb,8,8,3)color(0,0,0,0.5)",["0.0153125 * safezoneW + safezoneX","0.17 * safezoneH + safezoneY","0.221719 * safezoneW","0.737 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1204,"squadSelect_textBackground",[1,"#(argb,8,8,3)color(0.77,0.51,0.08,0.5)",["0.0153125 * safezoneW + safezoneX","0.132 * safezoneH + safezoneY","0.221719 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"squadSelect_text",[1,"SQUADS",["0.0153125 * safezoneW + safezoneX","0.132 * safezoneH + safezoneY","0.216563 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","1"],[]],[1003,"squadSelect: RscTree",[1,"",["0.025625 * safezoneW + safezoneX","0.192 * safezoneH + safezoneY","0.201094 * safezoneW","0.693 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1202,"roleSelect_background",[1,"#(argb,8,8,3)color(0,0,0,0.5)",["0.248344 * safezoneW + safezoneX","0.17 * safezoneH + safezoneY","0.185625 * safezoneW","0.737 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1205,"roleSelect_textBackground",[1,"#(argb,8,8,3)color(0.77,0.51,0.08,0.5)",["0.247344 * safezoneW + safezoneX","0.132 * safezoneH + safezoneY","0.1866 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,"roleSelect_text",[1,"ROLE SELECT",["0.247344 * safezoneW + safezoneX","0.132 * safezoneH + safezoneY","0.180469 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","1"],[]],[1500,"roleSelect",[1,"",["0.257656 * safezoneW + safezoneX","0.192 * safezoneH + safezoneY","0.165 * safezoneW","0.693 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1203,"loadout_background",[1,"#(argb,8,8,3)color(0,0,0,0.5)",["0.443281 * safezoneW + safezoneX","0.17 * safezoneH + safezoneY","0.273281 * safezoneW","0.737 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1206,"loadout_textBackground",[1,"#(argb,8,8,3)color(0.77,0.51,0.08,0.5)",["0.443281 * safezoneW + safezoneX","0.132 * safezoneH + safezoneY","0.273281 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"loadout_text",[1,"LOADOUT - ROLE NAME",["0.443281 * safezoneW + safezoneX","0.132 * safezoneH + safezoneY","0.268125 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","1"],[]],[1102,"loadout",[1,"",["0.453594 * safezoneW + safezoneX","0.192 * safezoneH + safezoneY","0.252656 * safezoneW","0.693 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2700,"cancel",[1,"",["0.0153125 * safezoneW + safezoneX","0.929 * safezoneH + safezoneY","0.0773437 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2600,"selectRole",[1,"SELECT ROLE",["0.907344 * safezoneW + safezoneX","0.929 * safezoneH + safezoneY","0.0773437 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]

// v2: $[1.063,["roleSelectTest",[[0,0,1,1],0.025,0.04,"GUI_GRID"],2,0,0],[1200,"header_background",[1,"#(argb,8,8,3)color(0,0,0,0.5)",["0 * safezoneW + safezoneX","0 * safezoneH + safezoneY","1 * safezoneW","0.1 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1100,"header_opName",[1,"",["0.0410937 * safezoneW + safezoneX","0.016 * safezoneH + safezoneY","0.366094 * safezoneW","0.066 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1101,"header_factionName",[1,"",["0.587656 * safezoneW + safezoneX","0.016 * safezoneH + safezoneY","0.366094 * safezoneW","0.066 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1201,"squadSelect_background",[1,"#(argb,8,8,3)color(0,0,0,0.5)",["0.0153125 * safezoneW + safezoneX","0.17 * safezoneH + safezoneY","0.195937 * safezoneW","0.737 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1204,"squadSelect_textBackground",[1,"#(argb,8,8,3)color(0.77,0.51,0.08,0.5)",["0.0153125 * safezoneW + safezoneX","0.132 * safezoneH + safezoneY","0.195937 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"squadSelect_text",[1,"SQUADS",["0.0153125 * safezoneW + safezoneX","0.132 * safezoneH + safezoneY","0.190781 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","1"],[]],[1003,"squadSelect: RscTree",[1,"",["0.025625 * safezoneW + safezoneX","0.192 * safezoneH + safezoneY","0.175313 * safezoneW","0.693 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1202,"roleSelect_background",[1,"#(argb,8,8,3)color(0,0,0,0.5)",["0.221562 * safezoneW + safezoneX","0.17 * safezoneH + safezoneY","0.165 * safezoneW","0.737 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1205,"roleSelect_textBackground",[1,"#(argb,8,8,3)color(0.77,0.51,0.08,0.5)",["0.221562 * safezoneW + safezoneX","0.132 * safezoneH + safezoneY","0.165 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,"roleSelect_text",[1,"ROLE SELECT",["0.221562 * safezoneW + safezoneX","0.132 * safezoneH + safezoneY","0.159844 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","1"],[]],[1500,"roleSelect",[1,"",["0.231875 * safezoneW + safezoneX","0.192 * safezoneH + safezoneY","0.144375 * safezoneW","0.693 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1203,"loadout_background",[1,"#(argb,8,8,3)color(0,0,0,0.5)",["0.613437 * safezoneW + safezoneX","0.17 * safezoneH + safezoneY","0.366094 * safezoneW","0.737 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1206,"loadout_textBackground",[1,"#(argb,8,8,3)color(0.77,0.51,0.08,0.5)",["0.613437 * safezoneW + safezoneX","0.126 * safezoneH + safezoneY","0.366094 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"loadout_text",[1,"LOADOUT - ROLE NAME",["0.618593 * safezoneW + safezoneX","0.126 * safezoneH + safezoneY","0.360937 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","1"],[]],[1102,"loadout",[1,"",["0.62375 * safezoneW + safezoneX","0.192 * safezoneH + safezoneY","0.345469 * safezoneW","0.693 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2700,"cancel",[1,"",["0.0153125 * safezoneW + safezoneX","0.929 * safezoneH + safezoneY","0.0773437 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2600,"selectRole",[1,"SELECT ROLE",["0.907344 * safezoneW + safezoneX","0.929 * safezoneH + safezoneY","0.0773437 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]

// ToDo make sure the positions are defined with safezone, not GUI_GRID
class GVAR(roleSelect) {
	idd = 8503;
	onLoad = QUOTE(_this call FUNC(roleSelectOnLoad););
	onUnload = QUOTE(_this call FUNC(roleSelectOnUnload););
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
		class squadSelect_textBackground: RscPicture
		{
			idc = 1204;
			text = "#(argb,8,8,3)color(0.77,0.51,0.08,0.5)";
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.132 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class squadSelect_text: RscText
		{
			idc = 1000;
			text = "SQUADS"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.132 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 0.028 * safezoneH;
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
		class roleSelect_textBackground: RscPicture
		{
			idc = 1205;
			text = "#(argb,8,8,3)color(0.77,0.51,0.08,0.5)";
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.132 * safezoneH + safezoneY;
			w = 0.1866 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class roleSelect_text: RscText
		{
			idc = 1001;
			text = "ROLE SELECT"; //--- ToDo: Localize;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.132 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 0.028 * safezoneH;
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
		class loadout_textBackground: RscPicture
		{
			idc = 1206;
			text = "#(argb,8,8,3)color(0.77,0.51,0.08,0.5)";
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.132 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class loadout_text: RscText
		{
			idc = 1002;
			text = "LOADOUT - ROLE NAME"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.132 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 0.028 * safezoneH;
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
