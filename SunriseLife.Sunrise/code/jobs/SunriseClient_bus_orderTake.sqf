/*

	Filename: 	SunriseClient_bus_orderTake.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_job_inProgress) exitWith {["Сначала закончите свою работу!", "error"] call SunriseClient_gui_bottomNotification};
private _spawnPoint = LIFE_SETTINGS(getText,"life_bus_office_spawn");
if (life_bus_vehicle distance getMarkerPos _spawnPoint < 30) exitWith {["Вы рядом с офисом, отъедьте на 30 метров чтобы взять работу", "error"] call SunriseClient_gui_BottomNotification};
	
life_bus_points = getArray(missionConfigFile >> "LifeCfgSettings" >> "life_bus_points"); 
{life_bus_points set [_forEachIndex,[round(_x select 0),round(_x select 1),round(_x select 2)]]} forEach life_bus_points;

life_bus_job = player createSimpleTask [format["JOB_BUS_%1",getPlayerUID player]]; 
life_bus_job setSimpleTaskDescription ["Вам необходимо заехать на все точки маршрута!","Работа водителем автобуса","Работа водителем автобуса"];
life_bus_job setTaskState "CREATED"; 

private _point = life_bus_points select 0;
life_bus_task = player createSimpleTask ["BUS_point",life_bus_job]; 

life_bus_task setSimpleTaskDestination _point; 
life_bus_task setSimpleTaskDescription ["Направляйтесь на эту точку","Остановка","Остановка"];
life_bus_task setTaskState "CREATED"; 
player setCurrentTask life_bus_task;

life_bus_vehicle addAction ["Отметиться",SunriseClient_bus_checkIn,_point,3,true,false,"",format["_target inArea [%1, 10, 10, 0, false] && !life_action_inUse",_point]];

["Вы взяли заказ, следуйте на точку", "done"] call SunriseClient_gui_BottomNotification;
life_job_inProgress = true;
life_job_startTime = time;

[{
	if ((life_bus_points isEqualTo []) OR (isNull life_bus_vehicle) OR !(alive life_bus_vehicle)) exitWith {[_this#1] call CBA_fnc_removePerFrameHandler};
	if (!(isOnRoad life_bus_vehicle) AND objectParent player isEqualTo life_bus_vehicle AND !(call SunriseClient_system_isInterrupted)) then {
		_fine = round (getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_bus_price") * 0.01);
		["atm","take",_fine] call SunriseClient_system_myCash;
		[format["Вас оштрафовали на $%1, так как вы едете не по дорожному покрытию",[_fine] call SunriseClient_system_numberText],"warning"] call SunriseClient_gui_bottomNotification;
	};
},5] call CBA_fnc_addPerFrameHandler;