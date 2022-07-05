class CfgGroups {
	class West {
		side = 1;
		class GVAR(compositionsFolder) {
			name = "SIA";
			class GVAR(compositions) {
				name = "SIA Compositions";

				// side: https://community.bistudio.com/wiki/BIS_fnc_sideID
				// vehicle: https://community.bistudio.com/wiki/Arma_3:_CfgVehicles_WEST
				// rank: https://community.bistudio.com/wiki/rank
				// position

				class GVAR(missionTemplate) {
					name = "SIA Mission Framework Template";
					icon = "\a3\Ui_f\data\Map\Markers\Military\unknown_ca.paa";
					side = 1;
					class Object0 { side = 1; vehicle = "B_Soldier_F"; rank = "PRIVATE"; position[] = {0,0,0}; dir = 0; };
					class Object1 { side = 8; vehicle = "Land_SM_01_shelter_wide_F"; rank = ""; position[] = {1,1,0}; dir = 90; };
				};
			};
		};
	};
};
