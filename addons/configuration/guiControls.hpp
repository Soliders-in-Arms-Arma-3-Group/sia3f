#include "\z\sia3f\addons\main\guiDefines.hpp"

/* Edit Role GUI Editor saves:
https://discord.com/channels/689674061366034435/690255520728350720/1006033427247669342 (dropdown on top)

pretty sure this one doesn't work:
$[1.063,["sia3f",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1200,"sia3f_background",[1,"#(argb,8,8,3)color(0,0,0,0.5)",["0.396875 * safezoneW + safezoneX","0.302 * safezoneH + safezoneY","0.20625 * safezoneW","0.418 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1201,"sia3f_title",[1,"#(argb,8,8,3)color(0.77,0.51,0.08,0.5)",["0.396875 * safezoneW + safezoneX","0.269 * safezoneH + safezoneY","0.20625 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"sia3f_titleText",[1,"Role Editor",["0.396875 * safezoneW + safezoneX","0.269 * safezoneH + safezoneY","0.201094 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2100,"sia3f_roleSelect",[1,"",["0.407187 * safezoneW + safezoneX","0.313 * safezoneH + safezoneY","0.185625 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2800,"sia3f_isDefault",[1,"",["0.407187 * safezoneW + safezoneX","0.379 * safezoneH + safezoneY","0.0154688 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1001,"sia3f_isDefaultText",[1,"Is Default",["0.422656 * safezoneW + safezoneX","0.379 * safezoneH + safezoneY","0.165 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Only 1 role can have this selected.  Player units that do not have a role specified will become this role.","-1"],[]],[2801,"sia3f_isMedic",[1,"",["0.407187 * safezoneW + safezoneX","0.555 * safezoneH + safezoneY","0.0154688 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Gives the 'Regular Medic' attribute.","-1"],[]],[1002,"sia3f_isMedicText",[1,"Is Medic",["0.422656 * safezoneW + safezoneX","0.555 * safezoneH + safezoneY","0.165 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Gives the 'Regular Medic' attribute.","-1"],[]],[2802,"sia3f_isEngineer",[1,"",["0.407187 * safezoneW + safezoneX","0.588 * safezoneH + safezoneY","0.0154688 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Gives the 'Engineer' attribute.","-1"],[]],[1003,"sia3f_isEngineerText",[1,"Is Engineer",["0.422656 * safezoneW + safezoneX","0.588 * safezoneH + safezoneY","0.165 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Gives the 'Engineer' attribute.","-1"],[]],[1004,"sia3f_aceOptionsText",[1,"ACE Options",["0.407187 * safezoneW + safezoneX","0.522 * safezoneH + safezoneY","0.185625 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"These options are only applicable if you are using ACE 3 in your mission.","-1"],[]],[1005,"sia3f_ACRE-TFAROptionsText",[1,"ACRE/TFAR Options",["0.407187 * safezoneW + safezoneX","0.621 * safezoneH + safezoneY","0.185625 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"These options are only applicable if you are using ACRE or TFAR in your mission.","-1"],[]],[2803,"sia3f_hasHandheld",[1,"",["0.407187 * safezoneW + safezoneX","0.654 * safezoneH + safezoneY","0.0154688 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2804,"sia3f_hasManpack",[1,"",["0.407187 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.0154688 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1006,"sia3f_hasHandheldText",[1,"Has Handheld Radio",["0.422656 * safezoneW + safezoneX","0.654 * safezoneH + safezoneY","0.165 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1007,"sia3f_hasManpackText",[1,"Has Manpack Radio",["0.422656 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.165 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"sia3f_editAdditional",[1,"",["0.407187 * safezoneW + safezoneX","0.412 * safezoneH + safezoneY","0.0928125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1008,"sia3f_editAdditionalText",[1,"Edit Additional Items",["0.412344 * safezoneW + safezoneX","0.423 * safezoneH + safezoneY","0.0825 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,"sia3f_ok",[1,"",["0.541251 * safezoneW + safezoneX","0.731 * safezoneH + safezoneY","0.061875 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1009,"sia3f_okText",[1,"OK",["0.54125 * safezoneW + safezoneX","0.731 * safezoneH + safezoneY","0.0567187 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1602,"sia3f_cancel",[1,"",["0.396875 * safezoneW + safezoneX","0.731 * safezoneH + safezoneY","0.061875 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1010,"sia3f_cancelText",[1,"CANCEL",["0.396875 * safezoneW + safezoneX","0.731 * safezoneH + safezoneY","0.0567187 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]


https://discord.com/channels/689674061366034435/690255520728350720/1006418418649542717 (listbox on the left)

$[1.063,["sia3f",[[0,0,1,1],0.025,0.04,"GUI_GRID"],2,0,0],[1200,"sia3f_background",[1,"#(argb,8,8,3)color(0,0,0,0.5)",["0.37625 * safezoneW + safezoneX","0.379 * safezoneH + safezoneY","0.2475 * safezoneW","0.297 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1201,"sia3f_title",[1,"#(argb,8,8,3)color(0.77,0.51,0.08,0.5)",["0.37625 * safezoneW + safezoneX","0.346 * safezoneH + safezoneY","0.2475 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"sia3f_titleText",[1,"Role Editor",["0.37625 * safezoneW + safezoneX","0.346 * safezoneH + safezoneY","0.242344 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1500,"sia3f_roleSelect",[1,"",["0.381406 * safezoneW + safezoneX","0.39 * safezoneH + safezoneY","0.103125 * safezoneW","0.275 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2801,"sia3f_isMedic",[1,"",["0.494844 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.0154688 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"sia3f_additionalItems",[1,"",["0.494844 * safezoneW + safezoneX","0.39 * safezoneH + safezoneY","0.118594 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"sia3f_additionalItemsText",[1,"Edit Additional Items",["0.5 * safezoneW + safezoneX","0.401 * safezoneH + safezoneY","0.108281 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1003,"sia3f_aceOptionsText",[1,"ACE Options",["0.494844 * safezoneW + safezoneX","0.467 * safezoneH + safezoneY","0.118594 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2802,"sia3f_isEngineer",[1,"",["0.494844 * safezoneW + safezoneX","0.533 * safezoneH + safezoneY","0.0154688 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1004,"sia3f_isMedicText",[1,"Is Medic",["0.510312 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.108281 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1005,"sia3f_isEngineerText",[1,"Is Engineer",["0.510312 * safezoneW + safezoneX","0.533 * safezoneH + safezoneY","0.108281 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1006,"sia3f_radioOptionsText",[1,"ACRE/TFAR Options",["0.494844 * safezoneW + safezoneX","0.577 * safezoneH + safezoneY","0.118594 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2803,"sia3f_hasHandheldRadio",[1,"",["0.494844 * safezoneW + safezoneX","0.61 * safezoneH + safezoneY","0.0154688 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2804,"sia3f_hasManpackRadio",[1,"",["0.494844 * safezoneW + safezoneX","0.643 * safezoneH + safezoneY","0.0154688 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1007,"sia3f_hasHandheldRadioText",[1,"Has Handheld Radio",["0.510312 * safezoneW + safezoneX","0.61 * safezoneH + safezoneY","0.108281 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1008,"sia3f_hasManpackRadioText",[1,"Has Manpack Radio",["0.510312 * safezoneW + safezoneX","0.643 * safezoneH + safezoneY","0.108281 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,"sia3f_ok",[1,"",["0.561875 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.061875 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1009,"sia3f_okText",[1,"OK",["0.561875 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.0567187 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1602,"sia3f_cancel",[1,"",["0.37625 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.061875 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1010,"sia3f_cancelText",[1,"CANCEL",["0.37625 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.0567187 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]
*/

