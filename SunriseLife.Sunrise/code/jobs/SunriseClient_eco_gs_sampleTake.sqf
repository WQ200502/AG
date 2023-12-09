/*

	Filename: 	SunriseClient_eco_gs_sampleTake.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {["Вы заняты", "error"] call SunriseClient_gui_BottomNotification};
if !(EQUAL(CURWEAPON,"sunrise_Tool_Shovel")) exitWith {["У вас должна быть лопата в руках!","error"] call SunriseClient_gui_bottomNotification};
if !(NOTINVEH(player)) exitWith {["Для взятия пробы вы должны выйти из машины","error"] call SunriseClient_gui_bottomNotification};

params ["_target", "_caller", "_actionId", "_point"];
if (isNull life_eco_gs_job) exitWith {player removeAction _actionId;["Вы не на работе", "error"] call SunriseClient_gui_BottomNotification};

["Берем пробу грунта",7,"","",false,{player forceWeaponFire ["sunrise_Tool_Shovel", "Hack"]}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};	

life_eco_gs_task setTaskState "SUCCEEDED"; 
life_eco_gs_points = life_eco_gs_points - [_point];
player removeAction _actionId;

if (life_eco_gs_points isEqualTo []) then {
	_price = getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_eco_gs_price");
	if (IS_VIP) then {_price = _price call SunriseClient_system_increase};
	[format ["Вы выполнили работу, $%1 переведены на ваш счет. Верните технику в офис или продолжите работу",_price], "done"] call SunriseClient_gui_bottomNotification;
	["EcoGSDone"] spawn SunriseClient_experience_addExp;
	["atm","add",_price,"eco_gsJob"] call SunriseClient_system_myCash;
	
	life_eco_gs_job setTaskState "SUCCEEDED"; 
	player removeSimpleTask life_eco_gs_job;
	player removeSimpleTask life_eco_gs_task;
	deleteMarkerLocal "eco_gs_marker";
	life_job_inProgress = false;
	[["earning", getPlayerUID player, (player getVariable ["realname",""]), "eco_gs", time - life_job_startTime, _price],"customLog"] call SunriseClient_system_hcExec;
} else {
	private _closest = [0,0,0];
	private _closestdist = 100000;
	private _p_pos = getpos player;
	{
		if (_x distance _p_pos < _closestdist) then {
			_closest = _x;
			_closestdist = _x distance _p_pos;
		};
	} forEach life_eco_gs_points;
	life_eco_gs_task setSimpleTaskDestination _closest; 
	life_eco_gs_task setTaskState "ASSIGNED"; 
	player setCurrentTask life_eco_gs_task;
	"eco_gs_marker" setMarkerPosLocal _closest;
	player addAction ["Взять пробу грунта",SunriseClient_eco_gs_sampleTake,_closest,0,true,false,"",format["_target inArea [%1, 10, 10, 0, false] && !life_action_inUse && isNull objectParent player",_closest]];
	[format["Вы успешно взяли пробу, осталось %1 проб",count life_eco_gs_points], "done"] call SunriseClient_gui_BottomNotification;
};