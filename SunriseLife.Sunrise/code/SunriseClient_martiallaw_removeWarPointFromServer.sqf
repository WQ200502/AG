/*
	
	Filename: 	SunriseClient_martiallaw_removeWarPointFromServer.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 4502),-1)) exitWith {hint "Не выбрана точка для удаления"};
private _pointName = CONTROL_DATA(4502);
private _pointID = CONTROL_VALUE(4502);

[player,_pointName,_pointID,GVAR_RNAME(player)] remoteExecCall ["SunriseServer_system_removeWarPoint",RSERV];
hint "Отправка запроса на сервер...";
closeDialog 0;