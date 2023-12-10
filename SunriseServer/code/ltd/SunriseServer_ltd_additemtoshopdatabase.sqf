/*

	Filename: 	SunriseServer_ltd_additemtoshopdatabase.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\..\script_macros.hpp"
params [
	["_unit",objNull,[objNull]],
	["_shop",objNull,[objNull]],
	["_shopId",-1,[0]],
	["_itemClass","",[""]],
	["_priceForItem",-1,[0]],
	["_itemCount",-1,[0]]
];

if (isNull _unit) exitWith {"addItemToShopDatabaseDatabase - _unit isNull" call SunriseServer_system_log};
if (isNull _shop) exitWith {"addItemToShopDatabase - _shop isNull" call SunriseServer_system_log};

private _unitID = getPlayerUID _unit;
private _unitName = GVAR_RNAME(_unit);

private _ret = owner _unit;
if !(EQUAL(EOWNER,_ret)) exitWith {"addItemToShopDatabase - bad owner" call SunriseServer_system_log};

if (EQUAL(_shopId,-1)) exitWith {"addItemToShopDatabase - bad _shopId" call SunriseServer_system_log};
if (EQUAL(_priceForItem,-1)) exitWith {"addItemToShopDatabase - bad _priceForItem" call SunriseServer_system_log};
if (EQUAL(_itemCount,-1)) exitWith {"addItemToShopDatabase - bad _itemCount" call SunriseServer_system_log};
if (EQUAL(_itemClass,"")) exitWith {"addItemToShopDatabase - bad _itemClass" call SunriseServer_system_log};

private _shopItems = _shop GVAR ["shopItems",[]];

private _message = format ["В магазин ID %1 добавлено %2 в кол-ве %3 по %4 за штуку",_shopId,_itemClass,_itemCount,_priceForItem];
private _query = "";

private _index = [_itemClass,_shopItems] call SunriseClient_system_index;
if (EQUAL(_index,-1)) then {
	_query = format["ltdAddNewItemToShop:%1:%2:%3:%4:%5:%6:%7:%8",_shopId,_itemClass,_itemCount,_priceForItem,_unitID,_unitName,"ShopAdd",_message];
} else {
	_query = format["ltdEditItemInShop:%1:%2:%3:%4:%5:%6:%7",_itemCount,_itemClass,_shopId,_unitID,_unitName,"ShopAdd",_message];
};

[_query,1] call SunriseServer_database_asyncCall;

sleep 2;

if (isNull _unit) exitWith {
	_query = format["ltdAddItemToShopDC:%1:%2:%3:%4",_unitID,_unitName,"Disconnect","Отключился в процессе добавления!"];
	[_query,1] call SunriseServer_database_asyncCall;
};

[_shop] spawn SunriseServer_ltd_addItemsToShop;

sleep 3;

[_itemClass] remoteExecCall ["SunriseClient_ltd_shopSubmitDone",_ret];