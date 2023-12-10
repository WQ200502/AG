/*

	Filename:	SunriseServer_market_sell.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_quantity",0,[0]],
	["_price",0,[0]],
	["_item","",[""]],
	["_itemName","",[""]],
	["_playerName","",[""]],
	["_tax",0,[0]],
	["_unit",objNull,[objNull]]
];
_uid = getPlayerUID _unit;

market_loaded = false;
publicVariable "market_loaded";

format["insertInMarket:%1:%2:%3:%4:%5:%6",_quantity,_item,_itemName,_price,_uid,_playerName] call SunriseServer_database_fireAndForget;
["Market",format ["|Market_sell| UID - '%1' (%2) || ITEM - '%2' || PRICE - '%3' || AMOUNT = '%4'",_uid,_playerName,_item,_price,_quantity]] call SunriseServer_system_customLog;
[] spawn SunriseServer_market_init;

market_loaded = true;
publicVariable "market_loaded";

[_item,_price,_tax] remoteExecCall ["SunriseClient_market_sellDone",_unit];