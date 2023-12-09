/*

	Filename: 	SunriseClient_terror_orderTake.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_job_inProgress) exitWith {["error","","Сначала закончите свою работу!"] call SunriseClient_message};

private _towns = nearestLocations [getPosATL player, ["NameCity","NameVillage"], 20000]; 
if (_towns isEqualTo []) exitWith {["error","","Вы слишком далеко чтобы найти работу"] call SunriseClient_message};
private _town = selectRandom _towns;  
private _chapel = nearestObjects [getPos _town, ["Land_Chapel_V1_F","Land_Chapel_Small_V2_F"], 3000] select 0; 
 
life_terror_job = [["JOB_TERROR"],(getpos _chapel),["Вам нужно взорвать церковь!",format["Диверсия в городе %1",text _town],"destroy"]] call SunriseClient_system_createTask;

_chapel addAction ["Установить бомбу",SunriseClient_terror_bombPlant,"",1,true,true,"","!life_action_inUse",5];
life_job_inProgress = true;
life_job_startTime = time;