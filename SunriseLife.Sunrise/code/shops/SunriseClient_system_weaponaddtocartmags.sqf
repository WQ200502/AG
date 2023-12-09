/*

	Filename: 	SunriseClient_system_weaponAddCartMags.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team

*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 38407),-1)) exitWith {titleText [localize "STR_Shop_Weapon_NoSelect","PLAIN"]};
if !([ctrlText 38408] call SunriseClient_system_isnumber) exitWith {titleText ["Укажите количество в цифровом формате, а не символьном","PLAIN"]};
private _itemCount = parseNumber(ctrlText 38408);
if (_itemCount <= 0) exitWith {};
if (_itemCount > 25) exitWith {titleText ["Нельзя покупать больше 25 предметов сразу!","PLAIN"]};
private _itemMags = CONTROL_DATA(38407);
if !(player canAdd [_itemMags,_itemCount]) exitWith {titleText [localize "STR_NOTF_NoRoom","PLAIN"]};
private _priceMulti = CONTROL_VALUE(38407);
private _price = round (M_CONFIG(getNumber,"LifeCfgItems",_itemMags,"price") / _priceMulti);
if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call SunriseClient_system_discount};
if ((_price * _itemCount) > CASH) exitWith {titleText [localize "STR_NOTF_NotEnoughMoney","PLAIN"]};
private _data = (parseSimpleArray (CONTROL_DATA(38403)));
_data params ["","_condition","_conditionsMsg"];
if !([_condition] call SunriseClient_system_conditionsCheck) exitWith {titleText [format["Этот предмет достуен %1",_conditionsMsg],"PLAIN"]};

//Перемены дисплея корзина
private _BasketTitle = CONTROL(38400,38411);
private _BasketTotal = CONTROL(38400,602);
private _BasketList = CONTROL(38400,38412);
private _BasketButtonBuy = CONTROL(38400,38413);
private _BasketCount = CONTROL(38400,38414);
private _BasketButtonDelete = CONTROL(38400,38415);
private _BasketBG = CONTROL(38400,38426);

private _cat = GVAR_UINS ["Weapon_Shop_Cat",[]];
private _totalPrice = GVAR_UINS ["Weapon_Shop_Total",_totalPrice];
private _needIndex = [_itemMags,_cat] call SunriseClient_system_index;
private _magInfo = [_itemMags] call SunriseClient_system_itemDetails;
//Если в еще не доб. итем то доб. корзине уже доб. этот итем то 
if (EQUAL(_needIndex,-1)) then {
	_cat pushBack [_itemMags,_itemCount,(_price * _itemCount),_magInfo select 1,true];
} else {
    //Если уже доб. то пересчитываем колво и общую цену за стака итема
	private _count = ((_cat select _needIndex) select 1);//Колво итема
	_cat set [_needIndex,[_itemMags,(_count + _itemCount),_price * (_itemCount + _count),_magInfo select 1,true]];//Перезаписоваем данные в масиве корзины
};
//Перезаписоваем на дисплее отоброжаемые данные
private _totalPrice = 0;
lbClear _basketList;
{
	_x params ["_className","_itemCount","_price","_itemName"];
	_itemInfo = [_className] call SunriseClient_system_itemDetails;
	private _index = _basketList lbAdd format["[x%1] - %2",_itemCount,_itemName];
	_basketList lbSetData [_index,_className];
	_basketList lbSetTextRight [_index, format["  %1$", [_price] call SunriseClient_system_numberText]];
	_BasketList lbSetValue [_index, _price];
	_basketList lbSetPicture [_index,_itemInfo select 2];
	_totalPrice = _totalPrice + _price;//пересчитываем общей суме за всю снарягу
} forEach _cat;

SVAR_UINS ["Weapon_Shop_Total",_totalPrice];
SVAR_UINS ["Weapon_Shop_Cat",_cat];

//Если отоброжаемые корзины вык. то вкл.
if !(ctrlshown _BasketBG) then {
	_BasketTitle ctrlShow true;
	_BasketTotal ctrlShow true;
	_BasketList ctrlShow true;
	_BasketButtonBuy ctrlShow true;
	_BasketCount ctrlShow true;
	_BasketButtonDelete ctrlShow true;
	_BasketBG ctrlShow true;
	//и аниируем
	FADEANIM(_BasketTitle,0.3)
	FADEANIM(_BasketTotal,0.3)
	FADEANIM(_BasketList,0.3)
	FADEANIM(_BasketButtonBuy,0.3)
	FADEANIM(_BasketCount,0.3)
	FADEANIM(_BasketButtonDelete,0.3)
	FADEANIM(_BasketBG,0.3)
};

true