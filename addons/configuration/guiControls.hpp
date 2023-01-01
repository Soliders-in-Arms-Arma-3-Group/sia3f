#include "\z\sia3f\addons\main\guiDefines.hpp"

class GVAR(editRole) {
	// this GUI is taken and modified from R3vo - 3den-Enhanced >> VIM
	idd = 8501; // hopefully unique number as to not cause problems in the unlikely event that another GUI is open at the same time.
	onUnload = QUOTE(call FUNC(editRolesCleanupGlobals););

	class controls {
		DISABLE_BACKGROUND
		class background: ctrlStaticBackground
		{
			idc = -1;
			x = CENTERED_X(DIALOG_W);
			y = DIALOG_TOP + CTRL_DEFAULT_H;
			w = DIALOG_W * GRID_W;
			h = DIALOG_H * GRID_H;
		};
		class title: ctrlStaticTitle
		{
			idc = -1;
			text = "Role Editor";
			colorBackground[] = GUI_THEME_COLOR;
			x = CENTERED_X(DIALOG_W);
			y = DIALOG_TOP;
			w = DIALOG_W * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Configuration of the settings and arsenal items for specific SIA Mission Framework roles. \nNOTE that the gear each player spawns in with is already added to their local arsenal";
		};
		class Footer: ctrlStaticFooter
		{
			idc = -1;
			x = CENTERED_X(DIALOG_W);
			y = DIALOG_TOP + DIALOG_H * GRID_H - 2 * GRID_H;
			w = DIALOG_W * GRID_W;
			h = CTRL_DEFAULT_H + 2 * GRID_H;
		};
		class MenuStrip: ctrlMenuStrip // MENU BAR
		{
			idc = -1;
			x = CENTERED_X(DIALOG_W);
			y = DIALOG_TOP + CTRL_DEFAULT_H;
			w = DIALOG_W * GRID_W;
			h = CTRL_DEFAULT_H;

			class Items
			{
				items[] = {
					// "FolderTools",
					"FolderHelp"
				};

				/* class FolderTools
				{
					text = "Tools";
					items[] = { "WIP" }; // To-do: Add delete all, reset, import, export
				}; */
				class FolderHelp
				{
					text = "Help";
					items[] = { "Documentation" };
				};

