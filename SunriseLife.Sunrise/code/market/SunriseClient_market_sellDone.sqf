/*

	Filename:	SunriseClient_market_sellDone.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_item","",[""]],
	["_amount",0,[0]],
	["_tax",0,[0]]
];

life_market_wait = false;
for "_x" from 1 to _amount step 1 do {
	[_item] spawn SunriseClient_system_removeItem;
};
hint "Лот успешно добавлен!";
player say3D "caching";
["atm","take",_tax] call SunriseClient_system_myCash;
[] call SunriseClient_system_saveGear;
closeDialog 0;