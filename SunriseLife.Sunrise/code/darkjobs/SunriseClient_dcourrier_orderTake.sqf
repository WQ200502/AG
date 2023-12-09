/*

	Filename: 	SunriseClient_dcourrier_orderTake.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_job_inProgress) exitWith {["error","","Сначала закончите свою работу!"] call SunriseClient_message};

private _town_cfg = configName selectRandom ("true" configClasses (missionConfigFile >> "LifeCfgJobs" >> "dcourrierTowns"));
private _town_name = getText(missionConfigFile >> "LifeCfgJobs" >> "dcourrierTowns" >> _town_cfg >> "townName"); 
private _town_pos = getArray(missionConfigFile >> "LifeCfgJobs" >> "dcourrierTowns" >> _town_cfg >> "townPosition"); 
life_dcourrier_digs = nearestObjects [_town_pos, ["Land_i_Stone_Shed_V1_F","Land_Metal_Shed_F","Land_Slum_House02_F"], 1000];
if (count life_dcourrier_digs > 10) then {life_dcourrier_digs resize 10};
if (life_dcourrier_digs isEqualTo []) exitWith {["error","","Что-то сломалось. Отбой, пишите письма"] call SunriseClient_message};

life_dcourrier_job = player createSimpleTask [format["JOB_DCOURRIER_%1",getPlayerUID player]]; 
life_dcourrier_job setSimpleTaskDescription ["Вам нужно сделать закладки!",format["Работа наркокурьером в городе %1",_town_name],format["Работа наркокурьером в городе %1",_town_name]];
life_dcourrier_job setTaskState "CREATED"; 

private _dig = life_dcourrier_digs select 0;
life_dcourrier_task = [["DCOURRIER_DIG"],(getpos _dig),["Сделайте закладку!","Сделайте закладку!","land"]] call SunriseClient_system_createTask;

_dig addAction ["Сделать закладку",SunriseClient_dcourrier_dig,"",1,true,true,"","!life_action_inUse",5];
life_job_inProgress = true;
life_job_startTime = time;