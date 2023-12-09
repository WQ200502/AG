/*

	Filename: 	SunriseClient_fishing_placeTraps.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
if (life_fishing_inProgress) exitWith {["error","","Вы уже раскидали ловушки"] call SunriseClient_message};
if (EQUAL((driver objectParent player),player)) exitWith {["error","","Вы должны сидеть на месте пассажира"] call SunriseClient_message};
if (vehicle player distance getMarkerPos "fish_zone_mark" > (getMarkerSize "fish_zone_radius" # 0) ) exitWith {["error","","Вы не на територии рыбхоза"] call SunriseClient_message};
if !(life_fishing_pass) exitWith {["error","","У вас нет талона для ловли на територии рыбхоза"] call SunriseClient_message};

private _item = param [0,"",[""]];
private _radius = getMarkerSize "fish_zone_radius" # 0;
private _time = 60;
if (IS_VIP) then {_time = _time call SunriseClient_system_timeDiscount};

["Ждем пока заполнятся ловушки",_time] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};

if (life_interrupted) exitWith {life_interrupted = false; ["error","",format[localize "STR_NOTF_ActionCancel"]] call SunriseClient_message;};
if !(["srl_tinContainer"] call SunriseClient_system_removeItem) exitWith {["error","","Необходимы ловушки!"] call SunriseClient_message};

life_fishing_points = [];
for "_i" from 0 to 1 do {
	_position = ["fish_zone_radius",_radius] call CBA_fnc_randPos;
	life_fishing_points pushBack [round (_position#0),round (_position#1),0];
};

private _point = life_fishing_points select 0;
life_fishing_job = player createSimpleTask [format["FISHING_%1",getPlayerUID player]]; 

life_fishing_job setSimpleTaskDestination _point; 
life_fishing_job setSimpleTaskDescription ["Заполненная рыбой ловушка","Заберите рыбу","Заберите рыбу"];
life_fishing_job setTaskState "CREATED"; 
player setCurrentTask life_fishing_job;

player addAction ["Забрать рыбу из ловушки",SunriseClient_fishing_emptyTrap,_point,0,true,false,"",format["player inArea [%1, 15, 15, 0, false] && !life_action_inUse",_point]];

["done","",format["Ловушки заполнились!"]] call SunriseClient_message;
life_fishing_inProgress = true;
life_job_startTime = time;