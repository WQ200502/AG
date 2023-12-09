/*

	Filename: 	SunriseClient_jobs_startElectrician.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_job_inProgress) exitWith {["Сначала закончите свою работу!", "error"] call SunriseClient_gui_bottomNotification};
private _spawnPoint = LIFE_SETTINGS(getText,"life_eln_office");
if (EQUAL(_spawnPoint,"")) exitWith {};

private _spawnPointPos = getMarkerPos _spawnPoint;
private _task = [["JOB_ELN"],_spawnPointPos,["Покиньте биржу труда и отправляйтесь в офис электрика за спец. одеждой и техникой! У вас 15 минут!","Отправляйтесь в офис электрика","meet"]] call SunriseClient_system_createTask;

[{player distance (_this#0) < 10}, {
	life_eln_readyToWork = true;
	player removeSimpleTask (_this#1);
	["Вы добрались до офиса!","done"] call SunriseClient_gui_bottomNotification;
}, [_spawnPointPos,_task], 900, 
{
	["Вы не успели добраться до офиса!","error"] call SunriseClient_gui_bottomNotification;
	player removeSimpleTask (_this#1);
}] call CBA_fnc_waitUntilAndExecute;