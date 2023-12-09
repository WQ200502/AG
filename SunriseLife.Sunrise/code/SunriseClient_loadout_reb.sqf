/*

	Filename: 	SunriseClient_loadout_reb.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
[] call SunriseClient_system_stripDownPlayer;

player forceAddUniform "TRYK_U_B_TANOCP_R_CombatUniformTshirt";

player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "tf_microdagr";
player assignItem "tf_microdagr";

[] call SunriseClient_system_saveGear;