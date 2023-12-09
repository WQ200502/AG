/*
	
	Filename: 	SunriseClient_system_chopShopSellDone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_price",0,[0]]
];

life_action_inUse = false;
["cash","add",_price,"chopShopSell"] call SunriseClient_system_myCash;
[format["Вы продали технику за $%1",[_price] call SunriseClient_system_numberText],"done"] call SunriseClient_gui_bottomNotification;