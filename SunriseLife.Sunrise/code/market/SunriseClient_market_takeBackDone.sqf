/*

	Filename:	SunriseClient_market_takeBackDone.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_item","",[""]],
	["_amount",0,[0]]
];

life_market_wait = false;
for "_x" from 1 to _amount step 1 do {
	[_item] call SunriseClient_system_addItem;
};
player say3D "caching";
hint "Вы успешно забрали свой лот!";
closedialog 0;