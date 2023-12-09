/*

	Filename: 	SunriseClient_ltd_shopeditprice.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\script_macros.hpp"
if (life_action_inUse) exitWith {};
if (EQUAL((lbCurSel 7802),-1)) exitWith {};

private _newPrice = ctrlText 7807;
if !([_newPrice] call SunriseClient_system_isnumber) exitWith {titleText ["Укажите количество в цифровом формате, а не символьном","PLAIN"]};

_newPrice = parseNumber(_newPrice);
if (_newPrice <= 0) exitWith {hint "Цена должна быть больше ноля"};
if (_newPrice > 999999) exitWith {hint "Цена не можеть больше чем $999,999"};

call SunriseClient_actions_inUse;

private _itemData = call compile format["%1",CONTROL_DATA(7802)];

_itemData params ["_itemClass","_itemCount","_itemPrice"];

if (EQUAL(_itemPrice,_newPrice)) exitWith {hint "У этого товара уже такая цена. Укажите новую"; life_action_inUse = false};

private _shopId = life_shop_npc GVAR ["shopId",-1];
if (EQUAL(_shopId,-1)) exitWith {hint "Проблемы с ID магазина"; life_action_inUse = false};

private _shopItems = life_shop_npc GVAR ["shopItems",[]];
if (EQUAL(_shopItems,[])) exitWith {hint "Проблемы со списком вещей"; life_action_inUse = false};

private _index = [_itemClass,_shopItems] call SunriseClient_system_index;
if (EQUAL(_index,-1)) exitWith {hint "Проблемы с ID товара"; life_action_inUse = false};

private _isVirtItem = isClass (missionConfigFile >> "LifeCfgVirtualItems" >> _itemClass);
private _itemName = if (_isVirtItem) then {
	ITEM_NAME(_itemClass);
} else {
	([_itemClass] call SunriseClient_system_itemDetails) select 1;
};

private _action = [
	format["Вы уверены, что хотите поменять цену у %1? Новая цена будет равна $%2?",_itemName,[_newPrice] call SunriseClient_system_numberText],
	"Подтверждение",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (isNil "_action") exitWith {life_action_inUse = false};

if (_action) then {
	private _newShopItems = +_shopItems;
	_newShopItems set [_index, [_itemClass,_itemCount,_newPrice]];
	[life_shop_npc,"shopItems",_newShopItems] call CBA_fnc_setVarNet;
	
	hint "Меняем ценник на товаре...";
	
	[player,life_shop_npc,_shopId,_itemClass,_newPrice] remoteExec ["SunriseServer_ltd_updateItemPrice",RSERV];
} else {
	life_action_inUse = false;	
};