/*

	Filename: 	SunriseClient_loadout_medic.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
[] call SunriseClient_system_stripDownPlayer;

player addUniform (selectRandom ["Sunrise_short_spawn1","A3LCatShirt","Sunrise_short_spawn2","A3LCloudShirt","Sunrise_short_spawn3","CR_Hawaii_Shirt","Sunrise_short_spawn4","Sunrise_short_spawn5"]);

/* ПРЕДМЕТЫ */
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "tf_microdagr";
player assignItem "tf_microdagr";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "tf_fadak";
player assignItem "tf_fadak";

[] call SunriseClient_system_saveGear;