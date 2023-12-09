/*
	
	Filename: 	SunriseClient_system_houseModAddSlot.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _house = param [0,Objnull,[Objnull]];
if (isNull _house) exitWith {};

private _house_box = _house GVAR ["house_box",objNull];
if (isNull _house_box) exitWith {hint "Хранилище закрыто. Отоприте его перед добавлением слотов.";closeDialog 0};

private _house_box_slots = _house_box GVAR ["house_box_slots",0];
private _numberCrates = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"numberCrates");

private _price = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"price") * 0.1;
if (IS_VIP) then {_price = [_price] call SunriseClient_system_discount};

private _action = [
	parseText format ["Кол-во слотов в хранилище: %1 из %2<br/><br/>Вы уверены, что хотите добавить еще один слот? Это обойдется вам в $%3",_house_box_slots,_numberCrates,[_price] call SunriseClient_system_numberText],
	"Добавление слота",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	if (BANK < _price) exitWith {["У вас нет необходимой суммы на банковском счете","error"] call SunriseClient_gui_bottomNotification};
	["atm","take",_price] call SunriseClient_system_myCash;
	_house_box_slots = _house_box_slots + 1;
	_house_box SVAR ["house_box_slots",_house_box_slots,true];
	
	[[_house,_house_box_slots,player],"updateHouseSlots"] call SunriseClient_system_hcExec;

	closeDialog 0;
};