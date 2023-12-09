/*

	Filename: 	SunriseClient_effects_FoodWater.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
LIFE_HANDLE_FOODWATER = [{
	if (life_hunger < 5) then {
		[player,player] call SunriseClient_dmg_Agony; hint localize "STR_NOTF_EatMSG_Death";
	} else {			
		if (life_diarrhea) then {SUB(life_hunger,2)} else {SUB(life_hunger,1)};	
		switch (true) do {
			case (life_hunger < 30 && life_hunger > 20): {[localize "STR_NOTF_EatMSG_1","warning"] call SunriseClient_gui_bottomNotification};
			case (life_hunger < 20 && life_hunger > 10): {[localize "STR_NOTF_EatMSG_2","warning"] call SunriseClient_gui_bottomNotification;player setFatigue 1;};
			case (life_hunger < 10 && life_hunger > 5): {[localize "STR_NOTF_EatMSG_3","warning"] call SunriseClient_gui_bottomNotification;player setFatigue 1;};
		};
		if (life_hunger < 20) then {player say3D "hunger"};
	};
	if (life_thirst < 5) then {
		[player,player] call SunriseClient_dmg_Agony; hint localize "STR_NOTF_DrinkMSG_Death";
	} else {			
		if (life_diarrhea) then {SUB(life_thirst,3)} else {SUB(life_thirst,1)};	
		switch (true) do {
			case (life_thirst < 30 && life_thirst > 20): {[localize "STR_NOTF_DrinkMSG_1","warning"] call SunriseClient_gui_bottomNotification};
			case (life_thirst < 20 && life_thirst > 10): {[localize "STR_NOTF_DrinkMSG_2","warning"] call SunriseClient_gui_bottomNotification; player setFatigue 1};
			case (life_thirst < 10 && life_thirst > 5): {[localize "STR_NOTF_DrinkMSG_3","warning"] call SunriseClient_gui_bottomNotification; player setFatigue 1};
		};
		if (life_thirst < 20) then {player say3D "thirst"};
	};
},72] call CBA_fnc_addPerFrameHandler;