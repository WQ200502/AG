/*

	Filename: 	SunriseServer_ltd_updateitemprice.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\..\script_macros.hpp"

params [
	["_unit",objNull,[objNull]],
	["_shop",objNull,[objNull]],	
	["_shopId",-1,[0]],	
	["_itemClass","",[""]],
	["_itemPrice",-1,[0]]
];

if (isNull _unit) exitWith {"_unit isNull" call SunriseServer_system_log};
if (isNull _shop) exitWith {"_shop isNull" call SunriseServer_system_log};

private _unitID = getPlayerUID _unit;
private _unitName = GVAR_RNAME(_unit);

_unit = owner _unit;
if !(EQUAL(EOWNER,_unit)) exitWith {"updateItemPrice - bad owner" call SunriseServer_system_log};

if (EQUAL(_itemPrice,-1)) exitWith {"updateItemPrice bad _itemPrice" call SunriseServer_system_log};
if (EQUAL(_itemClass,"")) exitWith {"updateItemPrice bad _itemClass" call SunriseServer_system_log};

private _message = format ["В магазине ID %1 у товара %2 изменена цена на $%3",_shopId,_itemClass,_itemPrice];

private _query = format["ltdEditItemPriceInShop:%1:%2:%3:%4:%5:%6:%7",_itemPrice,_itemClass,_shopId,_unitID,_unitName,"ShopItemPrice",_message];
[_query,1] call SunriseServer_database_asyncCall;

sleep 3;

[_itemClass,_itemPrice] remoteExecCall ["SunriseClient_ltd_shopEditPriceDone",_unit];