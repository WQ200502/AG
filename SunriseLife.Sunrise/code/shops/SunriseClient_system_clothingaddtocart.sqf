/*

	Filename: 	SunriseClient_system_clothingAddToCart.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team
	E-mail:		Sunrise Team

*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 3101),-1)) exitWith {titleText [localize "STR_Shop_Weapon_NoSelect","PLAIN"]};
if !([ctrlText 3104] call SunriseClient_system_isnumber) exitWith {titleText ["Укажите количество в цифровом формате, а не символьном","PLAIN"]};
private _error = false;
private _data = CONTROL_DATA(3101);
_data = parseSimpleArray _data;
_data params ["_class","_condition","_display"];
if !([_condition select 1] call SunriseClient_system_conditionsCheck) exitWith {titleText [format["Этот вещь доступна %1",_condition select 0],"PLAIN"]};

private _BasketTitle = CONTROL(3100,3107);
private _BasketTotal = CONTROL(3100,602);
private _BasketList = CONTROL(3100,3108);
private _BasketButtonBuy = CONTROL(3100,3109);
private _BasketCount = CONTROL(3100,3110);
private _BasketButtonDelete = CONTROL(3100,3111);
private _BasketBG = CONTROL(3100,3123);

private _price = CONTROL_VALUE(3101);
if (_price > CASH) exitWith {titleText [localize "STR_NOTF_NotEnoughMoney","PLAIN"]};

_itemType = [_class] call BIS_fnc_itemType;
if ((_itemType select 1) isEqualTo "Backpack") then {
	if (VAR(ClothingBackPackCount)) exitWith {
	    titleText["Нельзя покупать более 1 рюкзака за раз!","PLAIN"];
	    _error = true;
	};
	VAR(ClothingBackPackCount) = true;
};

if (_error) exitWith {};

private _cat = VAR(ClothingCat);
private _needIndex = [_class,_cat] call SunriseClient_system_index;
private _info = [_class] call SunriseClient_system_itemDetails;
//Если в еще не доб. итем то доб. корзине уже доб. этот итем то 
if (EQUAL(_needIndex,-1)) then {
	_cat pushBack [_class,1,_price,_info select 1];
} else {
    //Если уже доб. то пересчитываем колво и общую цену за стака итема
	private _count = ((_cat select _needIndex) select 1);//Колво итема
	if (_count >= 10) exitWith {
	   titleText["Нельзя покупать более 10 вещей одного типа за раз!","PLAIN"];
	   _error = true;
    };
	//Перезаписоваем данные в масиве корзины
	_cat set [_needIndex,[_class,(_count + 1),_price * (_count + 1),_info select 1]];
};

if (_error) exitWith {};

//Перезаписоваем на дисплее отоброжаемые данные
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

VAR(ClothingTotal) = _totalPrice;
VAR(ClothingCat) = _cat;

if (!(_cat isEqualTo []) && !(ctrlshown _BasketBG)) then {
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