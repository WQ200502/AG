/*

	Filename: 	SunriseClient_effects_TempVars.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
LIFE_HANDLE_TEMPVARS = [{
	if !(life_ids isEqualTo []) then {
		{
			if (time - (_x select 1) > 600) then {life_ids set [_forEachIndex,-1]};
		} forEach life_ids;	
		life_ids = life_ids - [-1];
	};

	if !(life_tempHouses isEqualTo []) then {
		{
			if (player distance (_x) > 50) then {life_tempHouses set [_forEachIndex,-1];["Вы далеко отошли от взломанного дома и потеряли ключи","info"] call SunriseClient_gui_bottomNotification}
		} forEach life_tempHouses;
		life_tempHouses = life_tempHouses - [-1];
	};
},10] call CBA_fnc_addPerFrameHandler;