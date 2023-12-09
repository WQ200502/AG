/*

	Filename:	SunriseClient_market_buyDone.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_item","",[""]],
	["_amount",0,[0]],
	["_value",0,[0]]
];
life_market_wait = false;
["atm","take",_value] call SunriseClient_system_myCash;

for "_x" from 1 to _amount step 1 do {
	[_item] call SunriseClient_system_addItem;
};
player say3D "caching";
hint "Лот успешно выкуплен!";
closeDialog 0;