/*

	Filename: 	SunriseClient_martiallaw_addWarPointToServer.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
private _pointName = ctrlText (CONTROL(4400,4403));
private _pointX = ctrlText (CONTROL(4400,4404));
private _pointY = ctrlText (CONTROL(4400,4405));

if (EQUAL(_pointName,"")) exitWith {hint "Укажите название точки военного положения"};
if (EQUAL(_pointX,"")) exitWith {hint "Не указана Х-координата"};
if (EQUAL(_pointY,"")) exitWith {hint "Не указана Y-координата"};

if !([_pointX] call SunriseClient_system_isnumber) exitWith {hint localize "STR_Cop_TicketNum"};
if !([_pointY] call SunriseClient_system_isnumber) exitWith {hint localize "STR_Cop_TicketNum"};

_pointX = parseNumber _pointX;
_pointY = parseNumber _pointY;

[player,_pointName,_pointX,_pointY,GVAR_RNAME(player)] remoteExecCall ["SunriseServer_system_addWarPoint",RSERV];
hint "Отправка запроса на сервер...";
closeDialog 0;