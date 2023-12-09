/*

	Filename: 	SunriseClient_system_weaponAddCartMags.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team

*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 38403),-1)) exitWith {titleText [localize "STR_Shop_Weapon_NoSelect","PLAIN"]};
if !([ctrlText 38406] call SunriseClient_system_isnumber) exitWith {titleText ["Укажите количество в цифровом формате, а не символьном","PLAIN"]};

private _itemCount = parseNumber(ctrlText 38406);
if (_itemCount <= 0) exitWith {};
if (_itemCount > 25) exitWith {titleText ["Нельзя покупать больше 20 предметов сразу!","PLAIN"]};
private _data = CONTROL_DATA(38403);
_data = parseSimpleArray _data;
_data params ["_itemClass","_condition","_conditionsMsg"];
if !([_condition] call SunriseClient_system_conditionsCheck) exitWith {titleText [format["Этот предмет достуен %1",_conditionsMsg],"PLAIN"]};

private _BasketTitle = CONTROL(38400,38411);
private _BasketTotal = CONTROL(38400,602);
private _BasketList = CONTROL(38400,38412);
private _BasketButtonBuy = CONTROL(38400,38413);
private _BasketCount = CONTROL(38400,38414);
private _BasketButtonDelete = CONTROL(38400,38415);
private _BasketBG = CONTROL(38400,38426);
private _itemName = ([_itemClass] call SunriseClient_system_itemDetails) select 1;
private _totalPrice = GVAR_UINS ["Weapon_Shop_Total",0];
private _totalSell = GVAR_UINS ["Weapon_Shop_TotalSell",0];  
private _catSell = GVAR_UINS ["Weapon_Shop_CatSell",[]];
private _cat = GVAR_UINS ["Weapon_Shop_Cat",[]];
private _Filter = GVAR_UINS["Weapon_Shop_Filter",0];
if (EQUAL(_Filter,1)) then {
    private _itemInvCount = [_itemClass] call SunriseClient_system_itemCount;
    private _needIndex = [_itemClass,_catSell] call SunriseClient_system_index;
	private _price = 0;
    if (EQUAL(_needIndex,-1)) then {
	    if (_itemCount > _itemInvCount) then {_itemCount = _itemInvCount; titleText ["Нельзя добавить в корзину больше предметов чем у тебя есть!","PLAIN"];};
	    _catSell pushBack [_itemClass,_itemCount,(_price * _itemCount),_itemName,false];
	} else {
	    private _count = ((_catSell select _needIndex) select 1);
		_itemCount = (_itemCount + _count);
		if (_itemCount > _itemInvCount) then {_itemCount = _itemInvCount; titleText ["Нельзя добавить в корзину больше предметов чем у тебя есть!","PLAIN"];};
		_catSell set [_needIndex,[_itemClass,_itemCount,(_price * _itemCount),_itemName,false]];
    };
	private _totalSell = 0;
	lbClear _basketList;
	{
	    _x params ["_className","_count","_price","_itemName"];
	    _itemInfo = [_className] call SunriseClient_system_itemDetails;
	    private _index = _basketList lbAdd format["[x%1] - %2",_count,_itemName];
	    _basketList lbSetData [_index,_className];
	    _basketList lbSetTextRight [_index, format["  %1$", [_price] call SunriseClient_system_numberText]];
	    _BasketList lbSetValue [_index, _price];
	    _basketList lbSetPicture [_index,_itemInfo select 2];
	
	    _totalSell = _totalSell + _price;
    } forEach _catSell;
    
    SVAR_UINS ["Weapon_Shop_TotalSell",_totalSell];
    SVAR_UINS ["Weapon_Shop_CatSell",_catSell];
} else {
    //if !(player canAdd [_itemClass,_itemCount]) exitWith {titleText [localize "STR_NOTF_NoRoom","PLAIN"]};
    private _priceMulti = CONTROL_VALUE(38403);
    private _price = round (M_CONFIG(getNumber,"LifeCfgItems",_itemClass,"price") / _priceMulti);
    if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call SunriseClient_system_discount};
    if ((_price * _itemCount) > CASH) exitWith {titleText [localize "STR_NOTF_NotEnoughMoney","PLAIN"]};
    private _needIndex = [_itemClass,_cat] call SunriseClient_system_index;
    if (EQUAL(_needIndex,-1)) then {
	    _cat pushBack [_itemClass,_itemCount,(_price * _itemCount),_itemName,false];
	} else {
	    private _count = ((_cat select _needIndex) select 1);
	    private _isMag = ((_cat select _needIndex) select 4);
	    _cat set [_needIndex,[_itemClass,(_itemCount + _count),(_price * (_itemCount + _count)),_itemName,false]];
    };
	private _totalPrice = 0;
	lbClear _basketList;
	{
	    _x params ["_className","_count","_price","_itemName"];
	    _itemInfo = [_className] call SunriseClient_system_itemDetails;
	    private _index = _basketList lbAdd format["[x%1] - %2",_count,_itemName];
	    _basketList lbSetData [_index,_className];
	    _basketList lbSetTextRight [_index, format["  %1$", [_price] call SunriseClient_system_numberText]];
	    _BasketList lbSetValue [_index, _price];
	    _basketList lbSetPicture [_index,_itemInfo select 2];

	    _totalPrice = _totalPrice + _price;
    } forEach _cat;

    SVAR_UINS["Weapon_Shop_Total",_totalPrice];
    SVAR_UINS["Weapon_Shop_Cat",_cat];
};

if ((_filter isEqualTo 0 && !(_cat isEqualTo [])) OR (_filter isEqualTo 1 && !(_catSell isEqualTo [])) && !(ctrlShown _BasketTitle)) then {
    _BasketTitle ctrlShow true;
	_BasketTotal ctrlShow true;
    _BasketList ctrlShow true;
    _BasketButtonBuy ctrlShow true;
    _BasketCount ctrlShow true;
    _BasketButtonDelete ctrlShow true;
    _BasketBG ctrlShow true;
	FADEANIM(_BasketTitle,0.3)
	FADEANIM(_BasketTotal,0.3)
	FADEANIM(_BasketList,0.3)
	FADEANIM(_BasketButtonBuy,0.3)
	FADEANIM(_BasketCount,0.3)
	FADEANIM(_BasketButtonDelete,0.3)
	FADEANIM(_BasketBG,0.3)
};

true