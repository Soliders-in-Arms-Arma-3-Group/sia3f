#include "\z\sia3f\addons\main\guiDefines.hpp"
/* GUI Editor save (OUTDATED, I forgot to save the latest revision)
$[1.063,["sia3f",[[0,0,1,1],0.025,0.04,"GUI_GRID"],2,0,0],[1200,"sia3f_background",[1,"#(argb,8,8,3)color(0,0,0,0.5)",["0.37625 * safezoneW + safezoneX","0.379 * safezoneH + safezoneY","0.2475 * safezoneW","0.297 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1201,"sia3f_title",[1,"#(argb,8,8,3)color(0.77,0.51,0.08,0.5)",["0.37625 * safezoneW + safezoneX","0.346 * safezoneH + safezoneY","0.2475 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"sia3f_titleText",[1,"Role Editor",["0.37625 * safezoneW + safezoneX","0.346 * safezoneH + safezoneY","0.242344 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1500,"sia3f_roleSelect",[1,"",["0.381406 * safezoneW + safezoneX","0.39 * safezoneH + safezoneY","0.103125 * safezoneW","0.275 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2801,"sia3f_isMedic",[1,"",["0.494844 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.0154688 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"sia3f_additionalItems",[1,"",["0.494844 * safezoneW + safezoneX","0.39 * safezoneH + safezoneY","0.118594 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1002,"sia3f_additionalItemsText",[1,"Edit Additional Items",["0.5 * safezoneW + safezoneX","0.401 * safezoneH + safezoneY","0.108281 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1003,"sia3f_aceOptionsText",[1,"ACE Options",["0.494844 * safezoneW + safezoneX","0.467 * safezoneH + safezoneY","0.118594 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2802,"sia3f_isEngineer",[1,"",["0.494844 * safezoneW + safezoneX","0.533 * safezoneH + safezoneY","0.0154688 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1004,"sia3f_isMedicText",[1,"Is Medic",["0.510312 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.108281 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1005,"sia3f_isEngineerText",[1,"Is Engineer",["0.510312 * safezoneW + safezoneX","0.533 * safezoneH + safezoneY","0.108281 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1006,"sia3f_radioOptionsText",[1,"ACRE/TFAR Options",["0.494844 * safezoneW + safezoneX","0.577 * safezoneH + safezoneY","0.118594 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2803,"sia3f_hasHandheldRadio",[1,"",["0.494844 * safezoneW + safezoneX","0.61 * safezoneH + safezoneY","0.0154688 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2804,"sia3f_hasManpackRadio",[1,"",["0.494844 * safezoneW + safezoneX","0.643 * safezoneH + safezoneY","0.0154688 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1007,"sia3f_hasHandheldRadioText",[1,"Has Handheld Radio",["0.510312 * safezoneW + safezoneX","0.61 * safezoneH + safezoneY","0.108281 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1008,"sia3f_hasManpackRadioText",[1,"Has Manpack Radio",["0.510312 * safezoneW + safezoneX","0.643 * safezoneH + safezoneY","0.108281 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,"sia3f_ok",[1,"",["0.561875 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.061875 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1009,"sia3f_okText",[1,"OK",["0.561875 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.0567187 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1602,"sia3f_cancel",[1,"",["0.37625 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.061875 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1010,"sia3f_cancelText",[1,"CANCEL",["0.37625 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.0567187 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]
*/

class GVAR(editRole) {
	idd = 8501; // hopefully unique number as to not cause problems in the unlikely event that another GUI is open at the same time.

