/*

	Filename: 	SunriseClient_system_resCaptureManage.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _ownerID = grpPlayer GVAR["gang_owner",""];
private _gangDeputy = grpPlayer GVAR ["gang_deputy","-1"];
if !((EQUAL(_gangDeputy,steamid)) OR (EQUAL(_ownerID,steamid))) exitWith {};
disableSerialization;

private _data = CONTROL_DATA(4501);
_data = call compile format["%1", _data];
if (isNil "_data") exitWith {};
if (typeName _data != "ARRAY") exitWith {};
if (EQUAL(_data,[])) exitWith {};
if (grpPlayer GVAR ["gang_id",-1] in (_data select 8)) then {
	_action = [
		"Вы собираетесь отказаться от участия в битве! Уплаченный взнос нельзя вернуть. Уверены?",
		"Битва за переработку!",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call BIS_fnc_guiMessage;
	
	if (_action) then {
		[[false,_data select 0,grpPlayer,player],"manageApplicants","SYS",false] call SunriseClient_system_hcExec;
	};
} else {
	_price = round((_data select 3) * 0.5);
	if (BANK < _price) exitWith {["У вас нет необходимой суммы на банковском счете","error"] call SunriseClient_gui_bottomNotification};
	
	_action = [
		format["Вы собираетесь записаться на битву! Это будет стоить $%1. Взнос нельзя будет вернуть!",_price],
		"Битва на переработку!",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call BIS_fnc_guiMessage;
	
	if (_action) then {
		["atm","take",_price] call SunriseClient_system_myCash;
		[[true,_data select 0,grpPlayer,player],"manageApplicants","SYS",false] call SunriseClient_system_hcExec;
	};
};