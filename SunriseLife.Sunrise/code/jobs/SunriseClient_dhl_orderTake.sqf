/*

	Filename: 	SunriseClient_dhl_orderTake.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_job_inProgress) exitWith {["Сначала закончите свою работу!", "error"] call SunriseClient_gui_bottomNotification};
private _startPoint = CONTROL_DATA(5802);
private _finishPoint = CONTROL_DATA(5803);

if (EQUAL(_startPoint,"") OR EQUAL(_finishPoint,"")) exitWith {};
if (EQUAL(_startPoint,_finishPoint)) exitWith {};
if (life_job_inProgress) exitWith {};

_startPoint = call compile format["%1",_startPoint];
_finishPoint = call compile format["%1",_finishPoint];
if (isNil "_startPoint" OR isNil "_finishPoint") exitWith {};

closeDialog 0;

life_dhl_startPoint = _startPoint;
life_dhl_finishPoint = _finishPoint;

format["DHL - Order Take from %1 to %2",_startPoint,_finishPoint] call SunriseClient_system_log;

AID_TFMB = life_dhl_startPoint addAction ["<img image='\sunrise_dhl\data\dhl_logo.paa' /> Получить посылку",SunriseClient_dhl_mailBoxGive,nil,0,true,true,"",' life_job_inProgress && isNull life_dhl_box ', 5];

private _dpStart = [format["%1",life_dhl_startPoint],"_"," "] call SunriseClient_kron_Replace;
private _dpEnd = [format["%1",life_dhl_finishPoint],"_"," "] call SunriseClient_kron_Replace;
private _price = round((life_dhl_startPoint distance2D life_dhl_finishPoint) * LIFE_SETTINGS(getNumber,"life_dhl_price"));

"DHL - Order Tasks 1 add..." call SunriseClient_system_log;

life_dhl_job = player createSimpleTask [format["JOB_DHL_%1",getPlayerUID player]];

life_dhl_job setSimpleTaskDestination getpos life_dhl_startPoint;
life_dhl_job setSimpleTaskDescription [format["Заберите посылку из %1, погрузите ее в фургон и отправляйтесь в %2",toUpper(_dpStart),toUpper(_dpEnd)],format["Заберите посылку в %1",toUpper(_dpStart)],""];
life_dhl_job setTaskState "CREATED";
life_dhl_job setSimpleTaskType "MAP";
player setCurrentTask life_dhl_job;

life_job_inProgress = true;
life_job_startTime = time;