#include "\z\sia3f\addons\main\guiDefines.hpp"

class GVAR(editRole) {
	idd = 8501; // hopefully unique number as to not cause problems in the unlikely event that another GUI is open at the same time.
	onUnload = QUOTE(call FUNC(editRolesCleanupGlobals););

	class controls {
		class background: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.075,0.075,0.075,0.8)";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.418 * safezoneH;
		};
		class title: RscText
		{
			idc = -1;
			text = "Role Editor";
			colorBackground[] = GUI_THEME_COLOR;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.277 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class roleSelect: RscListBox
		{
			idc = 1500;
			onLBSelChanged = QUOTE([ARR_2(_this # 1, false)] call FUNC(editRolesRefresh));
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.396 * safezoneH;
		};
		class isMedic: RscCheckBox
		{
			idc = 2801;
			onCheckedChanged = QUOTE(call FUNC(editRolesSaveRole););
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0154689 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class additionalItems: ctrlButton
		{
			idc = 1600;
			action = QUOTE( \
				private _ctrl = ((findDisplay 8501) displayCtrl 1500); \
				[_ctrl lbText (lbCurSel _ctrl)] call FUNC(additionalItemsSpawn); \
			);
			text = "Edit Additional Items";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class aceOptionsText: RscText
		{
			idc = -1;
			text = "ACE Options";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class isEngineer: RscCheckBox
		{
			idc = 2802;
			onCheckedChanged = QUOTE(call FUNC(editRolesSaveRole););
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0154689 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class isMedicText: RscText
		{
			idc = -1;
			text = "Is Medic";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class isEngineerText: RscText
		{
			idc = -1;
			text = "Is Engineer";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class radioOptionsText: RscText
		{
			idc = -1;
			text = "Radio Options";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class hasHandheldRadio: RscCheckBox
		{
			idc = 2803;
			onCheckedChanged = QUOTE(call FUNC(editRolesSaveRole););
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0154689 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class hasManpackRadio: RscCheckBox
		{
			idc = 2804;
			onCheckedChanged = QUOTE(call FUNC(editRolesSaveRole););
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0154689 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class hasHandheldRadioText: RscText
		{
			idc = -1;
			text = "Has Handheld Radio";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class hasManpackRadioText: RscText
		{
			idc = -1;
			text = "Has Manpack Radio";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class okButton: ctrlButton
		{
			idc = 1601;
			action = QUOTE( \
				private _rolesHash = uiNamespace getVariable [ARR_2(QQGVAR(roles), createHashMap)]; \
				private _groupsHash = uiNamespace getVariable [ARR_2(QQGVAR(groups), createHashMap)]; \
				QQGVAR(hiddenConfigValues) set3DENMissionAttribute [ARR_2(QQGVAR(roles), _rolesHash)]; \
				QQGVAR(hiddenConfigValues) set3DENMissionAttribute [ARR_2(QQGVAR(groups), _groupsHash)]; \
				do3DENAction ""MissionSave""; \
				(findDisplay 8501) closeDisplay 2; \
			);
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.7225 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class okButtonText: RscText
		{
			idc = -1;
			text = "OK";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.7225 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class cancelButton: ctrlButton
		{
			idc = 1602;
			action = "(findDisplay 8501) closeDisplay 2;";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.7225 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class cancelButtonText: RscText
		{
			idc = -1;
			text = "CANCEL";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.7225 * safezoneH + safezoneY;
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
			idc = -1;
			text = "Role Name:";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class createRole: ctrlButton
		{
			idc = 1603;
			action = QUOTE([ctrlText ((findDisplay 8501) displayCtrl 1400)] call FUNC(editRolesCreateRole););
			text = "Create Role";
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class deleteRole: ctrlButton
		{
			idc = 1604;
			action = QUOTE([ctrlText ((findDisplay 8501) displayCtrl 1400)] call FUNC(editRolesDeleteRole););
			text = "Delete Role";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class editGroups: ctrlButton
		{
			idc = 1605;
			action = QUOTE([] call FUNC(editGroupsSpawn););
			text = "Edit Role Groups";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class GVAR(additionalItemsEditor) {
	// this GUI is taken and modified from mharis001 - ACE3 (addons/arsenal/Cfg3DEN.hpp >> Attributes >> ace_arsenal_attribute)
	idd = 8502;
	onKeyDown = QUOTE([_this # 1] call FUNC(additionalItemsKeyDown););
	onUnload = QUOTE(call FUNC(editRolesCleanupGlobals););

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
		class title: RscText
		{
			idc = 1000;
			text = "Additional Items Editor: ROLE_NAME";
			colorBackground[] = GUI_THEME_COLOR;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.299 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class category: ctrlToolboxPictureKeepAspect
		{
			idc = 2300;
			rows = 2;
			columns = 12;
			strings[] = {
				"\a3\Ui_F_Curator\Data\RscCommon\RscAttributeInventory\filter_0_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\PrimaryWeapon_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\SecondaryWeapon_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Handgun_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemAcc_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemMuzzle_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemBipod_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMagAll_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Headgear_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Uniform_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Vest_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Backpack_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Goggles_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\NVGs_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Binoculars_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Map_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Compass_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Radio_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Watch_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\GPS_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoThrow_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoPut_ca.paa",
				"\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMisc_ca.paa"
			};
			onToolBoxSelChanged = QUOTE((_this # 1) call FUNC(additionalItemsCategory););

			x = 0.360781 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.278437 * safezoneW;
			h = 0.088 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
		};
		class itemsBackground: ctrlStatic
		{
			idc = -1;
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

			onLBDblClick = QUOTE( \
				params [ARR_2('_listbox','_row')]; \
				private _classname = _listbox lnbData [ARR_2(_row, 1)]; \
				private _addItem = !(_classname in (uiNamespace getVariable [ARR_2(QQGVAR(additionalItems),[])])); \
				[_addItem] call FUNC(additionalItemsSelect); \
			);
			onSetFocus = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(listboxHasFocus),true)];);
			onKillFocus = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(listboxHasFocus),false)];);

			x = 0.360781 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.278437 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class arrowLeft: ctrlButton
		{
			idc = 1501;
			font = "RobotoCondensedBold";
			action = QUOTE([false] call FUNC(additionalItemsSelect););

			text = "−";
			x = -0.11875 * safezoneW + safezoneX;
			y = -0.325 * safezoneH + safezoneY;
			w = 0.0117188 * safezoneW;
			h = 0.0208333 * safezoneH;
		};
		class arrowRight: ctrlButton
		{
			idc = 1502;
			font = "RobotoCondensedBold";
			action = QUOTE([true] call FUNC(additionalItemsSelect););

			text = "∞";
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
		class searchButton: ctrlButton
		{
			idc = 1606;
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
		class import: ctrlButton
		{
			idc = 1607;
			action = QUOTE([call compile copyFromClipboard] call FUNC(additionalItemsImport););
			text = "IMPORT";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
			tooltip = "Import items list array from clipboard (should be the same format as export)";
		};
		class export: ctrlButton
		{
			idc = 1608;
			action = QUOTE(copyToClipboard str (uiNamespace getVariable [ARR_2(QQGVAR(roleItems),[])]););
			text = "EXPORT";
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
			tooltip = "Export current items list as an array for use in scripts";
		};
		class clear: ctrlButton
		{
			idc = 1609;
			action = QUOTE(call FUNC(additionalItemsClear););
			text = "CLEAR";
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class addCompatible: ctrlButton
		{
			idc = 1610;
			text = "Add Compatible Items";
			tooltip = "Will automatically add compatible attachments or magazines (based on selected category) for all weapons in current items list";
			style = "0x02";
			font = "RobotoCondensedLight";
			action = QUOTE(call FUNC(additionalItemsAddCompatible););

			x = 0.54125 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0976563 * safezoneW;
			h = 0.0166667 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 4 * (pixelH * pixelGrid * 0.5);
		};
		class itemsText: RscText
		{
			idc = -1;
			text = "Items";
			x = 0.357 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Ok: ctrlButton
		{
			idc = 1611;
			action = QUOTE(call FUNC(additionalItemsSave););
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.69 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class OkText: RscText
		{
			idc = -1;
			text = "OK";
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.69 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class cancel: ctrlButton
		{
			idc = 1612;
			action = "(findDisplay 8502) closeDisplay 2;";
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.69 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class cancelText: RscText
		{
			idc = -1;
			text = "CANCEL";
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.69 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class GVAR(editGroups) {
	idd = 8503;
	onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(editGroupsCurrentMode),0)];);
	onUnload = QUOTE(call FUNC(editRolesCleanupGlobals););
	onKeyDown = QUOTE([_this # 1] call FUNC(editGroupsKeyDown););

	class controls {
		class background: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.075,0.075,0.075,0.8)";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.418 * safezoneH;
		};
		class title: RscText
		{
			idc = -1;
			text = "Group Editor";
			colorBackground[] = GUI_THEME_COLOR;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.277 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class groupSelect: RscListBox
		{
			idc = 1500;
			onLBSelChanged = QUOTE([ARR_2(_this # 1, false)] call FUNC(editGroupsRefresh));

			x = 0.381406 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.396 * safezoneH;
		};
		class okButton: ctrlButton
		{
			idc = 1613;
			action = QUOTE(call FUNC(editRolesSpawn););
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.7225 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class okButtonText: RscText
		{
			idc = -1;
			text = "RETURN";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.7225 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class cancelButton: ctrlButton
		{
			idc = 1614;
			action = "(findDisplay 8503) closeDisplay 2;";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.7225 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class cancelButtonText: RscText
		{
			idc = -1;
			text = "CANCEL";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.7225 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class groupName: ctrlEdit
		{
			idc = 1400;
			text = "Group Name...";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class groupNameText: RscText
		{
			idc = -1;
			text = "Group Name:";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class createGroup: ctrlButton
		{
			idc = 1615;
			action = QUOTE([ctrlText ((findDisplay 8503) displayCtrl 1400)] call FUNC(editGroupsCreateGroup););

			text = "Create Group";
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class deleteGroup: ctrlButton
		{
			idc = 1616;
			action = QUOTE([ctrlText ((findDisplay 8503) displayCtrl 1400)] call FUNC(editGroupsDeleteGroup););

			text = "Delete Group";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class rolesBackground: ctrlStatic
		{
			idc = 1000;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.253 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
		};
		class roles: ctrlListNBox
		{
			idc = 1503;
			idcLeft = 1504;
			idcRight = 1505;
			drawSideArrows = 1;
			disableOverflow = 1;
			columns[] = {0.12, 0.78};

			onLBDblClick = QUOTE( \
				params [ARR_2(""_listbox"", ""_row"")]; \
				private _role = _listbox lnbText [ARR_2(_row, 0)]; \
				private _group = ((findDisplay 8503) displayCtrl 1500) lbText (lbCurSel ((findDisplay 8503) displayCtrl 1500)); \
				if (_group == """") exitWith {}; \
				private _addItem = _role in ((uiNamespace getVariable [ARR_2(QQGVAR(groups),createHashmap)]) getOrDefault [ARR_2(_group, [])]) # 5; \
				[!_addItem] call FUNC(editGroupsSelect); \
			);
			onSetFocus = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(listboxHasFocus),true)];);
			onKillFocus = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(listboxHasFocus),false)];);

			x = 0.494844 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.253 * safezoneH;
		};
		class arrowLeft: ctrlButton
		{
			idc = 1504;
			font = "RobotoCondensedBold";
			action = QUOTE([false] call FUNC(editGroupsSelect));

			text = "−";
			x = -0.11875 * safezoneW + safezoneX;
			y = -0.325 * safezoneH + safezoneY;
			w = 0.0117188 * safezoneW;
			h = 0.0208333 * safezoneH;
		};
		class arrowRight: ctrlButton
		{
			idc = 1505;
			font = "RobotoCondensedBold";
			action = QUOTE([true] call FUNC(editGroupsSelect));

			text = "+";
			x = -0.11875 * safezoneW + safezoneX;
			y = -0.325 * safezoneH + safezoneY;
			w = 0.0117188 * safezoneW;
			h = 0.0208333 * safezoneH;
		};
		class editGroupsSettings: ctrlButton
		{
			idc = 1605;
			action = QUOTE([1] call FUNC(editGroupsMode););
			text = "Edit Group Options";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class GVAR(editGroupsSettings) {
	idd = 8504;
	onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(editGroupsCurrentMode),1)];);
	onUnload = QUOTE(call FUNC(editRolesCleanupGlobals););

	class controls {
		class background: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.075,0.075,0.075,0.8)";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.418 * safezoneH;
		};
		class title: RscText
		{
			idc = -1;
			text = "Group Editor";
			colorBackground[] = GUI_THEME_COLOR;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.277 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class groupSelect: RscListBox
		{
			idc = 1500;
			onLBSelChanged = QUOTE([ARR_2(_this # 1, false)] call FUNC(editGroupsRefresh));

			x = 0.381406 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.396 * safezoneH;
		};
		class okButton: ctrlButton
		{
			idc = 1613;
			action = QUOTE(call FUNC(editRolesSpawn););
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.7225 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class okButtonText: RscText
		{
			idc = -1;
			text = "RETURN";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.7225 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class cancelButton: ctrlButton
		{
			idc = 1614;
			action = "(findDisplay 8504) closeDisplay 2;";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.7225 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class cancelButtonText: RscText
		{
			idc = -1;
			text = "CANCEL";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.7225 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class groupName: ctrlEdit
		{
			idc = 1400;
			text = "Group Name...";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class groupNameText: RscText
		{
			idc = -1;
			text = "Group Name:";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class createGroup: ctrlButton
		{
			idc = 1615;
			action = QUOTE([ctrlText ((findDisplay 8504) displayCtrl 1400)] call FUNC(editGroupsCreateGroup););

			text = "Create Group";
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class deleteGroup: ctrlButton
		{
			idc = 1616;
			action = QUOTE([ctrlText ((findDisplay 8504) displayCtrl 1400)] call FUNC(editGroupsDeleteGroup););

			text = "Delete Group";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class isMedic: RscCheckBox
		{
			idc = 2801;
			onCheckedChanged = QUOTE(call FUNC(editGroupsSaveSettings););
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0154689 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class additionalItems: ctrlButton
		{
			idc = 1600;
			action = QUOTE( \
				private _ctrl = ((findDisplay 8504) displayCtrl 1500); \
				[ARR_2(_ctrl lbText (lbCurSel _ctrl), true)] call FUNC(additionalItemsSpawn); \
			);
			text = "Edit Additional Items";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class aceOptionsText: RscText
		{
			idc = 1001;
			text = "ACE Options";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class isEngineer: RscCheckBox
		{
			idc = 2802;
			onCheckedChanged = QUOTE(call FUNC(editGroupsSaveSettings););
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0154689 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class isMedicText: RscText
		{
			idc = -1;
			text = "Is Medic";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class isEngineerText: RscText
		{
			idc = 1002;
			text = "Is Engineer";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class radioOptionsText: RscText
		{
			idc = -1;
			text = "Radio Options";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class hasHandheldRadio: RscCheckBox
		{
			idc = 2803;
			onCheckedChanged = QUOTE(call FUNC(editGroupsSaveSettings););
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0154689 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class hasManpackRadio: RscCheckBox
		{
			idc = 2804;
			onCheckedChanged = QUOTE(call FUNC(editGroupsSaveSettings););
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0154689 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class hasHandheldRadioText: RscText
		{
			idc = -1;
			text = "Has Handheld Radio";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class hasManpackRadioText: RscText
		{
			idc = -1;
			text = "Has Manpack Radio";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class editGroups: ctrlButton
		{
			idc = 1605;
			action = QUOTE([0] call FUNC(editGroupsMode););
			text = "Edit Groups";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
