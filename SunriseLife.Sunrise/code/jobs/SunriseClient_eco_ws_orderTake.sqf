/*

	Filename: 	SunriseClient_eco_ws_orderTake.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_job_inProgress) exitWith {["Сначала закончите свою работу!", "error"] call SunriseClient_gui_bottomNotification};
private _spawnPoint = LIFE_SETTINGS(getText,"life_eco_gs_office_spawn");
if (life_eco_ws_vehicle distance getMarkerPos _spawnPoint < 30) exitWith {["Вы рядом с офисом, отъедьте на 30 метров чтобы взять работу", "error"] call SunriseClient_gui_BottomNotification};

life_eco_ws_points = [];
private _points = getArray(missionConfigFile >> "LifeCfgSettings" >> "life_eco_ws_vehicle_points");
while {count life_eco_ws_points < 3} do {life_eco_ws_points pushBackUnique (selectRandom _points)};

life_eco_ws_job = player createSimpleTask [format["JOB_ECO_WS_%1",getPlayerUID player]]; 
life_eco_ws_job setSimpleTaskDescription ["Работа пробоотборщиком воды описание","Работа пробоотборщика воды","Работа пробоотборщика воды"];
life_eco_ws_job setTaskState "CREATED"; 

private _point = life_eco_ws_points select 0;
life_eco_ws_task = player createSimpleTask ["ECO_WS_POINT",life_eco_ws_job]; 

life_eco_ws_task setSimpleTaskDestination _point; 
life_eco_ws_task setSimpleTaskDescription ["Место для отбора пробы воды","Работа пробоотборщика воды","Работа пробоотборщика воды"];
life_eco_ws_task setTaskState "CREATED"; 
player setCurrentTask life_eco_ws_task;

_mrk = createMarkerLocal ["eco_ws_marker",_point]; 
_mrk setMarkerShapeLocal "ELLIPSE";
_mrk setMarkerColorLocal "ColorOrange";
_mrk setMarkerAlphaLocal 0.5;
_mrk setMarkerSizeLocal [250, 250];

life_eco_ws_vehicle addAction ["Взять пробу воды",SunriseClient_eco_ws_sampleTake,_point,0,true,false,"",format["_target inArea [%1, 250, 250, 0, false]",_point]];

["Вы взяли заказ, следуйте на точку", "done"] call SunriseClient_gui_BottomNotification;
life_job_inProgress = true;
life_job_startTime = time;