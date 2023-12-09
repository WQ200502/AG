/*
	
	Filename: 	SunriseClient_system_yItemRemove.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _data = CONTROL_DATA(7212);
private _value = ctrlText 7213;

if !(NOTINVEH(player)) exitWith {titleText["Вы не можете выбросить предмет в машине.","PLAIN"]};

if (EQUAL(_data,"")) exitWith {hint "Вы не выбрали предмет чтобы его выбросить.";};
if !([_value] call SunriseClient_system_isnumber) exitWith {hint "Введите число."};
if (parseNumber(_value) <= 0) exitWith {hint "Введите цифру больше нуля."};

/*private _ind = [_data,life_illegal_items] call SunriseClient_system_index;

private _check = false;
{
	if (player distance _x < 100 && (_x getVariable ["copDuty",false])) exitWith {
		_check = true;
	};
} forEach playableUnits;

if (!(EQUAL(_ind,-1)) && _check) exitWith {
	titleText["Это нелегальный предмет. Вы не можете его выбросить из-за того, что рядом копы","PLAIN"];
};*/

if !([false,_data,(parseNumber _value)] call SunriseClient_system_handleInv) exitWith {hint "У вас нет столько вещей."};
hint format["Вы выкинули %1 %2 из своего инвентаря.",(parseNumber _value), ITEM_NAME(_data)];
	
[] call SunriseClient_inventory_update;