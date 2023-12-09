/*
	
	Filename: 	SunriseClient_system_houseBuySecurity.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _house = param [0,Objnull,[Objnull]];
if (isNull _house) exitWith {};

private _price = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"price");
private _valToPay = round(_price * 0.2);
private _action = [
	parseText format ["Если вы установите сигнализацию, вам будут приходить уведомления о взломе дома и время взлома увеличится на 50 процентов. Также увеличится размер оплаты ЖКХ до %2<br/><br/>Вы уверены, что хотите установить сигнализацию? Это обойдется вам в $%1",[_valToPay] call SunriseClient_system_numberText,[round(_price * 0.4)] call SunriseClient_system_numberText],
	"Покупка сигнализации",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	if (BANK < _valToPay) exitWith {["У вас нет необходимой суммы на банковском счете","error"] call SunriseClient_gui_bottomNotification};
	["atm","take",_valToPay] call SunriseClient_system_myCash;
	[[_house,player],"updateHouseSecurity"] call SunriseClient_system_hcExec;

	closeDialog 0;
};