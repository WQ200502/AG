/*

	Filename: 	SunriseServer_ltd_additemstoshop.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\..\script_macros.hpp"
private _shop = param [0,objNull,[objNull]];

private _shopId = _shop GVAR ["shopId",-1];
if (EQUAL(_shopId,-1)) exitWith {"addItemsToShop - _shopId is -1" call SunriseServer_system_log};

private _items = [format["ltdGetItemsFromShop:%1",_shopId],2,true] call SunriseServer_database_asyncCall;

_shop SVAR ["shopItems",_items,true];