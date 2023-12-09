/*

	Filename: 	SunriseClient_jobs_startEcologist.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_job_inProgress) exitWith {["Сначала закончите свою работу!", "error"] call SunriseClient_gui_bottomNotification};
private _spawnPoint = LIFE_SETTINGS(getText,"life_eco_office");
if (EQUAL(_spawnPoint,"")) exitWith {};

private _spawnPointPos = getMarkerPos _spawnPoint;
private _task = [[format["JOB_%1",_this]],_spawnPointPos,["Покиньте биржу труда и отправляйтесь в офис эколога за спец. одеждой и техникой! У вас 15 минут!","Отправляйтесь в офис эколога","meet"]] call SunriseClient_system_createTask;

[{player distance (_this#0) < 10}, {
	missionNamespace setVariable [format["life_eco_%1_readyToWork",_this#2],true];
	player removeSimpleTask (_this#1);
	["Вы добрались до офиса!","done"] call SunriseClient_gui_bottomNotification;
}, [_spawnPointPos,_task,_this], 900, 
{
	["Вы не успели добраться до офиса!","error"] call SunriseClient_gui_bottomNotification;
	player removeSimpleTask (_this#1);
}] call CBA_fnc_waitUntilAndExecute;
