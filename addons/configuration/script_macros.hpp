#define SET_CONFIG(section,var,value) (QGVAR(section) set3DENMissionAttribute [QGVAR(var), value])

// user defined GUI colors
#define GUI_THEME_RGB_R "(profileNamespace getVariable ['GUI_BCG_RGB_R',0.13])"
#define GUI_THEME_RGB_G "(profileNamespace getVariable ['GUI_BCG_RGB_G',0.54])"
#define GUI_THEME_RGB_B "(profileNamespace getVariable ['GUI_BCG_RGB_B',0.21])"
#define GUI_THEME_ALPHA "(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"

#define DIALOG_W 200
#define DIALOG_H 140

#define CENTERED_X(w) (CENTER_X - (w / 2 * GRID_W))
#define DIALOG_TOP (safezoneY + 17 * GRID_H)
#define CTRL_DEFAULT_H (SIZE_M * GRID_H)
#define CTRL_DEFAULT_W (SIZE_M * GRID_W)
