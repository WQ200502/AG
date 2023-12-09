/*
	
	Filename: 	SunriseClient_system_buyClothes.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _display = GVAR_UINS ["SunriseDialogClothingShop",displayNull];
if (isNull _display) exitWith {"SunriseDialogClothingShop isNull" call SunriseClient_system_log};
if ((time - life_action_delay) < 5) exitWith {hint localize "STR_NOTF_ActionDelay"};
life_action_delay = time;
if (VAR(ClothingTotal) > CASH) exitWith {titleText[localize "STR_Shop_NotEnoughClothes","PLAIN"]};
private _totalPrice = 0;
{
    _x params ["_className","_count","_price"]; 
	_priceOneSelect = _price / _count;
	for "_i" from 1 to _count do {
		if ([_className] call SunriseClient_system_addItem) then {
			_totalPrice = _totalPrice + _priceOneSelect;
		};
	};
} forEach VAR(ClothingCat);

if (_totalPrice > 0) then {
	["cash","take",_totalPrice] call SunriseClient_system_myCash;
	player say3D "caching";
	[format["Вы купили снаряжения на $%1",[_totalPrice] call SunriseClient_system_numberText],"done"] call SunriseClient_system_hint;
} else {["Не удалось купить снаряжения","error"] call SunriseClient_system_hint};
[] call SunriseClient_system_saveGear;
closeDialog 0;