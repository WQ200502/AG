/*

	Filename: 	SunriseClient_dcleaner_orderTake.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_job_inProgress) exitWith {["error","","Сначала закончите свою работу!"] call SunriseClient_message};

private _town_cfg = configName selectRandom ("true" configClasses (missionConfigFile >> "LifeCfgJobs" >> "dcleanerTowns"));
private _town_name = getText(missionConfigFile >> "LifeCfgJobs" >> "dcleanerTowns" >> _town_cfg >> "townName"); 
private _town_pos = getArray(missionConfigFile >> "LifeCfgJobs" >> "dcleanerTowns" >> _town_cfg >> "townPosition"); 
life_dcleaner_houses = nearestObjects [_town_pos, ["Land_i_Addon_02_V1_F","Land_Metal_Shed_F","Land_u_Addon_01_V1_F","Land_Slum_House03_F"], 1000];
if (count life_dcleaner_houses > 10) then {life_dcleaner_houses resize 10};
if (life_dcleaner_houses isEqualTo []) exitWith {["error","","Что-то сломалось. Отбой, пишите письма"] call SunriseClient_message};

life_dcleaner_job = player createSimpleTask [format["JOB_DCLEANER_%1",getPlayerUID player]]; 
life_dcleaner_job setSimpleTaskDescription ["Вам нужно скрыть улики убийства!",format["Работа чистильщиком в городе %1",_town_name],format["Работа чистильщиком в городе %1",_town_name]];
life_dcleaner_job setTaskState "CREATED"; 

life_dcleaner_corpse = (selectRandom ["Land_Bodybag_01_white_F","Land_Bodybag_01_blue_F","Land_Bodybag_01_black_F"]) createVehicleLocal [0,0,0];
life_dcleaner_corpse setPosATL _corpse_pos;
private _house = life_dcleaner_houses select 0;
private _corpse_pos = selectRandom (_house buildingPos -1);

life_dcleaner_task = [["DCLEANER_CORPSE"],_corpse_pos,["Скройте улики убийства!","Скройте улики убийства!","walk"]] call SunriseClient_system_createTask;
_house addAction ["Скрыть улики",SunriseClient_dcleaner_cleanHouse,"",5,true,true,"","!life_action_inUse",5];
life_job_inProgress = true;
life_job_startTime = time;