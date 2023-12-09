/*
	
	Filename: 	SunriseClient_system_vehTransferGet.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 5102),-1)) exitWith {hint localize "STR_Global_NoSelection"};
private _vid = CONTROL_VALUE(5102);
private _retrievePrice = (call compile format["%1",CONTROL_DATA(5102)]) select 5;
if (BANK < _retrievePrice) exitWith {hint "Недостаточно денег на банковском счете"};

closeDialog 0;

["atm","take",_retrievePrice] call SunriseClient_system_myCash;
hint "Отправка запроса на перевозку техники...";
[_vid,steamid,player] remoteExecCall ["SunriseServer_system_changeVehicleServerMap",RSERV];