class GVAR(editRole) {
	/*
	code for testing if you feel the inclination

	private _disp = findDisplay 313 createDisplay "sia3f_configuration_editRole";
	private _lbCtrl = _disp displayCtrl 1500;
	_lbCtrl lbAdd "test";
	_lbCtrl lbAdd "Hierarchy Bad";
	_lbCtrl lbAdd "pee pee poo poo";
	_lbCtrl lbAdd "your mother";
	*/

	idd = 8501; // hopefully unique number as to not cause problems in the unlikely event that another GUI is open at the same time.

	class controls {
		class GVAR(editRole_background): RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(0,0,0,0.5)";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.297 * safezoneH;
		};
		class GVAR(editRole_title): RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(0.77,0.51,0.08,0.5)";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(editRole_titleText): RscText
		{
			idc = 1000;
			text = "Role Editor"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(editRole_roleSelect): RscListbox
		{
			idc = 1500;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.275 * safezoneH;
		};
		class GVAR(editRole_isMedic): RscCheckbox
		{
			idc = 2801;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(editRole_additionalItems): RscButton
		{
			idc = 1600;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class GVAR(editRole_additionalItemsText): RscText
		{
			idc = 1002;
			text = "Edit Additional Items"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(editRole_aceOptionsText): RscText
		{
			idc = 1003;
			text = "ACE Options"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(editRole_isEngineer): RscCheckbox
		{
			idc = 2802;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(editRole_isMedicText): RscText
		{
			idc = 1004;
			text = "Is Medic"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(editRole_isEngineerText): RscText
		{
			idc = 1005;
			text = "Is Engineer"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(editRole_radioOptionsText): RscText
		{
			idc = 1006;
			text = "ACRE/TFAR Options"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(editRole_hasHandheldRadio): RscCheckbox
		{
			idc = 2803;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(editRole_hasManpackRadio): RscCheckbox
		{
			idc = 2804;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(editRole_hasHandheldRadioText): RscText
		{
			idc = 1007;
			text = "Has Handheld Radio"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(editRole_hasManpackRadioText): RscText
		{
			idc = 1008;
			text = "Has Manpack Radio"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(editRole_ok): RscButton
		{
			idc = 1601;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(editRole_okText): RscText
		{
			idc = 1009;
			text = "OK"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(editRole_cancel): RscButton
		{
			idc = 1602;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GVAR(editRole_cancelText): RscText
		{
			idc = 1010;
			text = "CANCEL"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
