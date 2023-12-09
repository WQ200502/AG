/*
	
	Filename: 	SunriseClient_system_housePayRent.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _house = param [0,Objnull,[Objnull]];
if (isNull _house) exitWith {};

private _price = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"price");
_numberCrates = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"numberCrates");
_valToPay = if !(_numberCrates isEqualTo 0) then {if (_house getVariable ["house_securityTxt",false]) then {round(_price * 0.4)} else {round(_price * 0.35)}} else {round(_price * 0.3)};
private _action = [
	parseText format ["Вы можете проплатить услуги ЖКХ дома заранее. Оплату можно производить за 7 дней до конца оплаченного периода. Цена за месяц - $%1<br/><br/>Вы уверены, что хотите оплатить услуги ЖКХ? Это обойдется вам в $%2",[_valToPay] call SunriseClient_system_numberText,[_valToPay] call SunriseClient_system_numberText],
	"Покупка сигнализации",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	if (BANK < _valToPay) exitWith {["У вас нет необходимой суммы на банковском счете","error"] call SunriseClient_gui_bottomNotification};
	["atm","take",_valToPay] call SunriseClient_system_myCash;
	[[_house,player,_valToPay],"updateHouseRent"] call SunriseClient_system_hcExec;
};