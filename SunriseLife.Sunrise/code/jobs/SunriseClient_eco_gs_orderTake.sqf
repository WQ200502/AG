/*

	Filename: 	SunriseClient_eco_gs_orderTake.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_job_inProgress) exitWith {["Сначала закончите свою работу!", "error"] call SunriseClient_gui_bottomNotification};
private _spawnPoint = LIFE_SETTINGS(getText,"life_eco_gs_office_spawn");
if (life_eco_gs_vehicle distance getMarkerPos _spawnPoint < 30) exitWith {["Вы рядом с офисом, отъедьте на 30 метров чтобы взять работу", "error"] call SunriseClient_gui_BottomNotification};

life_eco_gs_points = [];
private _points = getArray(missionConfigFile >> "LifeCfgSettings" >> "life_eco_gs_car_points");
while {count life_eco_gs_points < 3} do {life_eco_gs_points pushBackUnique (selectRandom _points)};

life_eco_gs_job = player createSimpleTask [format["JOB_ECO_GS_%1",getPlayerUID player]]; 
life_eco_gs_job setSimpleTaskDescription ["Работа пробоотборщиком грунта описание","Работа пробоотборщика грунта","Работа пробоотборщика грунта"];
life_eco_gs_job setTaskState "CREATED"; 

private _point = life_eco_gs_points select 0;
life_eco_gs_task = player createSimpleTask ["ECO_GS_POINT",life_eco_gs_job]; 

life_eco_gs_task setSimpleTaskDestination _point; 
life_eco_gs_task setSimpleTaskDescription ["Место для отбора пробы грунта","Работа пробоотборщика грунта","Работа пробоотборщика грунта"];
life_eco_gs_task setTaskState "CREATED"; 
player setCurrentTask life_eco_gs_task;

_mrk = createMarkerLocal ["eco_gs_marker",_point]; 
_mrk setMarkerShapeLocal "ELLIPSE";
_mrk setMarkerColorLocal "ColorOrange";
_mrk setMarkerAlphaLocal 0.5;
_mrk setMarkerSizeLocal [10, 10];

player addAction ["Взять пробу грунта",SunriseClient_eco_gs_sampleTake,_point,0,true,false,"",format["player inArea [%1, 10, 10, 0, false] && !life_action_inUse && isNull objectParent player",_point]];

["Вы взяли заказ, следуйте на точку", "done"] call SunriseClient_gui_BottomNotification;
life_job_inProgress = true;
life_job_startTime = time;