/*

	Filename: 	SunriseClient_bus_checkIn.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {["Вы заняты", "error"] call SunriseClient_gui_BottomNotification};
if (NOTINVEH(player)) exitWith {["Для отметки вы должны находиться в технике.", "error"] call SunriseClient_gui_BottomNotification};
if (isNull life_bus_job) exitWith {["Вы не на работе", "error"] call SunriseClient_gui_BottomNotification};

params ["_target", "_caller", "_actionId", "_point"];

["Ждем пассажиров",15,"","",false,{(NOTINVEH(player) OR life_bus_vehicle distance _point > 10)}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};	
if (NOTINVEH(player)) exitWith {["Для отметки вы должны находиться в технике.", "error"] call SunriseClient_gui_BottomNotification};
if (life_bus_vehicle distance _point > 10) exitWith {["Для отметки вы не должны двигаться.", "error"] call SunriseClient_gui_BottomNotification};

life_bus_task setTaskState "SUCCEEDED"; 
life_bus_points = life_bus_points - [_point];
life_bus_vehicle removeAction _actionId;

if (life_bus_points isEqualTo []) then {
	_price = getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_bus_price");
	if (IS_VIP) then {_price = _price call SunriseClient_system_increase};
	[format ["Вы выполнили работу, $%1 переведены на ваш счет. Верните технику в офис или продолжите работу",_price], "done"] call SunriseClient_gui_bottomNotification;
	["BusDone"] spawn SunriseClient_experience_addExp;
	["atm","add",_price,"busJob"] call SunriseClient_system_myCash;

	life_bus_job setTaskState "SUCCEEDED"; 
	player removeSimpleTask life_bus_task;
	player removeSimpleTask life_bus_job;
	life_job_inProgress = false;
	[["earning", getPlayerUID player, (player getVariable ["realname",""]), "bus", time - life_job_startTime, _price],"customLog"] call SunriseClient_system_hcExec;
} else {
	_closest = life_bus_points#0;
	life_bus_task setSimpleTaskDestination _closest; 
	life_bus_task setTaskState "ASSIGNED"; 
	player setCurrentTask life_bus_task;
	life_bus_vehicle addAction ["Отметиться",SunriseClient_bus_checkIn,_closest,3,true,false,"",format["_target inArea [%1, 10, 10, 0, false] && !life_action_inUse",_closest]];
	[format["Вы успешно отметились на остановке, осталось %1 остановок",count life_bus_points], "done"] call SunriseClient_gui_BottomNotification;
};