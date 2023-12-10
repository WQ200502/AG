/*

	Filename: 	SunriseServer_ltd_updateitemshopdatabase.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\..\script_macros.hpp"

params [
	["_unit",objNull,[objNull]],
	["_shop",objNull,[objNull]],	
	["_shopId",-1,[0]],
	["_ltdId",-1,[0]],	
	["_itemClass","",[""]],
	["_itemCount",-1,[0]],	
	["_itemPrice",-1,[0]],
	["_delete",false,[false]]
];

if (isNull _unit) exitWith {"_unit isNull" call SunriseServer_system_log};
if (isNull _shop) exitWith {"_shop isNull" call SunriseServer_system_log};

private _unitID = getPlayerUID _unit;
private _unitName = GVAR_RNAME(_unit);

_unit = owner _unit;

if (EQUAL(_itemClass,"")) exitWith {"updateItemShopDatabase bad _itemClass" call SunriseServer_system_log};

private _message = format ["В магазине ID %1 куплен %2 в кол-ве %3 по %4 за штуку",_shopId,_itemClass,_itemCount,_itemPrice];

if (_delete) then {
	private _query = format["ltdBuyAllItemInShop:%1:%2:%3:%4:%5:%6:%7:%8",_itemClass,_shopId,(_itemCount*_itemPrice),_ltdId,_unitID,_unitName,"ShopBuy",_message];
	[_query,1] call SunriseServer_database_asyncCall;	
} else {
	private _query = format["ltdBuyItemsInShop:%1:%2:%3:%4:%5:%6:%7:%8:%9",_itemCount,_itemClass,_shopId,(_itemCount*_itemPrice),_ltdId ,_unitID,_unitName,"ShopBuy",_message];
	[_query,1] call SunriseServer_database_asyncCall;
};

sleep 3;

[_itemClass,_itemCount,_itemPrice] remoteExecCall ["SunriseClient_ltd_shopBuyDone",_unit];