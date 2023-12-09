/*

	Filename: 	SunriseClient_dhl_mailBoxGive.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
player playAction "PutDown";
[player] call SunriseClient_dhl_boxSpawn;
["Загрузите коробку в грузовик и отправляйтесь к месту доставки","info"] call SunriseClient_gui_bottomNotification;

life_dhl_job setTaskState "SUCCEEDED"; 
player removeSimpleTask life_dhl_job;

"DHL - Step 1 completed" call SunriseClient_system_log;

"DHL - Step 2 begin" call SunriseClient_system_log;

private _dpEnd = [format["%1",life_dhl_finishPoint],"_"," "] call SunriseClient_kron_Replace;

life_dhl_job = player createSimpleTask [format["JOB_DHL_%1",getPlayerUID player]];

life_dhl_job setSimpleTaskDestination getpos life_dhl_finishPoint;
life_dhl_job setSimpleTaskDescription [format["Доставьте посылку в %1",toUpper(_dpEnd)],format["Доставьте посылку в %1",toUpper(_dpEnd)],""];
life_dhl_job setTaskState "CREATED";
life_dhl_job setSimpleTaskType "MAP";
player setCurrentTask life_dhl_job;

life_dhl_startPoint removeAction AID_TFMB;