				// Tools
				/* class WIP
				{
					text = "WIP"; 
				}; */
				// Help
				class Documentation
				{
					text = "Documentation";
					picture = "\a3\3DEN\Data\Controls\ctrlMenu\link_ca.paa";
					weblink = "https://github.com/Soliders-in-Arms-Arma-3-Group/sia3f/wiki"; //To-do: link to tutorial and any other help.
					opensNewWindow = 1;
				};
				class Default;
				class Separator;
			};
		};
		class roleSelectText: ctrlStatic
		{
			idc = -1;
			text = "Available Roles";
			x = CENTERED_X(DIALOG_W) + GRID_W;
			y = DIALOG_TOP + 2 * CTRL_DEFAULT_H + GRID_H;
			w = 40 * GRID_W;
			h = CTRL_DEFAULT_H;
			font = "RobotoCondensedBold";
			shadow = 1;
			sizeEx = GUI_GRID_H * 1.2;
			tooltip = "List of default, imported, and user-created roles";
		};
		class roleSelect: ctrlListbox
		{
			idc = 1500;
			onLBSelChanged = QUOTE([ARR_2(_this # 1, false)] call FUNC(editRolesRefresh));
			x = CENTERED_X(DIALOG_W) + GRID_W;
			y = DIALOG_TOP + 3 * CTRL_DEFAULT_H + GRID_H;
			w = (DIALOG_W / 2 - 1) * GRID_W;
			h = DIALOG_H * GRID_H - 4 * CTRL_DEFAULT_H + 2 * GRID_H;
		};
		class additionalItems: ctrlButton
		{
			idc = 1600;
			action = QUOTE( \
				private _ctrl = ((findDisplay 8501) displayCtrl 1500); \
				[_ctrl lbText (lbCurSel _ctrl)] call FUNC(additionalItemsSpawn); \
			);
			text = "Edit Additional Items";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.75 * GRID_W;
			y = DIALOG_TOP + 7 * CTRL_DEFAULT_H + GRID_H;
			w = (DIALOG_W / 2.75) * GRID_W;
			h = CTRL_DEFAULT_H * 2.5;
			tooltip = "Edit the items available in the arsenal of all units with the selected role";
		};
		class traitOptionsText: RscText
		{
			idc = -1;
			text = "Trait Options";
			font = "RobotoCondensedBold";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.75 * GRID_W - 4 * GRID_W;
			y = DIALOG_TOP + 11.75 * CTRL_DEFAULT_H + GRID_H;
			w = 40 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Adds the following trait to all units with the selected role";
		};
		class isMedic: RscCheckBox
		{
			idc = 2801;
			onCheckedChanged = QUOTE(call FUNC(editRolesSaveRole););
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.75 * GRID_W - 5 * GRID_W;
			y = DIALOG_TOP + 13 * CTRL_DEFAULT_H + GRID_H;
			w = CTRL_DEFAULT_W;
			h = CTRL_DEFAULT_H;
		};
		class isEngineer: RscCheckBox
		{
			idc = 2802;
			onCheckedChanged = QUOTE(call FUNC(editRolesSaveRole););
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.75 * GRID_W - 5 * GRID_W;
			y = DIALOG_TOP + 14.25 * CTRL_DEFAULT_H + GRID_H;
			w = CTRL_DEFAULT_W;
			h = CTRL_DEFAULT_H;
		};
		class isMedicText: RscText
		{
			idc = -1;
			text = "Is Medic";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.75 * GRID_W;
			y = DIALOG_TOP + 13 * CTRL_DEFAULT_H + GRID_H;
			w = 40 * GRID_W;
			h = CTRL_DEFAULT_H;
		};
		class isEngineerText: RscText
		{
			idc = -1;
			text = "Is Engineer";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.75 * GRID_W;
			y = DIALOG_TOP + 14.25 * CTRL_DEFAULT_H + GRID_H;
			w = 40 * GRID_W;
			h = CTRL_DEFAULT_H;
		};
		class radioOptionsText: RscText
		{
			idc = -1;
			text = "Radio Options";
			font = "RobotoCondensedBold";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.25 * GRID_W - 4 * GRID_W;
			y = DIALOG_TOP + 11.75 * CTRL_DEFAULT_H + GRID_H;
			w = 40 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Adds the following radio from 'SIA Framework Settings' to all units with the selected role";
		};
		class hasHandheldRadio: RscCheckBox
		{
			idc = 2803;
			onCheckedChanged = QUOTE(call FUNC(editRolesSaveRole););
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.25 * GRID_W - 5 * GRID_W;
			y = DIALOG_TOP + 13 * CTRL_DEFAULT_H + GRID_H;
			w = CTRL_DEFAULT_W;
			h = CTRL_DEFAULT_H;
		};
		class hasManpackRadio: RscCheckBox
		{
			idc = 2804;
			onCheckedChanged = QUOTE(call FUNC(editRolesSaveRole););
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.25 * GRID_W - 5 * GRID_W;
			y = DIALOG_TOP + 14.25 * CTRL_DEFAULT_H + GRID_H;
			w = CTRL_DEFAULT_W;
			h = CTRL_DEFAULT_H;
		};
		class hasHandheldRadioText: RscText
		{
			idc = -1;
			text = "Has Handheld";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.25 * GRID_W;
			y = DIALOG_TOP + 13 * CTRL_DEFAULT_H + GRID_H;
			w = 40 * GRID_W;
			h = CTRL_DEFAULT_H;
		};
		class hasManpackRadioText: RscText
		{
			idc = -1;
			text = "Has Manpack";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.25 * GRID_W;
			y = DIALOG_TOP + 14.25 * CTRL_DEFAULT_H + GRID_H;
			w = 40 * GRID_W;
			h = CTRL_DEFAULT_H;
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
			text = "SAVE";
			x = CENTERED_X(DIALOG_W) + GRID_W + DIALOG_W * GRID_W - 47 * GRID_W;
			y = DIALOG_TOP + DIALOG_H * GRID_H - GRID_H;
			w = 22 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Save changes and close the menu";
		};
		class cancelButton: ctrlButtonClose
		{
			idc = -1;
			text = "CANCEL";
			x = CENTERED_X(DIALOG_W) + GRID_W + DIALOG_W * GRID_W - 24 * GRID_W;
			y = DIALOG_TOP + DIALOG_H * GRID_H - GRID_H;
			w = 22 * GRID_W;
			h = CTRL_DEFAULT_H;
			onButtonClick = "(findDisplay 8501) closeDisplay 2;";
			tooltip = "Close the menu without saving changes";
		};
		class roleName: ctrlEdit
		{
			idc = 1400;
			text = "Role Name...";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 2 * GRID_W + 6 * GRID_W;
			y = DIALOG_TOP + 3.5 * CTRL_DEFAULT_H + GRID_H;
			w = (DIALOG_W / 2 - 11) * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Type in the name of a role to add or delete";
		};
		class roleNameText: RscText
		{
			idc = -1;
			text = "Role Settings";
			font = "RobotoCondensedBold";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 2 * GRID_W + 6 * GRID_W;
			y = DIALOG_TOP + 2 * CTRL_DEFAULT_H + GRID_H;
			w = 40 * GRID_W;
			h = CTRL_DEFAULT_H;
			shadow = 1;
			sizeEx = GUI_GRID_H * 1.2;
			tooltip = "Add, delete, or modify a custom role";
		};
		class createRole: ctrlButton
		{
			idc = 1603;
			action = QUOTE([ctrlText ((findDisplay 8501) displayCtrl 1400)] call FUNC(editRolesCreateRole););
			text = "Create Role";
			x = CENTERED_X(DIALOG_W) + GRID_W + DIALOG_W * GRID_W - 38 * GRID_W;
			y = DIALOG_TOP + 5 * CTRL_DEFAULT_H + GRID_H;
			w = 32 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Create a role with the name entered above";
		};
		class deleteRole: ctrlButton
		{
			idc = 1604;
			action = QUOTE([ctrlText ((findDisplay 8501) displayCtrl 1400)] call FUNC(editRolesDeleteRole););
			text = "Delete Role";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 2 * GRID_W + 6 * GRID_W;
			y = DIALOG_TOP + 5 * CTRL_DEFAULT_H + GRID_H;
			w = 32 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Delete the role matching the name entered above";
		};
		class editGroups: ctrlButton
		{
			idc = 1605;
			action = QUOTE([] call FUNC(editGroupsSpawn););
			text = "Role Groups";
			x = CENTERED_X(DIALOG_W) + GRID_W;
			y = DIALOG_TOP + DIALOG_H * GRID_H - GRID_H;
			w = 32 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Configure and edit the settings for role groups (aka 'Presets')";
		};
	};
};

class GVAR(additionalItemsEditor) {
	// this GUI is taken and modified from mharis001 - ACE3 (addons/arsenal/Cfg3DEN.hpp >> Attributes >> ace_arsenal_attribute)
	// background, footer, and menuStrip is taken and modified from R3vo - 3den-Enhanced >> VIM
	idd = 8502;
	onKeyDown = QUOTE([_this # 1] call FUNC(additionalItemsKeyDown););
	onUnload = QUOTE(call FUNC(editRolesCleanupGlobals););

	class controls {
		DISABLE_BACKGROUND
		class background: ctrlStaticBackground
		{
			idc = -1;
			x = CENTERED_X(DIALOG_W);
			y = DIALOG_TOP + CTRL_DEFAULT_H;
			w = DIALOG_W * GRID_W;
			h = DIALOG_H * GRID_H;
		};
		class title: ctrlStaticTitle
		{
			idc = 1000;
			text = "Additional Items Editor: ROLE_NAME";
			colorBackground[] = GUI_THEME_COLOR;
			x = CENTERED_X(DIALOG_W);
			y = DIALOG_TOP;
			w = DIALOG_W * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Configuration of the local arsenal items for specific SIA Mission Framework roles. \nNOTE that the gear each player spawns in with is already added to their local arsenal";
		};
		class footer: ctrlStaticFooter
		{
			idc = -1;
			x = CENTERED_X(DIALOG_W);
			y = DIALOG_TOP + DIALOG_H * GRID_H - 2 * GRID_H;
			w = DIALOG_W * GRID_W;
			h = CTRL_DEFAULT_H + 2 * GRID_H;
		};
		// Menu Strip
		class MenuStrip: ctrlMenuStrip // MENU BAR
		{
			idc = 4000;
			x = CENTERED_X(DIALOG_W);
			y = DIALOG_TOP + CTRL_DEFAULT_H;
			w = DIALOG_W * GRID_W;
			h = CTRL_DEFAULT_H;
			class Items
			{
				items[] =
				{
					"FolderHelp"
				};
				class FolderHelp
				{
					text = "Help";
					items[] = {"Documentation"};
				};
				// Help
				class Documentation
				{
					text = "Documentation";
					picture = "\a3\3DEN\Data\Controls\ctrlMenu\link_ca.paa";
					weblink = "https://github.com/Soliders-in-Arms-Arma-3-Group/sia3f/wiki"; //To-do: link to tutorial and any other help.
					opensNewWindow = 1;
				};
				class Default;
				class Separator;
			};
		};
		class category: ctrlToolboxPictureKeepAspect
		{
			idc = 2300;
			rows = 12;
			columns = 2;
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

			x = CENTERED_X(DIALOG_W) + GRID_W;
			y = DIALOG_TOP + (CTRL_DEFAULT_H * 2);
			w = CTRL_DEFAULT_W * 3;
			h = (DIALOG_H * GRID_H) - CTRL_DEFAULT_H * 2 - (GRID_H * 2);
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
		};
		class itemsBackground: ctrlStatic
		{
			idc = -1;
			x = CENTERED_X(DIALOG_W) + CTRL_DEFAULT_W * 3.5;
			y = DIALOG_TOP + 3 * CTRL_DEFAULT_H + GRID_H;
			w = (DIALOG_W / 1.125) * GRID_W;
			h = DIALOG_H * GRID_H - 4 * CTRL_DEFAULT_H + 2 * GRID_H;
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

			x = CENTERED_X(DIALOG_W) + CTRL_DEFAULT_W * 3.5;
			y = DIALOG_TOP + 3 * CTRL_DEFAULT_H + GRID_H;
			w = (DIALOG_W / 1.125) * GRID_W;
			h = DIALOG_H * GRID_H - 4 * CTRL_DEFAULT_H + 2 * GRID_H;
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
		/* class FilterSearch: ctrlCombo
		{
			idc = 3300;
			x = CENTERED_X(DIALOG_W) + GRID_W;
			y = DIALOG_TOP + DIALOG_H * GRID_H - GRID_H;
			w = 5 * GRID_W;
			h = CTRL_DEFAULT_H;
			// onLBSelChanged = To-Do: Add ability to filter by mod.
		}; */
		class searchBar: ctrlEdit
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

			x = CENTERED_X(DIALOG_W) + 6 * GRID_W;
			y = DIALOG_TOP + DIALOG_H * GRID_H - GRID_H;
			w = 40 * GRID_W;
			h = CTRL_DEFAULT_H;
		};
		class searchButton: ctrlButtonSearch
		{
			idc = 1606;
			onButtonClick = QUOTE( \
				private _searchBar = (findDisplay 8502) displayCtrl 1401; \
				_searchBar ctrlSetText ''; \
				ctrlSetFocus _searchBar; \
				call FUNC(additionalItemsAddItems); \
			);

			x = CENTERED_X(DIALOG_W) + 46 * GRID_W;
			y = DIALOG_TOP + DIALOG_H * GRID_H - GRID_H;
			w = 5 * GRID_W;
			h = CTRL_DEFAULT_H;
		};	
		class import: ctrlButton
		{
			idc = 1607;
			action = QUOTE([call compile copyFromClipboard] call FUNC(additionalItemsImport););
			text = "IMPORT";
			x = CENTERED_X(DIALOG_W) + CTRL_DEFAULT_W * 3.5;
			y = DIALOG_TOP + 2 * CTRL_DEFAULT_H + GRID_H;
			w = 22 * GRID_W;
			h = CTRL_DEFAULT_H;
			colorBackground[] = {0,0,0,0.6};
			tooltip = "Import items list array from clipboard (should be the same format as export)";
		};
		class export: ctrlButton
		{
			idc = 1608;
			action = QUOTE(copyToClipboard str (uiNamespace getVariable [ARR_2(QQGVAR(additionalItems),[])]););
			text = "EXPORT";
			x = CENTERED_X(DIALOG_W) + CTRL_DEFAULT_W * 8.25;
			y = DIALOG_TOP + 2 * CTRL_DEFAULT_H + GRID_H;
			w = 22 * GRID_W;
			h = CTRL_DEFAULT_H;
			colorBackground[] = {0,0,0,0.6};
			tooltip = "Export current items list as an array for use in scripts";
		};
		class clear: ctrlButton
		{
			idc = 1609;
			action = QUOTE(call FUNC(additionalItemsClear););
			text = "CLEAR";
			x = CENTERED_X(DIALOG_W) + CTRL_DEFAULT_W * 13;
			y = DIALOG_TOP + 2 * CTRL_DEFAULT_H + GRID_H;
			w = 22 * GRID_W;
			h = CTRL_DEFAULT_H;
			colorBackground[] = {0,0,0,0.6};
			tooltip = "Clear all current items from the list";
		};
		
		class addCompatible: ctrlButton
		{
			idc = 1610;
			text = "Add Compatible Items";
			tooltip = "Will automatically add compatible attachments or magazines (based on selected category) for all weapons in current items list";
			style = "0x02";
			font = "RobotoCondensedLight";
			action = QUOTE(call FUNC(additionalItemsAddCompatible););

			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.3 * GRID_W;
			y = DIALOG_TOP + 2 * CTRL_DEFAULT_H + GRID_H;
			w = 35 * GRID_W;
			h = CTRL_DEFAULT_H;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 4 * (pixelH * pixelGrid * 0.5);
		};
		class Ok: ctrlButton
		{
			idc = 1611;
			text = "SAVE";
			action = QUOTE(call FUNC(additionalItemsSave););
			x = CENTERED_X(DIALOG_W) + GRID_W + DIALOG_W * GRID_W - 47 * GRID_W;
			y = DIALOG_TOP + DIALOG_H * GRID_H - GRID_H;
			w = 22 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Save changes and return to the previous menu";
		};
		class cancel: ctrlButtonClose
		{
			idc = 1612;
			text = "CANCEL";
			action = "(findDisplay 8502) closeDisplay 2;";
			x = CENTERED_X(DIALOG_W) + GRID_W + DIALOG_W * GRID_W - 24 * GRID_W;
			y = DIALOG_TOP + DIALOG_H * GRID_H - GRID_H;
			w = 22 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Close the menu without saving changes";
		};
	};
};

class GVAR(editGroups) {
	// this GUI is taken and modified from R3vo - 3den-Enhanced >> VIM
	idd = 8503;
	onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(editGroupsCurrentMode),0)];);
	onUnload = QUOTE(call FUNC(editRolesCleanupGlobals););
	onKeyDown = QUOTE([_this # 1] call FUNC(editGroupsKeyDown););

	class controls {
		DISABLE_BACKGROUND
		class background: ctrlStaticBackground
		{
			idc = -1;
			x = CENTERED_X(DIALOG_W);
			y = DIALOG_TOP + CTRL_DEFAULT_H;
			w = DIALOG_W * GRID_W;
			h = DIALOG_H * GRID_H;
		};
		class title: ctrlStaticTitle
		{
			idc = -1;
			text = "Group Editor";
			colorBackground[] = GUI_THEME_COLOR;
			x = CENTERED_X(DIALOG_W);
			y = DIALOG_TOP;
			w = DIALOG_W * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Create and edit groups of roles, allowing for items and settings to be applied to multiple roles at once";
		};
		class Footer: ctrlStaticFooter
		{
			idc = -1;
			x = CENTERED_X(DIALOG_W);
			y = DIALOG_TOP + DIALOG_H * GRID_H - 2 * GRID_H;
			w = DIALOG_W * GRID_W;
			h = CTRL_DEFAULT_H + 2 * GRID_H;
		};
		class MenuStrip: ctrlMenuStrip // MENU BAR
		{
			idc = 4000;
			x = CENTERED_X(DIALOG_W);
			y = DIALOG_TOP + CTRL_DEFAULT_H;
			w = DIALOG_W * GRID_W;
			h = CTRL_DEFAULT_H;

			class Items
			{
				items[] =
				{
					// "FolderTools",
					"FolderHelp"
				};
				/* class FolderTools
				{
					text = "Tools";
					items[] = 
					{
						"WIP" // To-do: Add delete all, reset, import, export
					};
				}; */
				class FolderHelp
				{
					text = "Help";
					items[] = {"Documentation"};
				};

				// Tools
				/* class WIP
				{
					text = "WIP"; 
				}; */
				// Help
				class Documentation
				{
					text = "Documentation";
					picture = "\a3\3DEN\Data\Controls\ctrlMenu\link_ca.paa";
					weblink = "https://github.com/Soliders-in-Arms-Arma-3-Group/sia3f/wiki"; //To-do: link to tutorial and any other help.
					opensNewWindow = 1;
				};
				class Default;
				class Separator;
			};
		};
		class groupSelectText: ctrlStatic
		{
		idc = 1000;
			text = "Available Groups";
			x = CENTERED_X(DIALOG_W) + GRID_W;
			y = DIALOG_TOP + 2 * CTRL_DEFAULT_H + GRID_H;
			w = 40 * GRID_W;
			h = CTRL_DEFAULT_H;
			font = "RobotoCondensedBold";
			shadow = 1;
			sizeEx = GUI_GRID_H * 1.2;
			tooltip = "List of default, imported, and user-created roles";
		};
		class groupSelect: ctrlListbox
		{
			idc = 1500;
			onLBSelChanged = QUOTE([ARR_2(_this # 1, false)] call FUNC(editGroupsRefresh));

			x = CENTERED_X(DIALOG_W) + GRID_W;
			y = DIALOG_TOP + 3 * CTRL_DEFAULT_H + GRID_H;
			w = (DIALOG_W / 2 - 1) * GRID_W;
			h = DIALOG_H * GRID_H - 4 * CTRL_DEFAULT_H + 2 * GRID_H;
		};
		class okButton: ctrlButton
		{
			idc = 1613;
			action = QUOTE( \
				private _rolesHash = uiNamespace getVariable [ARR_2(QQGVAR(roles), createHashMap)]; \
				private _groupsHash = uiNamespace getVariable [ARR_2(QQGVAR(groups), createHashMap)]; \
				QQGVAR(hiddenConfigValues) set3DENMissionAttribute [ARR_2(QQGVAR(roles), _rolesHash)]; \
				QQGVAR(hiddenConfigValues) set3DENMissionAttribute [ARR_2(QQGVAR(groups), _groupsHash)]; \
				do3DENAction ""MissionSave""; \
				(findDisplay 8503) closeDisplay 2; \
			);
			text = "SAVE";
			x = CENTERED_X(DIALOG_W) + GRID_W + DIALOG_W * GRID_W - 47 * GRID_W;
			y = DIALOG_TOP + DIALOG_H * GRID_H - GRID_H;
			w = 22 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Save changes and close the menu";
		};
		class cancelButton: ctrlButtonClose
		{
			idc = 1614;
			onButtonClick = "(findDisplay 8503) closeDisplay 2;";
			text = "CANCEL";
			x = CENTERED_X(DIALOG_W) + GRID_W + DIALOG_W * GRID_W - 24 * GRID_W;
			y = DIALOG_TOP + DIALOG_H * GRID_H - GRID_H;
			w = 22 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Close the menu without saving changes";
		};
		class groupName: ctrlEdit
		{
			idc = 1400;
			text = "Group Name...";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 2 * GRID_W + 6 * GRID_W;
			y = DIALOG_TOP + 3.5 * CTRL_DEFAULT_H + GRID_H;
			w = (DIALOG_W / 2 - 11) * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Type in the name of a group to add or delete";
		};
		class groupNameText: RscText
		{
			idc = -1;
			text = "Group Editor";
			font = "RobotoCondensedBold";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 2 * GRID_W + 6 * GRID_W;
			y = DIALOG_TOP + 2 * CTRL_DEFAULT_H + GRID_H;
			w = 40 * GRID_W;
			h = CTRL_DEFAULT_H;
			shadow = 1;
			sizeEx = GUI_GRID_H * 1.2;
			tooltip = "Add, delete, or modify a custom group \nAdd or remove roles to the selected group using the list below";
		};
		class createGroup: ctrlButton
		{
			idc = 1615;
			action = QUOTE([ctrlText ((findDisplay 8503) displayCtrl 1400)] call FUNC(editGroupsCreateGroup););

			text = "Create Group";
			x = CENTERED_X(DIALOG_W) + GRID_W + DIALOG_W * GRID_W - 38 * GRID_W;
			y = DIALOG_TOP + 5 * CTRL_DEFAULT_H + GRID_H;
			w = 32 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Create a group with the name entered above";
		};
		class deleteGroup: ctrlButton
		{
			idc = 1616;
			action = QUOTE([ctrlText ((findDisplay 8503) displayCtrl 1400)] call FUNC(editGroupsDeleteGroup););

			text = "Delete Group";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 2 * GRID_W + 6 * GRID_W;
			y = DIALOG_TOP + 5 * CTRL_DEFAULT_H + GRID_H;
			w = 32 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Delete the group matching the name entered above";
		};
		class rolesBackground: ctrlStatic
		{
			idc = 1000;
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 2 * GRID_W + 6 * GRID_W;
			y = DIALOG_TOP + 7 * CTRL_DEFAULT_H + GRID_H;
			w = (DIALOG_W / 2 - 11) * GRID_W;
			h = DIALOG_H * GRID_H - 10 * CTRL_DEFAULT_H + 2 * GRID_H;
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

			x = CENTERED_X(DIALOG_W) + DIALOG_W / 2 * GRID_W + 6 * GRID_W;
			y = DIALOG_TOP + 7 * CTRL_DEFAULT_H + GRID_H;
			w = (DIALOG_W / 2 - 11) * GRID_W;
			h = DIALOG_H * GRID_H - 10 * CTRL_DEFAULT_H + 2 * GRID_H;
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
		class editRoles: ctrlButton
		{
			idc = 1604;
			action = QUOTE(call FUNC(editRolesSpawn););
			text = "Edit Roles";
			x = CENTERED_X(DIALOG_W) + GRID_W;
			y = DIALOG_TOP + DIALOG_H * GRID_H - GRID_H;
			w = 32 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Return to the role editor";
		};	
		class editGroupsSettings: ctrlButton
		{
			idc = 1605;
			action = QUOTE([1] call FUNC(editGroupsMode););
			text = "Group Settings";
			x = CENTERED_X(DIALOG_W) + GRID_W + 33 * GRID_W;
			y = DIALOG_TOP + DIALOG_H * GRID_H - GRID_H;
			w = 36 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Configure the settings and additional items for your groups";
		};
	};
};

class GVAR(editGroupsSettings) {
	// this GUI is taken and modified from R3vo - 3den-Enhanced >> VIM
	idd = 8504;
	onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(editGroupsCurrentMode),1)];);
	onUnload = QUOTE(call FUNC(editRolesCleanupGlobals););

	class controls {
		DISABLE_BACKGROUND
		class background: ctrlStaticBackground
		{
			idc = -1;
			//text = "#(argb,8,8,3)color(0.075,0.075,0.075,0.8)";
			x = CENTERED_X(DIALOG_W);
			y = DIALOG_TOP + CTRL_DEFAULT_H;
			w = DIALOG_W * GRID_W;
			h = DIALOG_H * GRID_H;
		};
		class title: ctrlStaticTitle
		{
			idc = -1;
			text = "Group Editor";
			colorBackground[] = GUI_THEME_COLOR;
			x = CENTERED_X(DIALOG_W);
			y = DIALOG_TOP;
			w = DIALOG_W * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Create and edit groups of roles, allowing for items and settings to be applied to multiple roles at once";
		};
		class Footer: ctrlStaticFooter
		{
			idc = -1;
			x = CENTERED_X(DIALOG_W);
			y = DIALOG_TOP + DIALOG_H * GRID_H - 2 * GRID_H;
			w = DIALOG_W * GRID_W;
			h = CTRL_DEFAULT_H + 2 * GRID_H;
		};
		class MenuStrip: ctrlMenuStrip // MENU BAR
		{
			idc = 4000;
			x = CENTERED_X(DIALOG_W);
			y = DIALOG_TOP + CTRL_DEFAULT_H;
			w = DIALOG_W * GRID_W;
			h = CTRL_DEFAULT_H;

			class Items
			{
				items[] =
				{
					// "FolderTools",
					"FolderHelp"
				};
				/* class FolderTools
				{
					text = "Tools";
					items[] = 
					{
						"WIP" // To-do: Add delete all, reset, import, export
					};
				}; */
				class FolderHelp
				{
					text = "Help";
					items[] = {"Documentation"};
				};

				// Tools
				/* class WIP
				{
					text = "WIP"; 
				}; */
				// Help
				class Documentation
				{
					text = "Documentation";
					picture = "\a3\3DEN\Data\Controls\ctrlMenu\link_ca.paa";
					weblink = "https://github.com/Soliders-in-Arms-Arma-3-Group/sia3f/wiki"; //To-do: link to tutorial and any other help.
					opensNewWindow = 1;
				};
				class Default;
				class Separator;
			};
		};
		class groupSelectText: ctrlStatic
		{
			idc = 1000;
			text = "Available Groups";
			x = CENTERED_X(DIALOG_W) + GRID_W;
			y = DIALOG_TOP + 2 * CTRL_DEFAULT_H + GRID_H;
			w = 40 * GRID_W;
			h = CTRL_DEFAULT_H;
			font = "RobotoCondensedBold";
			shadow = 1;
			sizeEx = GUI_GRID_H * 1.2;
			tooltip = "List of default, imported, and user-created roles";
		};
		class groupSelect: ctrlListbox
		{
			idc = 1500;
			onLBSelChanged = QUOTE([ARR_2(_this # 1, false)] call FUNC(editGroupsRefresh));

			x = CENTERED_X(DIALOG_W) + GRID_W;
			y = DIALOG_TOP + 3 * CTRL_DEFAULT_H + GRID_H;
			w = (DIALOG_W / 2 - 1) * GRID_W;
			h = DIALOG_H * GRID_H - 4 * CTRL_DEFAULT_H + 2 * GRID_H;
		};
		class okButton: ctrlButton
		{
			idc = 1613;
			action = QUOTE( \
				private _rolesHash = uiNamespace getVariable [ARR_2(QQGVAR(roles), createHashMap)]; \
				private _groupsHash = uiNamespace getVariable [ARR_2(QQGVAR(groups), createHashMap)]; \
				QQGVAR(hiddenConfigValues) set3DENMissionAttribute [ARR_2(QQGVAR(roles), _rolesHash)]; \
				QQGVAR(hiddenConfigValues) set3DENMissionAttribute [ARR_2(QQGVAR(groups), _groupsHash)]; \
				do3DENAction ""MissionSave""; \
				(findDisplay 8504) closeDisplay 2; \
			);
			text = "SAVE";
			x = CENTERED_X(DIALOG_W) + GRID_W + DIALOG_W * GRID_W - 47 * GRID_W;
			y = DIALOG_TOP + DIALOG_H * GRID_H - GRID_H;
			w = 22 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Save changes and close the menu";
		};
		class cancelButton: ctrlButtonClose
		{
			idc = 1614;
			action = "(findDisplay 8504) closeDisplay 2;";
			text = "CANCEL";
			x = CENTERED_X(DIALOG_W) + GRID_W + DIALOG_W * GRID_W - 24 * GRID_W;
			y = DIALOG_TOP + DIALOG_H * GRID_H - GRID_H;
			w = 22 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Close the menu without saving changes";
		};
		class groupName: ctrlEdit
		{
			idc = 1400;
			text = "Group Name...";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 2 * GRID_W + 6 * GRID_W;
			y = DIALOG_TOP + 3.5 * CTRL_DEFAULT_H + GRID_H;
			w = (DIALOG_W / 2 - 11) * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Type in the name of a group to add or delete";
		};
		class groupNameText: RscText
		{
			idc = -1;
			text = "Group Settings";
			font = "RobotoCondensedBold";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 2 * GRID_W + 6 * GRID_W;
			y = DIALOG_TOP + 2 * CTRL_DEFAULT_H + GRID_H;
			w = 40 * GRID_W;
			h = CTRL_DEFAULT_H;
			shadow = 1;
			sizeEx = GUI_GRID_H * 1.2;
			tooltip = "Add, delete, or modify a custom group";
		};
		class createGroup: ctrlButton
		{
			idc = 1615;
			action = QUOTE([ctrlText ((findDisplay 8504) displayCtrl 1400)] call FUNC(editGroupsCreateGroup););

			text = "Create Group";
			x = CENTERED_X(DIALOG_W) + GRID_W + DIALOG_W * GRID_W - 38 * GRID_W;
			y = DIALOG_TOP + 5 * CTRL_DEFAULT_H + GRID_H;
			w = 32 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Create a group with the name entered above";
		};
		class deleteGroup: ctrlButton
		{
			idc = 1616;
			action = QUOTE([ctrlText ((findDisplay 8504) displayCtrl 1400)] call FUNC(editGroupsDeleteGroup););

			text = "Delete Group";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 2 * GRID_W + 6 * GRID_W;
			y = DIALOG_TOP + 5 * CTRL_DEFAULT_H + GRID_H;
			w = 32 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Delete the group matching the name entered above";
		};
		class isMedic: RscCheckBox
		{
			idc = 2801;
			onCheckedChanged = QUOTE(call FUNC(editGroupsSaveSettings););
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.75 * GRID_W - 5 * GRID_W;
			y = DIALOG_TOP + 13 * CTRL_DEFAULT_H + GRID_H;
			w = CTRL_DEFAULT_W;
			h = CTRL_DEFAULT_H;
		};
		class additionalItems: ctrlButton
		{
			idc = 1600;
			action = QUOTE( \
				private _ctrl = ((findDisplay 8504) displayCtrl 1500); \
				[ARR_2(_ctrl lbText (lbCurSel _ctrl), true)] call FUNC(additionalItemsSpawn); \
			);
			text = "Edit Additional Items";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.75 * GRID_W;
			y = DIALOG_TOP + 7 * CTRL_DEFAULT_H + GRID_H;
			w = (DIALOG_W / 2.75) * GRID_W;
			h = CTRL_DEFAULT_H * 2.5;
			tooltip = "Edit the items available to all roles in the selected group";
		};
		class traitOptionsText: RscText
		{
			idc = 1001;
			text = "Trait Options";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.75 * GRID_W - 4 * GRID_W;
			y = DIALOG_TOP + 11.75 * CTRL_DEFAULT_H + GRID_H;
			w = 40 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Adds the following trait to all roles in the selected group";
		};
		class isEngineer: RscCheckBox
		{
			idc = 2802;
			onCheckedChanged = QUOTE(call FUNC(editGroupsSaveSettings););
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.75 * GRID_W - 5 * GRID_W;
			y = DIALOG_TOP + 14.25 * CTRL_DEFAULT_H + GRID_H;
			w = CTRL_DEFAULT_W;
			h = CTRL_DEFAULT_H;
		};
		class isMedicText: RscText
		{
			idc = -1;
			text = "Is Medic";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.75 * GRID_W;
			y = DIALOG_TOP + 13 * CTRL_DEFAULT_H + GRID_H;
			w = 40 * GRID_W;
			h = CTRL_DEFAULT_H;
		};
		class isEngineerText: RscText
		{
			idc = 1002;
			text = "Is Engineer";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.75 * GRID_W;
			y = DIALOG_TOP + 14.25 * CTRL_DEFAULT_H + GRID_H;
			w = 40 * GRID_W;
			h = CTRL_DEFAULT_H;
		};
		class radioOptionsText: RscText
		{
			idc = -1;
			text = "Radio Options";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.25 * GRID_W - 4 * GRID_W;
			y = DIALOG_TOP + 11.75 * CTRL_DEFAULT_H + GRID_H;
			w = 40 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Adds the following radio from 'SIA Framework Settings' to all roles in the selected group";
		};
		class hasHandheldRadio: RscCheckBox
		{
			idc = 2803;
			onCheckedChanged = QUOTE(call FUNC(editGroupsSaveSettings););
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.25 * GRID_W - 5 * GRID_W;
			y = DIALOG_TOP + 13 * CTRL_DEFAULT_H + GRID_H;
			w = CTRL_DEFAULT_W;
			h = CTRL_DEFAULT_H;
		};
		class hasManpackRadio: RscCheckBox
		{
			idc = 2804;
			onCheckedChanged = QUOTE(call FUNC(editGroupsSaveSettings););
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.25 * GRID_W - 5 * GRID_W;
			y = DIALOG_TOP + 14.25 * CTRL_DEFAULT_H + GRID_H;
			w = CTRL_DEFAULT_W;
			h = CTRL_DEFAULT_H;
		};
		class hasHandheldRadioText: RscText
		{
			idc = -1;
			text = "Has Handheld";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.25 * GRID_W;
			y = DIALOG_TOP + 13 * CTRL_DEFAULT_H + GRID_H;
			w = 40 * GRID_W;
			h = CTRL_DEFAULT_H;
		};
		class hasManpackRadioText: RscText
		{
			idc = -1;
			text = "Has Manpack";
			x = CENTERED_X(DIALOG_W) + DIALOG_W / 1.25 * GRID_W;
			y = DIALOG_TOP + 14.25 * CTRL_DEFAULT_H + GRID_H;
			w = 40 * GRID_W;
			h = CTRL_DEFAULT_H;
		};
		class editRoles: ctrlButton
		{
			idc = 1604;
			action = QUOTE(call FUNC(editRolesSpawn););
			text = "Edit Roles";
			x = CENTERED_X(DIALOG_W) + GRID_W;
			y = DIALOG_TOP + DIALOG_H * GRID_H - GRID_H;
			w = 32 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Return to the role editor";
		};
		class editGroups: ctrlButton
		{
			idc = 1605;
			action = QUOTE([] call FUNC(editGroupsSpawn););
			text = "Edit Groups";
			x = CENTERED_X(DIALOG_W) + GRID_W + 33 * GRID_W;
			y = DIALOG_TOP + DIALOG_H * GRID_H - GRID_H;
			w = 36 * GRID_W;
			h = CTRL_DEFAULT_H;
			tooltip = "Return to the group editor";
		};
	};
};
