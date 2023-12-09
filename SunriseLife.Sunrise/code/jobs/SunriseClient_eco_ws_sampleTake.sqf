/*

	Filename: 	SunriseClient_eco_ws_sampleTake.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {["Вы заняты", "error"] call SunriseClient_gui_BottomNotification};
if (NOTINVEH(player)) exitWith {["Для взятия пробы вы должны находиться в технике.","error"] call SunriseClient_gui_bottomNotification};

private _vehicle = objectParent player;
if (EQUAL((driver _vehicle),player)) exitWith {[localize "STR_NOTF_PassengerSeat","error"] call SunriseClient_gui_bottomNotification};

params ["_target", "_caller", "_actionId", "_point"];
if (isNull life_eco_ws_job) exitWith {["Вы не на работе", "error"] call SunriseClient_gui_BottomNotification;player removeAction _actionId;};

["Берем пробу воды",15,"","",false,{(NOTINVEH(player)) OR (isEngineOn _vehicle) OR (EQUAL((driver _vehicle),player))}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};	
if (NOTINVEH(player)) exitWith {["Для взятия пробы вы должны находиться в технике","error"] call SunriseClient_gui_bottomNotification};
if (isEngineOn _vehicle) exitWith {["Для взятия пробы мотор должен быть заглушен","error"] call SunriseClient_gui_bottomNotification};
if (EQUAL((driver _vehicle),player)) exitWith {[localize "STR_NOTF_PassengerSeat","error"] call SunriseClient_gui_bottomNotification};

life_eco_ws_task setTaskState "SUCCEEDED"; 
life_eco_ws_points = life_eco_ws_points - [_point];
life_eco_ws_vehicle removeAction _actionId;

if (life_eco_ws_points isEqualTo []) then {
	_price = getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_eco_ws_price");
	if (IS_VIP) then {_price = _price call SunriseClient_system_increase};
	[format ["Вы выполнили работу, $%1 переведены на ваш счет. Верните технику в офис или продолжите работу",_price], "done"] call SunriseClient_gui_bottomNotification;
	["atm","add",_price,"eco_wsJob"] call SunriseClient_system_myCash;
	["EcoWSDone"] spawn SunriseClient_experience_addExp;

	life_eco_ws_job setTaskState "SUCCEEDED"; 
	player removeSimpleTask life_eco_ws_job;
	player removeSimpleTask life_eco_ws_task;
	deleteMarkerLocal "eco_ws_marker";
	life_job_inProgress = false;
	[["earning", getPlayerUID player, (player getVariable ["realname",""]), "eco_ws", time - life_job_startTime, _price],"customLog"] call SunriseClient_system_hcExec;
} else {
	private _closest = [0,0,0];
	private _closestdist = 100000;
	private _p_pos = getpos player;
	{
		if (_x distance _p_pos < _closestdist) then {
			_closest = _x;
			_closestdist = _x distance _p_pos;
		};
	} forEach life_eco_ws_points;
	life_eco_ws_task setSimpleTaskDestination _closest; 
	life_eco_ws_task setTaskState "ASSIGNED"; 
	player setCurrentTask life_eco_ws_task;
	"eco_ws_marker" setMarkerPosLocal _closest;
	life_eco_ws_vehicle addAction ["Взять пробу воды",SunriseClient_eco_ws_sampleTake,_closest,0,true,false,"",format["player inArea [%1, 250, 250, 0, false] && !life_action_inUse",_closest]];
	[format["Вы успешно взяли пробу, осталось %1 проб",count life_eco_ws_points], "done"] call SunriseClient_gui_BottomNotification;
};