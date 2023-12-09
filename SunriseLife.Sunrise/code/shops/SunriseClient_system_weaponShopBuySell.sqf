/*

	Filename: 	SunriseClient_system_weaponShopBuySell.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
if ((time - life_action_delay) < 5) exitWith {hint localize "STR_NOTF_ActionDelay";};
life_action_delay = time;

if (GVAR_UINS["Weapon_Shop_Filter",0] == 1) then {
    private _catSell = GVAR_UINS ["Weapon_Shop_CatSell",[]];
    private _totalSell = GVAR_UINS ["Weapon_Shop_TotalSell",0]; 
	private _totalPrice = 0;
	private _sellCount = 0;
	private _itemInvCount = 0;
	{
		_x params [
		    ["_className","",[""]], 
			["_count",0,[0]],
		    ["_price",0,[0]]
		];
		
		//Чекаем на всякий если у чувака всё таки вышло добавить больше предметов в корзину чем у него есть в инвентаре. Хотя один хуй всё по 0 в продаже
		_itemInvCount = [_className] call SunriseClient_system_itemCount;
		if (_count > _itemInvCount) then {_count = _itemInvCount};
		
		_priceOneSelect = _price / _count;
		
	    for "_i" from 1 to _count do {
		    if ([_className] call SunriseClient_system_removeItem) then {
				_totalPrice = _totalPrice + _priceOneSelect;
				_sellCount = _sellCount + 1;
		    };
	    };
    } forEach _catSell;

	if (_sellCount > 0) then {
		["cash","add",_totalPrice,"weaponShopBuySell"] call SunriseClient_system_myCash;
		player say3D "caching";
		[format["Вы продали снаряжения на $%1",[_totalPrice] call SunriseClient_system_numberText],"done"] call SunriseClient_system_hint;
	} else {["Не удалось продать снаряжения","error"] call SunriseClient_system_hint};
} else {
    private _totalPrice = GVAR_UINS ["Weapon_Shop_Total",0];
    if (_totalPrice > CASH) exitWith {titleText ["У вас нехватает наличных, для покупки.","PLAIN"]};
	private _totalPrice = 0;
	{
		_x params [
		    ["_className","",[""]], 
			["_count",0,[0]],
		    ["_price",0,[0]]
		];
	    
	    _priceOneSelect = _price / _count;
		
	    for "_i" from 1 to _count do {
		    if ([_className] call SunriseClient_system_addItem) then {
				_totalPrice = _totalPrice + _priceOneSelect;
		    };
	    };
    } forEach (GVAR_UINS["Weapon_Shop_Cat",[]]);
	
	if (_totalPrice > 0) then {
		["cash","take",_totalPrice,"weaponShopBuySell"] call SunriseClient_system_myCash;
		player say3D "caching";
		[format["Вы купили снаряжения на $%1",[_totalPrice] call SunriseClient_system_numberText],"done"] call SunriseClient_system_hint;
		[] call SunriseClient_fast_hudWeaponUpdate;
	} else {["Не удалось купить снаряжения","error"] call SunriseClient_system_hint};
};

closeDialog 38400;

true