/*

	Filename: 	SunriseClient_ltd_shopsubmit.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\script_macros.hpp"
if (life_action_inUse) exitWith {};
if (EQUAL((lbCurSel 7803),-1)) exitWith {};

private _maxRowsInShop = LIFE_SETTINGS(getNumber,"life_ltd_maxRowsInShop");

if (isNil {life_shop_npc GVAR "shopItems"}) exitWith {hint "Что-то не так со списком товаров..."};
private _shopItems = life_shop_npc GVAR ["shopItems",[]];
if (count _shopItems >= _maxRowsInShop) exitWith {hint format["Магазин уже забит. У вас %1 из %2 возможного кол-ва позиций",count _shopItems,_maxRowsInShop]};

call SunriseClient_actions_inUse;

private _itemClass = CONTROL_DATA(7803);

private _isVirtItem = isClass (missionConfigFile >> "LifeCfgVirtualItems" >> _itemClass);
private _isInvItem = isClass (missionConfigFile >> "LifeCfgItems" >> _itemClass);

if !(_isVirtItem OR _isInvItem) exitWith {
	hint "У предмета нет конфига";
	life_action_inUse = false;
};

if (_isVirtItem && {ITEM_CANSELL(_itemClass) isEqualTo 0}) exitWith {
	hint "Данный предмет нельзя выставить на продажу";
	life_action_inUse = false;
};

if (_isInvItem && {ITEM_INVCANSELL(_itemClass) isEqualTo 0}) exitWith {
	hint "Данный предмет нельзя выставить на продажу";
	life_action_inUse = false;
};

if ((time - life_vshop_timer) < 5) exitWith {hint "Вы слишком быстро нажимаете на кнопку Добавить! Рекомендуем указывать нужное кол-во при добавлении одинаковых предметов, вместо нажатия кнопки сто раз!"; life_action_inUse = false};
life_vshop_timer = time;

private _priceForItem = ctrlText 7805;
if !([_priceForItem] call SunriseClient_system_isnumber) exitWith {hint localize "STR_Shop_Virt_NoNum"; life_action_inUse = false};
_priceForItem = parseNumber (_priceForItem);

if (_priceForItem <= 0) exitWith {hint "Стоимость должна быть больше ноля"; life_action_inUse = false};
if (_priceForItem > 999999) exitWith {hint "Цена не можеть больше чем $999,999"};

private _itemCount = ctrlText 7804;
if !([_itemCount] call SunriseClient_system_isnumber) exitWith {hint localize "STR_Shop_Virt_NoNum"; life_action_inUse = false};
_itemCount = parseNumber (_itemCount);

if (_isVirtItem && {_itemCount > ITEM_VALUE(_itemClass)}) exitWith {hint localize "STR_Shop_Virt_NotEnough"; life_action_inUse = false};
if (_isInvItem && {_itemCount > [_itemClass] call SunriseClient_system_itemCount}) exitWith {hint localize "STR_Shop_Virt_NotEnough"; life_action_inUse = false};

private _itemName = if (_isVirtItem) then {
	ITEM_NAME(_itemClass);
} else {
	([_itemClass] call SunriseClient_system_itemDetails) select 1;
};

private _action = [
	format["Вы уверены, что хотите выставить на продажу %1 позиций ""%2"" и ценой $%3 за штуку?",_itemCount,_itemName,[_priceForItem] call SunriseClient_system_numberText],
	"Подтверждение",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	private _shopId = life_shop_npc GVAR ["shopId",-1];
	if (EQUAL(_shopId,-1)) exitWith {hint "Проблемы с ID магазина"; life_action_inUse = false};

	private _itemsRemoved = false;

	if (_isVirtItem) then {
		if ([false,_itemClass,_itemCount] call SunriseClient_system_handleInv) then {
			_itemsRemoved = true;
		} else {
			life_action_inUse = false;
			hint "Что-то пошло не так... Не удалось убрать предмет из инвентаря...";
			closeDialog 0;
		};	
	} else {
		private _itemCountOld = [_itemClass] call SunriseClient_system_itemCount;
		for "_x" from 1 to _itemCount do {
			[_itemClass] call SunriseClient_system_removeItem;
		};
		if ([_itemClass] call SunriseClient_system_itemCount == (_itemCountOld - _itemCount)) then {
			_itemsRemoved = true;
		} else {
			life_action_inUse = false;
			hint "Что-то пошло не так... Не удалось убрать предмет из инвентаря...";
			closeDialog 0;
		};
	};

	[] call SunriseClient_system_saveGear;

	if (_itemsRemoved) then {
		hint "Добавляем товар на полки.... Процесс займет 5-10 секунд...";
		[player,life_shop_npc,_shopId,_itemClass,_priceForItem,_itemCount] remoteExec ["SunriseServer_ltd_addItemToShopDatabase",RSERV];
	};
} else {
	life_action_inUse = false;	
};