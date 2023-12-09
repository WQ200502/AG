/*
	
	Filename: 	SunriseClient_system_chopShopOwnDone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_price",0,[0]]
];

life_action_inUse = false;
["cash","take",_price] call SunriseClient_system_myCash;
["Вы успешно перебили машину!","done"] call SunriseClient_gui_bottomNotification;