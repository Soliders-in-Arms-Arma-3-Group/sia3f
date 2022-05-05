class CfgPatches {
	class SIA_3DEN_Framework {
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = { 3DEN };
		is3DENmod = 1;
	};
};


class ctrlMenuStrip;
class display3DEN {
	class Controls {
		class MenuStrip: ctrlMenuStrip {
			class Items {
				items[] += { "SIA_FrameworkFolder" };
				class SIA_FrameworkFolder {
					text = "SIA Mission Framework";
					items[] += { "SIA_TestTool" };
				};
				class SIA_TestTool {
					text = "Test"; // Item text
					// picture = "\MyAddon\data\myAwesomeTool_ca.paa"; // Item picture
					// action = "[] call ME_fnc_MyAwesomeTool;";// Expression called upon clicking; ideally, it should call your custom function
                    opensNewWindow = 1;// Adds ... to the name of the menu entry, indicating the user that a new window will be opened.
				};
			};
		};
	};
};