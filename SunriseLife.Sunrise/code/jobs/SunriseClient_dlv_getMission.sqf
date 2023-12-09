/*
	
	Filename: 	SunriseClient_dlv_getMission.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_job_inProgress) exitWith {["Сначала закончите свою работу!", "error"] call SunriseClient_gui_bottomNotification};
disableSerialization;
private _control = CONTROL(4300,4302);
private _to = _control lbData (lbCurSel _control);

closeDialog 0;
if (_to isEqualTo "") exitWith {};

if (player distance life_dlv_vehicle > 25) exitWith {["Проверьте, чтобы ваш грузовик был рядом и повторите попытку","error"] call SunriseClient_gui_bottomNotification};
private _cargoDeliver = life_dlv_vehicle GVAR ["cargoDeliver",[]];
if !(_cargoDeliver isEqualTo []) exitWith {["Вы уже взяли заказ на доставку","error"] call SunriseClient_gui_bottomNotification};

private _price = [str(life_depo),_to,life_dlv_vehicle] call SunriseClient_dlv_price;
private _fromTitle = [str(life_depo)] call SunriseClient_dlv_varToStr;
private _toTitle = [_to] call SunriseClient_dlv_varToStr;

life_dlv_vehicle SVAR ["cargoDeliver",[str(life_depo),_to,_price],true];
life_dlv_job = player createSimpleTask [format["JOB_dlv_%1",getPlayerUID player]]; 
life_dlv_job setSimpleTaskDescription ["Работа дальнобойщиком описание","Работа дальнобойщиком","Работа дальнобойщиком"];
life_dlv_job setTaskState "CREATED"; 
life_dlv_job setSimpleTaskDestination getPos (call compile _to); 
player setCurrentTask life_dlv_job;
[format ["Вы взяли заказ на доставку груза из %1 в %2. Удачи на дороге!",_fromTitle,_toTitle],"done"] call SunriseClient_gui_bottomNotification;
life_job_inProgress = true;
life_job_startTime = time;