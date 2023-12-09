/*
	
	Filename: 	SunriseClient_parking_Pay.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 5702),-1)) exitWith {[localize "STR_Global_NoSelection","error"] call SunriseClient_gui_bottomNotification};
private _vid = CONTROL_VALUE(5702);

private _dataArr = call compile format["%1",CONTROL_DATA(5702)];
_dataArr params ["_plate","_parking"];

if (EQUAL(_plate,"")) exitWith {["Номер не указан","error"] call SunriseClient_gui_bottomNotification};
if (EQUAL(_parking,[])) exitWith {["Информация о штрафе не указана","error"] call SunriseClient_gui_bottomNotification};

private _price = _parking select 0;
if (BANK < _price) exitWith {["Недостаточно денег на банковском счете","error"] call SunriseClient_gui_bottomNotification};

closeDialog 0;

["atm","take",_price,"vehicleParkingPay"] call SunriseClient_system_myCash;

[localize "STR_NOTF_SendingData","info"] call SunriseClient_gui_bottomNotification;
[_vid,player] remoteExecCall ["SunriseServer_system_vehicleParkingPay",RSERV];