/*

	Filename: 	SunriseClient_eln_orderTake.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_job_inProgress) exitWith {["Сначала закончите свою работу!", "error"] call SunriseClient_gui_bottomNotification};
private _spawnPoint = LIFE_SETTINGS(getText,"life_eln_office_spawn");
if (life_eln_vehicle distance getMarkerPos _spawnPoint < 30) exitWith {["Вы рядом с офисом, отъедьте на 30 метров чтобы взять работу", "error"] call SunriseClient_gui_BottomNotification};

private _town_cfg = configName selectRandom ("true" configClasses (missionConfigFile >> "LifeCfgJobs" >> "elnLamps"));
private _town_name = getText(missionConfigFile >> "LifeCfgJobs" >> "elnLamps" >> _town_cfg >> "townName"); 
private _town_pos = getArray(missionConfigFile >> "LifeCfgJobs" >> "elnLamps" >> _town_cfg >> "townPosition"); 
life_eln_lamps = nearestObjects [_town_pos, ["Land_LampStreet_F","Land_LampStreet_small_F","Land_LampDecor_F"], 750];
if (count life_eln_lamps > 10) then {life_eln_lamps resize 10};
if (life_eln_lamps isEqualTo []) exitWith {["Что-то сломалось. Отбой, пишите письма", "error"] call SunriseClient_gui_BottomNotification};

life_eln_job = player createSimpleTask [format["JOB_ELN_%1",getPlayerUID player]]; 
life_eln_job setSimpleTaskDescription ["Вам необходимо починить все неисправные лампы в городе!",format["Работа электриком в городе %1",_town_name],format["Работа электриком в городе %1",_town_name]];
life_eln_job setTaskState "CREATED"; 


private _lamp = life_eln_lamps select 0;
life_eln_task = player createSimpleTask ["ELN_LAMP",life_eln_job]; 

life_eln_task setSimpleTaskDestination (getPos _lamp); 
life_eln_task setSimpleTaskDescription ["Почините эту лампу!","Неисправная лампа","Неисправная лампа"];
life_eln_task setTaskState "CREATED"; 
player setCurrentTask life_eln_task;

removeAllActions _lamp;
_lamp addAction ["Починить лампу",SunriseClient_eln_repair,"",1,true,true,"","!life_action_inUse",5];

["Вы взяли заказ, следуйте на точку", "done"] call SunriseClient_gui_BottomNotification;
life_job_inProgress = true;
life_job_startTime = time;