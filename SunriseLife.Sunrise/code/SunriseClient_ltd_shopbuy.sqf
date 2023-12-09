/*

	Filename: 	SunriseClient_ltd_shopbuy.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\script_macros.hpp"

if (life_action_inUse) exitWith {};
if (EQUAL((lbCurSel 7402),-1)) exitWith {};

private _count = ctrlText 7403;
if !([_count] call SunriseClient_system_isnumber) exitWith {titleText ["Укажите количество в цифровом формате, а не символьном","PLAIN"]};

_count = parseNumber(_count);
if (_count <= 0) exitWith {};

call SunriseClient_actions_inUse;

private _itemData = call compile format["%1",CONTROL_DATA(7402)];

if !(_itemData isEqualType []) exitWith {
	format["ltdShopBuy - Bad _itemData: %1",_itemData] call SunriseClient_system_log;
	life_action_inUse = false;
};

_itemData params ["_itemClass","_itemCount","_itemPrice"];

private _isVirtItem = isClass (missionConfigFile >> "LifeCfgVirtualItems" >> _itemClass);
private _itemName = if (_isVirtItem) then {
	ITEM_NAME(_itemClass);
} else {
	([_itemClass] call SunriseClient_system_itemDetails) select 1;
};

private _newCount = _itemCount - _count;

if (_newCount < 0) exitWith {
	hint format["В магазине нет такого количества ""%1""",_itemName];
	life_action_inUse = false;
};

if (CASH < (_itemPrice * _count)) exitWith {
	hint format["Для покупки вам надо $%1 наличности",[(_itemPrice * _count)] call SunriseClient_system_numberText];
	life_action_inUse = false;
};

private _action = [
	format["Вы уверены, что хотите купить %1 x %2 за $%3?",_count,_itemName,[(_itemPrice * _count)] call SunriseClient_system_numberText],
	"Подтверждение",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (isNil "_action") exitWith {life_action_inUse = false};

if (_action) then {
	private _shopId = life_shop_npc GVAR ["shopId",-1];
	if (EQUAL(_shopId,-1)) exitWith {hint "Проблемы с ID магазина"; life_action_inUse = false};

	private _ltdId = life_shop_npc GVAR ["ltdId",-1];
	if (EQUAL(_ltdId,-1)) exitWith {hint "Проблемы с ID ООО"; life_action_inUse = false};

	private _shopItems = life_shop_npc GVAR ["shopItems",[]];
	if (EQUAL(_shopItems,[])) exitWith {hint "Проблемы со списком вещей"; life_action_inUse = false};

	private _index = [_itemClass,_shopItems] call SunriseClient_system_index;
	if (EQUAL(_index,-1)) exitWith {hint "Проблемы с ID товара"; life_action_inUse = false};

	private _error = false;
	private _diff = 0;
	if (_isVirtItem) then {
		_diff = [_itemClass,_count,life_carryWeight,life_maxWeight] call SunriseClient_system_calWeightDiff;
		if !(EQUAL(_count,_diff)) then {_error = true};
	};
	if (_error) exitWith {hint format["Ваш инвентарь заполнен. Есть место только для %1 из %2",_diff,_count]; life_action_inUse = false};

	hint "Собираем для вас покупку.... Ждите...";

	//вычитаем из массива
	private _newShopItems = +_shopItems;
	private _delete = true;
	if (_newCount isEqualTo 0) then {
		_newShopItems deleteAt _index;		
	} else {
		_newShopItems set [_index, [_itemClass,_newCount,_itemPrice]];
		_delete = false;
	};
	
	[life_shop_npc,"shopItems",_newShopItems] call CBA_fnc_setVarNet;

	[player,life_shop_npc,_shopId,_ltdId,_itemClass,_count,_itemPrice,_delete] remoteExec ["SunriseServer_ltd_updateItemShopDatabase",RSERV];

} else {
	life_action_inUse = false;	
};