	class controls {
		class background: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(0,0,0,0.5)";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.374 * safezoneH;
		};
		class title: RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(0.77,0.51,0.08,0.5)";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class titleText: RscText
		{
			idc = 1000;
			text = "Role Editor";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class roleSelect: RscListbox
		{
			idc = 1500;
			onLBSelChanged = QUOTE([ARR_2(_this # 1, false)] call FUNC(refreshEditRolesGUI));
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.352 * safezoneH;
		};
		class isMedic: RscCheckbox
		{
			idc = 2801;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class additionalItems: RscButton
		{
			idc = 1600;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class additionalItemsText: RscText
		{
			idc = 1002;
			text = "Edit Additional Items";
			style = "0x02";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class aceOptionsText: RscText
		{
			idc = 1003;
			text = "ACE Options";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class isEngineer: RscCheckbox
		{
			idc = 2802;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class isMedicText: RscText
		{
			idc = 1004;
			text = "Is Medic";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class isEngineerText: RscText
		{
			idc = 1005;
			text = "Is Engineer";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class radioOptionsText: RscText
		{
			idc = 1006;
			text = "ACRE/TFAR Options";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class hasHandheldRadio: RscCheckbox
		{
			idc = 2803;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class hasManpackRadio: RscCheckbox
		{
			idc = 2804;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class hasHandheldRadioText: RscText
		{
			idc = 1007;
			text = "Has Handheld Radio";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class hasManpackRadioText: RscText
		{
			idc = 1008;
			text = "Has Manpack Radio";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class okButton: RscButton
		{
			idc = 1601;
			action = QUOTE(call FUNC(saveRole););
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class okButtonText: RscText
		{
			idc = 1009;
			text = "OK";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class cancelButton: RscButton
		{
			idc = 1602;
			action = "(findDisplay 8501) closeDisplay 2;";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class cancelButtonText: RscText
		{
			idc = 1010;
			text = "CANCEL";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class roleName: ctrlEdit
		{
			idc = 1400;
			text = "Role Name...";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class roleNameText: RscText
		{
			idc = 1001;
			text = "Role Name:";
			x = 0.489688 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class createRole: RscButton
		{
			idc = 1603;
			action = QUOTE([ctrlText ((findDisplay 8501) displayCtrl 1400)] call FUNC(createRole););
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class createRoleText: RscText
		{
			idc = 1011;
			text = "Create Role";
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class deleteRole: RscButton
		{
			idc = 1604;
			action = QUOTE([ctrlText ((findDisplay 8501) displayCtrl 1400)] call FUNC(deleteRole););
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class deleteRoleText: RscText
		{
			idc = 1012;
			text = "Delete Role";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

// $[1.063,["sia3f",[[0,0,1,1],0.025,0.04,"GUI_GRID"],2,0,0],[1200,"sia3f_background",[1,"#(argb,8,8,3)color(0.075,0.075,0.075,0.8)",["0.355624 * safezoneW + safezoneX","0.324 * safezoneH + safezoneY","0.28875 * safezoneW","0.363 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1201,"sia3f_title",[1,"#(argb,8,8,3)color(0.77,0.51,0.08,0.75)",["0.355625 * safezoneW + safezoneX","0.291 * safezoneH + safezoneY","0.28875 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1000,"sia3f_titleText",[1,"Additional Items Editor: ROLE_NAME",["0.355625 * safezoneW + safezoneX","0.291 * safezoneH + safezoneY","0.283594 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1000;"]],[1001,"sia3f_category: ctrlToolboxPictureKeepAspect",[1,"",["0.360781 * safezoneW + safezoneX","0.357 * safezoneH + safezoneY","0.278437 * safezoneW","0.088 * safezoneH"],[1,1,1,1],[0,0,0,0.5],[-1,-1,-1,-1],"","4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5 * GUI_GRID_H"],["idc = 2300;","rows = 2;","columns = 12;","strings[] = {|\a3\Ui_F_Curator\Data\RscCommon\RscAttributeInventory\filter_0_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\PrimaryWeapon_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\SecondaryWeapon_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Handgun_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemAcc_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemMuzzle_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemBipod_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMagAll_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Headgear_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Uniform_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Vest_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Backpack_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Goggles_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\NVGs_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Binoculars_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Map_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Compass_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Radio_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Watch_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\GPS_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoThrow_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoPut_ca.paa|,|\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMisc_ca.paa|};"]],[1002,"sia3f_itemsBackground: ctrlStatic",[1,"#(argb,8,8,3)color(1,1,1,0.1)",["0.360781 * safezoneW + safezoneX","0.445 * safezoneH + safezoneY","0.278437 * safezoneW","0.198 * safezoneH"],[1,1,1,1],[0,0,0,0.5],[-1,-1,-1,-1],"","4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5"],[]],[1003,"sia3f_items: RscListBox",[1,"",["0.360781 * safezoneW + safezoneX","0.445 * safezoneH + safezoneY","0.278437 * safezoneW","0.198 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1500;","idcLeft = 1501;","idcRight = 1502;","drawSideArrows = 1;","disableOverflow = 1;","columns[] = {0.05,0.15,0.85};"]],[1600,"sia3f_arrowLeft",[1,"-",["-0.11875 * safezoneW + safezoneX","-0.325 * safezoneH + safezoneY","0.0117188 * safezoneW","0.0208333 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1501;","font = |RobotoCondensedBold|;"]],[1601,"sia3f_arrowRight",[1,"+",["-0.11875 * safezoneW + safezoneX","-0.325 * safezoneH + safezoneY","0.0117188 * safezoneW","0.0208333 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1502;","font = |RobotoCondensedBold|;"]],[1602,"sia3f_searchButton",[1,"\a3\Ui_f\data\GUI\RscCommon\RscButtonSearch\search_start_ca.paa",["0.360781 * safezoneW + safezoneX","0.654 * safezoneH + safezoneY","0.0117188 * safezoneW","0.0208333 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1605;"]],[1400,"sia3f_searchBar",[1,"",["0.37625 * safezoneW + safezoneX","0.654 * safezoneH + safezoneY","0.0928125 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1401;"]],[1603,"sia3f_import",[1,"IMPORT",["0.474219 * safezoneW + safezoneX","0.654 * safezoneH + safezoneY","0.0515625 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0.6],[-1,-1,-1,-1],"Export current items list as an array for use in scripts","-1"],["idc = 1606;"]],[1604,"sia3f_export",[1,"EXPORT",["0.530937 * safezoneW + safezoneX","0.654 * safezoneH + safezoneY","0.0515625 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0.6],[-1,-1,-1,-1],"Export current items list as an array for use in scripts","-1"],["idc = 1607;"]],[1605,"sia3f_clear",[1,"CLEAR",["0.587656 * safezoneW + safezoneX","0.654 * safezoneH + safezoneY","0.0515625 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0.6],[-1,-1,-1,-1],"","-1"],["idc = 1608;"]],[1606,"sia3f_addCompatible",[1,"Add Compatible Items",["0.54125 * safezoneW + safezoneX","0.335 * safezoneH + safezoneY","0.0976563 * safezoneW","0.0166667 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0.5],[-1,-1,-1,-1],"Will automatically add compatible attachments or magazines (based on selected category) for all weapons in current items list","4 * (pixelH * pixelGrid * 0.5)"],[]],[1607,"sia3f_OK",[1,"",["0.5825 * safezoneW + safezoneX","0.698 * safezoneH + safezoneY","0.061875 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1608,"sia3f_cancel",[1,"",["0.355625 * safezoneW + safezoneX","0.698 * safezoneH + safezoneY","0.061875 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1004,"sia3f_OKText",[1,"OK",["0.5825 * safezoneW + safezoneX","0.698 * safezoneH + safezoneY","0.0567187 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1005,"sia3f_cancelText",[1,"CANCEL",["0.355625 * safezoneW + safezoneX","0.698 * safezoneH + safezoneY","0.0567187 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]

class GVAR(additionalItemsEditor) {
	idd = 8502;
	class controls {
		class background: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.075,0.075,0.075,0.8)";
			x = 0.355624 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.363 * safezoneH;
		};
		class title: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.77,0.51,0.08,0.75)";
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class titleText: RscText
		{
			idc = 1000;

			text = "Additional Items Editor: ROLE_NAME";
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.283594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class category: ctrlToolboxPictureKeepAspect
		{
			idc = 2300;
			rows = 2;
			columns = 12;
			strings[] = {"\a3\Ui_F_Curator\Data\RscCommon\RscAttributeInventory\filter_0_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\PrimaryWeapon_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\SecondaryWeapon_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Handgun_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemAcc_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemMuzzle_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemBipod_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMagAll_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Headgear_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Uniform_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Vest_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Backpack_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Goggles_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\NVGs_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Binoculars_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Map_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Compass_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Radio_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Watch_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\GPS_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoThrow_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoPut_ca.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMisc_ca.paa"};
			onToolBoxSelChanged = QUOTE((_this # 1) call FUNC(additionalItemsCategory););

			x = 0.360781 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.278437 * safezoneW;
			h = 0.088 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5 * GUI_GRID_H * GUI_GRID_H;
		};
		class itemsBackground: ctrlStatic
		{
			idc = -1;
			// text = "#(argb,8,8,3)color(1,1,1,0.1)"; ToDo: delete if colorBackground works instead
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.278437 * safezoneW;
			h = 0.198 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
		};
		class items: ctrlListNBox
		{
			idc = 1500;
			idcLeft = 1501;
			idcRight = 1502;
			drawSideArrows = 1;
			disableOverflow = 1;
			columns[] = {0.05,0.15,0.85};

			x = 0.360781 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.278437 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class arrowLeft: RscButton
		{
			idc = 1501;
			font = "RobotoCondensedBold";

			text = "−";
			x = -0.11875 * safezoneW + safezoneX;
			y = -0.325 * safezoneH + safezoneY;
			w = 0.0117188 * safezoneW;
			h = 0.0208333 * safezoneH;
		};
		class arrowRight: RscButton
		{
			idc = 1502;
			font = "RobotoCondensedBold";

			text = "+";
			x = -0.11875 * safezoneW + safezoneX;
			y = -0.325 * safezoneH + safezoneY;
			w = 0.0117188 * safezoneW;
			h = 0.0208333 * safezoneH;
		};
		class searchBar: RscEdit
		{
			idc = 1401;

			onKeyUp = QUOTE(call FUNC(additionalItemsAddItems););
			onMouseButtonClick = QUOTE( \
				params [ARR_2('_searchBar','_button')]; \
				if (_button != 1) exitWith {}; \
				_searchBar ctrlSetText ''; \
				ctrlSetFocus _searchBar; \
				call FUNC(additionalItemsAddItems); \
			);

			x = 0.376249 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class searchButton: RscButton
		{
			idc = 1610;
			action = QUOTE( \
				private _searchBar = (findDisplay 8502) displayCtrl 1401; \
				_searchBar ctrlSetText ''; \
				ctrlSetFocus _searchBar; \
				call FUNC(additionalItemsAddItems); \
			);

			x = 0.360781 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0117188 * safezoneW;
			h = 0.0208333 * safezoneH;
		};
		class searchButtonImage: RscPicture
		{
			idc = -1;
			text = "\a3\Ui_f\data\GUI\RscCommon\RscButtonSearch\search_start_ca.paa";
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0117188 * safezoneW;
			h = 0.0208333 * safezoneH;
		};
		class import: RscButton
		{
			idc = 1606;

			text = "IMPORT";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
			tooltip = "Import items list array from clipboard (should be the same format as export)";
		};
		class export: RscButton
		{
			idc = 1607;

			text = "EXPORT";
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
			tooltip = "Export current items list as an array for use in scripts";
		};
		class clear: RscButton
		{
			idc = 1608;

			text = "CLEAR";
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class addCompatible: RscButton
		{
			idc = 1609;
			text = "Add Compatible Items";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0976563 * safezoneW;
			h = 0.0166667 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			tooltip = "Will automatically add compatible attachments or magazines (based on selected category) for all weapons in current items list";
			sizeEx = 4 * (pixelH * pixelGrid * 0.5);
		};
		class itemsText: RscText
		{
			idc = -1;
			text = "Items";
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Ok: RscButton
		{
			idc = 1607;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class OkText: RscText
		{
			idc = 1004;
			text = "OK"; //--- ToDo: Localize;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class cancel: RscButton
		{
			idc = 1608;
			action = "(findDisplay 8502) closeDisplay 2;"
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class cancelText: RscText
		{
			idc = 1005;
			text = "CANCEL"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
