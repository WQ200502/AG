/*

	Filename: 	SunriseClient_system_clearVehicleAmmo.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0,Objnull,[Objnull]];
if (isNull _vehicle) exitWith {}; //DAFUQ
private _veh = typeOf _vehicle;

switch(true) do {
	case (_veh in ["B_Boat_Armed_01_minigun_F","I_Boat_Armed_01_minigun_F"]): {
		_vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
	};

	case (EQUAL(_veh,"I_Plane_Fighter_03_CAS_F")): {
		_vehicle removeMagazinesTurret ["300Rnd_20mm_shells",[-1]];
		_vehicle removeMagazinesTurret ["2Rnd_LG_scalpel",[-1]];
		_vehicle removeMagazinesTurret ["2Rnd_AAA_missiles",[-1]];
		_vehicle removeMagazinesTurret ["2Rnd_GBU12_LGB_MI10",[-1]];
		_vehicle removeMagazinesTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
	};

	case (EQUAL(_veh,"I_Plane_Fighter_03_AA_F")): {
		_vehicle removeMagazinesTurret ["300Rnd_20mm_shells",[-1]];
		_vehicle removeMagazinesTurret ["2Rnd_AAA_missiles",[-1]];
		_vehicle removeMagazinesTurret ["4Rnd_GAA_missiles",[-1]];
		_vehicle removeMagazinesTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
		_vehicle removeMagazinesTurret ["2Rnd_AAA_missiles_MI06",[-1]];
	};

	case (EQUAL(_veh,"O_APC_Tracked_02_AA_F")): {
		_vehicle removeMagazinesTurret ["4Rnd_Titan_long_missiles",[0]];
	};

	case (EQUAL(_veh,"B_UAV_02_F")): {
		_vehicle removeMagazinesTurret ["6Rnd_LG_scalpel",[0]];
	};

	case (_veh in ["B_mas_UH60M_kra","B_mas_UH60M_VRS"]): {
		_vehicle removeMagazinesTurret ["5000Rnd_762x51_Belt",[0]];
		_vehicle removeMagazinesTurret ["5000Rnd_762x51_Belt",[1]];
	};

	case (EQUAL(_veh,"B_mas_UH60M_SF")): {
		_vehicle removeMagazinesTurret ["5000Rnd_762x51_Belt",[0]];
		_vehicle removeMagazinesTurret ["5000Rnd_762x51_Belt",[1]];

		_vehicle addMagazineTurret ["5000Rnd_762x51_Belt",[0],2000];
		_vehicle addMagazineTurret ["5000Rnd_762x51_Belt",[1],2000];
	};
};

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;