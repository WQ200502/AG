/*
	
	Filename: 	SunriseClient_system_weaponRemoveToCart.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team

*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _display = GVAR_UINS ["SunriseDialogWeaponShop",displayNull];
if (isNull _display) exitWith {"SunriseDialogWeaponShop isNull" call SunriseClient_system_log};

_index = (lbCurSel 38412);
if (_index isEqualTo -1) exitWith {};
if !([ctrlText 38414] call SunriseClient_system_isnumber) exitWith {titleText ["Укажите количество в цифровом формате, а не символьном","PLAIN"]};

private _filter = GVAR_UINS["Weapon_Shop_Filter",0];
private _cat = GVAR_UINS ["Weapon_Shop_Cat",[]];
private _catSell = GVAR_UINS ["Weapon_Shop_CatSell",[]];
if ((_filter isEqualTo 0 && _cat isEqualTo []) OR (_filter isEqualTo 1 && _catSell isEqualTo [])) exitWith {};

private _itemCount = parseNumber(ctrlText 38414);
if (_itemCount <= 0) exitWith {};
if !(_this isEqualTo []) then {_itemCount = 1};
//Установка перемен бла бла бла
private _itemClass = CONTROL_DATA(38412);
private _itemPrice = CONTROL_VALUE(38412);
//бла бла
private _BasketTitle = CONTROL(38400,38411);
private _BasketTotal = CONTROL(38400,602);
private _BasketList = CONTROL(38400,38412);
private _BasketButtonBuy = CONTROL(38400,38413);
private _BasketCount = CONTROL(38400,38414);
private _BasketButtonDelete = CONTROL(38400,38415);
private _BasketBG = CONTROL(38400,38426);
//бла
private _totalPrice = GVAR_UINS ["Weapon_Shop_Total",0];
private _totalSell = GVAR_UINS ["Weapon_Shop_TotalSell",0]; 

//Если выстовлен фильтор магазин
if (EQUAL(_filter,0)) then {
    private _catIndex = [_itemClass,_cat] call SunriseClient_system_index;
	//Хуяк и у нас уже есть даные о итем с моссива корзины
    (_cat param [_catIndex]) params [
	    ["_className","",[""]], 
	    ["_count",0,[0]],
	    ["_price",0,[0]],
	    ["_itemName","",[""]],
		["_isMag",false,[false]]
    ];
    if !(_className isEqualTo _itemClass) exitWith {"weaponRemoveToCart не совпал класснейм" call SunriseClient_system_log;};//Какого хуя итем не своподает арма ааа ? иди нахуй!
 
    if (_itemCount >= _count) then {
	    _count = 0;
	    //Минусуем цену общую суму снаряги в корзине
	    _totalPrice  = _totalPrice - _price;
    } else {
	    //Минусуем указоное колво и пересчитоваем цену за колво оставшихся итомов
	    _basePrise = (_price / _count); //Цена за 1 интем
	    _price = _basePrise * (_count - _itemCount); //Цена с учотом оставшихся итомов
	    _count = _count - _itemCount;//Колво оставшихся итомов
	    //Минусуем цену общую суму снаряги в корзине
	    _totalPrice  = _totalPrice - (_basePrise * _itemCount);
    };

    if (_count >= 1) then {
	    //Если в корзине еще осталось то правим отображаемые параметры
	    _basketList lbSetText [_index,format["[x%2]  %1",_itemName,_count]];
	    _basketList lbSetTextRight [_index, format["  %1$", [_price] call SunriseClient_system_numberText]];
	    _BasketList lbSetValue [_index, _price];
	    //Обновляем моссив корзины
	    _cat set [_catIndex,[_className,_count,_price,_itemName,_isMag]];
    } else {
	    //Если придмет 1 то удаляем его нахуй из корзины
	    _cat deleteAt _catIndex;//Удалям c мосса корзины
	    _BasketList lbDelete _index;//Удалям с дисплея
    };
	SVAR_UINS ["Weapon_Shop_Total",_totalPrice];
    SVAR_UINS ["Weapon_Shop_Cat",_cat];
} else {
	private _catIndex = [_itemClass,_catSell] call SunriseClient_system_index;
	//Хуяк и у нас уже есть даные о итеме с моссива корзины
    (_catSell param [_catIndex]) params [
	    ["_className","",[""]], 
	    ["_count",0,[0]],
	    ["_price",0,[0]],
	    ["_itemName","",[""]],
		["_isMag",false,[false]]
    ];
    if !(_className isEqualTo _itemClass) exitWith {};//Какого хуя итем не своподает арма ааа ? иди нахуй!

    if (_itemCount >= _count) then {
	    _count = 0;
	    //Пересчитоваем общую суму снаряги
	    _totalSell  = _totalSell - _price;
    } else {
	    //Минусуем указоное кличиство и пере песчитоваем цену за колво итомов
	    _basePrise = (_price / _count); //Цена за 1 интем
	    _price = _basePrise * (_count - _itemCount);
	    _count = _count - _itemCount;
	    //Минусуем цену с общую суму снаряги в корзине
	    _totalSell  = _totalSell - (_basePrise * _itemCount);
    };

    if (_count >= 1) then {
	    //Если в корзине еще осталось то правим отображаемые параметры
	    _basketList lbSetText [_index,format["[x%2]  %1",_itemName,_count]];
	    _basketList lbSetTextRight [_index, format["  %1$", [_price] call SunriseClient_system_numberText]];
	    _BasketList lbSetValue [_index, _price];
	    //Обновляем моссив корзины
	    _catSell set [_catIndex,[_className,_count,_price,_itemName,_isMag]];
    } else {
	    //Если придмет 1 то удаляем его нахуй из корзины
	    _catSell deleteAt _catIndex;//Удалям c профиля
	    _BasketList lbDelete _index;//Удалям с дисплея
    };
	SVAR_UINS ["Weapon_Shop_TotalSell",_totalPrice];
    SVAR_UINS ["Weapon_Shop_CatSell",_catSell];
};


if ((_filter isEqualTo 0 && _cat isEqualTo []) OR (_filter isEqualTo 1 && _catSell isEqualTo [])) then {
	//Если корзина пуста то закроем её
	_BasketTitle ctrlShow false;
	_BasketTotal ctrlShow false;
	_BasketList ctrlShow false;
	_BasketButtonBuy ctrlShow false;
	_BasketCount ctrlShow false;
	_BasketButtonDelete ctrlShow false;
	_BasketBG ctrlShow false;
};