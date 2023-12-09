/*
	
	Filename: 	SunriseClient_system_weaponRemoveToCart.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team

*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _display = GVAR_UINS ["SunriseDialogClothingShop",displayNull];
if (isNull _display) exitWith {"SunriseDialogClothingShop isNull" call SunriseClient_system_log};
_index = (lbCurSel 3108);
if (_index isEqualTo -1) exitWith {"-1" call SunriseClient_system_log};
//Установка перемен бла бла бла
private _BasketTitle = CONTROL(3100,3107);
private _BasketTotal = CONTROL(3100,602);
private _BasketList = CONTROL(3100,3108);
private _BasketButtonBuy = CONTROL(3100,3109);
private _BasketCount = CONTROL(3100,3110);
private _BasketButtonDelete = CONTROL(3100,3111);
private _BasketBG = CONTROL(3100,3123);
//бла
private _totalPrice = VAR(ClothingTotal);
private _cat = VAR(ClothingCat); 
private _class = CONTROL_DATA(3108);
private _catIndex = [_class,_cat] call SunriseClient_system_index;
//Хуяк и у нас уже есть даные о итем с моссива корзины
(_cat param [_catIndex]) params [
	["_className","",[""]], 
	["_count",0,[0]],
	["_price",0,[0]],
	["_itemName","",[""]]
];
if !(_className isEqualTo _class) exitWith {};//Какого хуя итем не своподает арма ааа ? иди нахуй!

_itemType = [_class] call BIS_fnc_itemType;
if ((_itemType select 1) isEqualTo "Backpack" && VAR(ClothingBackPackCount)) then {
	VAR(ClothingBackPackCount) = false;
};

if (_error) exitWith {};

if (_count >= 1) then {
	_count = 0;
	//Пересчитоваем общую суму снаряги
	_totalPrice  = _totalPrice - _price;
} else {
	//Минусуем указоное колво и пересчитоваем цену за колво оставшихся итомов
	_basePrise = (_price / _count); //Цена за 1 интем
	_price = _basePrise * (_count - 1); //Цена с учотом оставшихся итомов
	_count = _count - 1;//Колво оставшихся итомов
	//Минусуем цену общую суму снаряги в корзине
	_totalPrice  = _totalPrice - (_basePrise * 1);
};

if (_count >= 1) then {
	//Если в корзине еще осталось то правим отображаемые параметры
	_basketList lbSetText [_index,format["[x%2]  %1",_itemName,_count]];
	_basketList lbSetTextRight [_index, format["  %1$", [_price] call SunriseClient_system_numberText]];
	_BasketList lbSetValue [_index, _price];
	//Обновляем моссив корзины
	_cat set [_catIndex,[_className,_count,_price,_itemName]];
} else {
	//Если придмет 1 то удаляем его нахуй из корзины
	_cat deleteAt _catIndex;//Удалям c мосса корзины
	_BasketList lbDelete _index;//Удалям с дисплея
};

VAR(ClothingTotal) = _totalPrice;
VAR(ClothingCat) = _cat; 

if (_cat isEqualTo []) then {
	//Если корзина пуста то закроем её
	_BasketTitle ctrlShow false;
	_BasketTotal ctrlShow false;
	_BasketList ctrlShow false;
	_BasketButtonBuy ctrlShow false;
	_BasketCount ctrlShow false;
	_BasketButtonDelete ctrlShow false;
	_BasketBG ctrlShow false;
};