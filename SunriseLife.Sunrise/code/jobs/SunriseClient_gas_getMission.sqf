/*
	
	Filename: 	SunriseClient_gas_getMission.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"

disableSerialization;
private _control = CONTROL(8200,8202);
private _to = _control lbValue (lbCurSel _control);

closeDialog 0;
if (_to isEqualTo "") exitWith {};
private _pumps = [[3757.27,13477.9,0.284326],[3757.68,13485.9,0.17697],[4001.14,12592.1,0.29137],[5019.57,14436.7,0.284588],[5023.17,14429.5,0.286886],[6198.84,15081.4,0.289261],[6798.12,15561.6,0.303074],[9025.77,15729.5,0.280479],[9023.86,15729.1,0.286369],[9021.94,15728.8,0.299515],[8481.83,18260.7,0.287231],[9205.86,12112.2,0.28462],[14173.3,16541.9,0.284382],[15297.1,17565.9,0.283983],[15780.9,17453.2,0.285763],[14136.9,18691.6,0.385155],[16875.2,15469.4,0.198438],[16871.7,15476.6,0.225411],[17417.2,13936.8,0.35062],[16750.9,12513.1,0.286047],[14351.9,12934.8,0.233295],[14357.7,12930.9,0.233295],[19965.2,11447.5,0.285095],[19961.3,11454.5,0.170815],[21230.5,7116.65,0.280348],[20784.9,16666,0.294933],[20789.6,16672.4,0.284454],[23379.4,19798.9,0.283937],[25701.2,21372.6,0.284824]];
if (isNil {_pumps#_to}) exitWith {["Этой заправки нет","error"] call SunriseClient_gui_bottomNotification};
if (player distance life_gas_vehicle > 25) exitWith {["Проверьте, чтобы ваш грузовик был рядом и повторите попытку","error"] call SunriseClient_gui_bottomNotification};
if (life_gas_vehicle GVAR ["gasDelivery",false]) exitWith {["Вы уже взяли топливо для доставки на бензоколонку","error"] call SunriseClient_gui_bottomNotification};

life_gas_vehicle SVAR ["gasDelivery",true,true];
life_gas_job = player createSimpleTask [format["JOB_GAS_%1",getPlayerUID player]]; 
life_gas_job setSimpleTaskDescription ["Работа развозчиком топлива описание","Работа развозчиком топлива","Работа развозчиком топлива"];
life_gas_job setTaskState "CREATED"; 
life_gas_job setSimpleTaskDestination (_pumps#_to); 
player setCurrentTask life_gas_job;
[format ["Вы взяли заказ на доставку топлива в заправку #%1. Удачи на дороге!",_to],"done"] call SunriseClient_gui_bottomNotification;
life_job_inProgress = true;
life_job_startTime = time;