#include "\z\sia3f\addons\main\guiDefines.hpp"
/* GUI Editor save (OUTDATED, I forgot to save the latest revision)
$[1.063,["sia3f",[[0,0,1,1],0.025,0.04,"GUI_GRID"],2,0,0],[1200,"sia3f_background",[1,"#(argb,8,8,3)color(0,0,0,0.5)",["0.37625 * safezoneW + safezoneX","0.379 * safezoneH + safezoneY","0.2475 * safezoneW","0.297 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1201,"sia3f_title",[1,"#(argb,8,8,3)color(0.77,0.51,0.08,0.5)",["0.37625 * safezoneW + safezoneX","0.346 * safezoneH + safezoneY","0.2475 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"sia3f_titleText",[1,"Role Editor",["0.37625 * safezoneW + safezoneX","0.346 * safezoneH + safezoneY","0.242344 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1500,"sia3f_roleSelect",[1,"",["0.381406 * safezoneW + safezoneX","0.39 * safezoneH + safezoneY","0.103125 * safezoneW","0.275 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2801,"sia3f_isMedic",[1,"",["0.494844 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.0154688 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"sia3f_additionalItems",[1,"",["0.494844 * safezoneW + safezoneX","0.39 * safezoneH + safezoneY","0.118594 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"sia3f_additionalItemsText",[1,"Edit Additional Items",["0.5 * safezoneW + safezoneX","0.401 * safezoneH + safezoneY","0.108281 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1003,"sia3f_aceOptionsText",[1,"ACE Options",["0.494844 * safezoneW + safezoneX","0.467 * safezoneH + safezoneY","0.118594 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2802,"sia3f_isEngineer",[1,"",["0.494844 * safezoneW + safezoneX","0.533 * safezoneH + safezoneY","0.0154688 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1004,"sia3f_isMedicText",[1,"Is Medic",["0.510312 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.108281 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1005,"sia3f_isEngineerText",[1,"Is Engineer",["0.510312 * safezoneW + safezoneX","0.533 * safezoneH + safezoneY","0.108281 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1006,"sia3f_radioOptionsText",[1,"ACRE/TFAR Options",["0.494844 * safezoneW + safezoneX","0.577 * safezoneH + safezoneY","0.118594 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2803,"sia3f_hasHandheldRadio",[1,"",["0.494844 * safezoneW + safezoneX","0.61 * safezoneH + safezoneY","0.0154688 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2804,"sia3f_hasManpackRadio",[1,"",["0.494844 * safezoneW + safezoneX","0.643 * safezoneH + safezoneY","0.0154688 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1007,"sia3f_hasHandheldRadioText",[1,"Has Handheld Radio",["0.510312 * safezoneW + safezoneX","0.61 * safezoneH + safezoneY","0.108281 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1008,"sia3f_hasManpackRadioText",[1,"Has Manpack Radio",["0.510312 * safezoneW + safezoneX","0.643 * safezoneH + safezoneY","0.108281 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,"sia3f_ok",[1,"",["0.561875 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.061875 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1009,"sia3f_okText",[1,"OK",["0.561875 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.0567187 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1602,"sia3f_cancel",[1,"",["0.37625 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.061875 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1010,"sia3f_cancelText",[1,"CANCEL",["0.37625 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.0567187 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]
*/

class GVAR(editRole) {
	idd = 8501; // hopefully unique number as to not cause problems in the unlikely event that another GUI is open at the same time.

	class controls {
		class GVAR(background): RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(0,0,0,0.5)";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.374 * safezoneH;
		};
		class GVAR(title): RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(0.77,0.51,0.08,0.5)";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(titleText): RscText
		{
			idc = 1000;
			text = "Role Editor"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(roleSelect): RscListbox
		{
			idc = 1500;
			onLBSelChanged = QUOTE((_this # 1) call FUNC(refreshEditRoles));
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.352 * safezoneH;
		};
		class GVAR(isMedic): RscCheckbox
		{
			idc = 2801;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(additionalItems): RscButton
		{
			idc = 1600;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(additionalItemsText): RscText
		{
			idc = 1002;
			text = "Edit Additional Items"; //--- ToDo: Localize;
			style = "0x02";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(aceOptionsText): RscText
		{
			idc = 1003;
			text = "ACE Options"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(isEngineer): RscCheckbox
		{
			idc = 2802;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(isMedicText): RscText
		{
			idc = 1004;
			text = "Is Medic"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(isEngineerText): RscText
		{
			idc = 1005;
			text = "Is Engineer"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(radioOptionsText): RscText
		{
			idc = 1006;
			text = "ACRE/TFAR Options"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(hasHandheldRadio): RscCheckbox
		{
			idc = 2803;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(hasManpackRadio): RscCheckbox
		{
			idc = 2804;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(hasHandheldRadioText): RscText
		{
			idc = 1007;
			text = "Has Handheld Radio"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(hasManpackRadioText): RscText
		{
			idc = 1008;
			text = "Has Manpack Radio"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(ok): RscButton
		{
			idc = 1601;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(okText): RscText
		{
			idc = 1009;
			text = "OK"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(cancel): RscButton
		{
			idc = 1602;
			action = "closeDialog 2;";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(cancelText): RscText
		{
			idc = 1010;
			text = "CANCEL"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(roleName): RscEdit
		{
			idc = 1400;
			text = "Role Name...";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(roleNameText): RscText
		{
			idc = 1001;
			text = "Role Name:"; //--- ToDo: Localize;
			x = 0.489688 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(createRole): RscButton
		{
			idc = 1603;
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(createRoleText): RscText
		{
			idc = 1011;
			text = "Create Role"; //--- ToDo: Localize;
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(deleteRole): RscButton
		{
			idc = 1604;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(deleteRoleText): RscText
		{
			idc = 1012;
			text = "Delete Role"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
