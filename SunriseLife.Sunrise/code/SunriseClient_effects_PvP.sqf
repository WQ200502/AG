/*

	Filename: 	SunriseClient_effects_PvP.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
LIFE_HANDLE_PVP = [{
	if !(life_pvp) exitWith {[_this#1] call CBA_fnc_removePerFrameHandler;LIFE_HANDLE_PVP = -1};
	_pvpstart = life_pvp_start;	
	if !(player GVAR ["pvp",false]) then {
		//systemchat format ["Вы перешли в PvP режим на %1 минут", LIFE_SETTINGS(getNumber,"life_pvpTimer")];
		
		["error","",format ["Вы перешли в PvP режим на %1 минут", LIFE_SETTINGS(getNumber,"life_pvpTimer")]] call SunriseClient_message;		
		player SVAR ["pvp",true,true];						
	};		
	
	if (((time - _pvpstart) > (LIFE_SETTINGS(getNumber,"life_pvpTimer") * 60)) && {EQUAL(life_pvp_start,_pvpstart)}) then {
		//systemchat "Вы вышли из PvP режима";
		
		["done","",format ["Вы вышли из PvP режима"]] call SunriseClient_message;	
		[player,"pvp"] call SunriseClient_system_clearGlobalVar;
		life_pvp = false;			
		life_pvp_start = 0;
		[player,"houseRaid"] call SunriseClient_system_clearGlobalVar;
	};

},1] call CBA_fnc_addPerFrameHandler;