/*

	Filename: 	SunriseClient_ltd_shopupdate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\script_macros.hpp"
params [
	["_displayID",-1,[0]],
	["_listId",-1,[0]],
	["_plistId",-1,[0]]
];
disableSerialization;

if (isNull (findDisplay _displayID)) exitWith {};

if !(_listId isEqualTo -1) then {
	private _shopItems = CONTROL(_displayID,_listId);
	lbClear _shopItems;
	
	private _items = life_shop_npc GVAR ["shopItems",[]];
	
	if !(EQUAL(_items,[])) then {
		private ["_tmp","_itemIcon","_itemName"];
		{		
			if (isClass (missionConfigFile >> "LifeCfgVirtualItems" >> (_x select 0))) then {
				_itemIcon = ITEM_ICON(_x select 0);
				_itemName = ITEM_NAME(_x select 0);
			} else {
				_tmp = [_x select 0] call SunriseClient_system_itemDetails;
				_itemIcon = _tmp select 2;
				_itemName = _tmp select 1;
			};
	
			_shopItems lbAdd format["%1 [%2]",_itemName,_x select 1];
			_shopItems lbSetTextRight [(lbSize _shopItems)-1, format["  $%1", [_x select 2] call SunriseClient_system_numberText]];					
			_shopItems lbSetData [(lbSize _shopItems)-1,str(_x)];
			_shopItems lbSetPicture [(lbSize _shopItems)-1,_itemIcon];
		} foreach _items;
	};
	
	lbSort [_shopItems, "ASC"];
	
	if (EQUAL((lbSize _shopItems),0)) then {
		_shopItems lbAdd "Нет товаров";
	};
};

if !(_plistId isEqualTo -1) then {
	private _invItems = CONTROL(_displayID,_plistId);
	lbClear _invItems;
	[_invItems] call SunriseClient_ltd_listSellingItems;
};