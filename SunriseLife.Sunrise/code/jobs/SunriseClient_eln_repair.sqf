/*

	Filename: 	SunriseClient_eln_repair.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {["Вы заняты", "error"] call SunriseClient_gui_BottomNotification};
params ["_target", "_caller", "_actionId"];
if (isNull life_eln_job) exitWith {["Вы не на работе", "error"] call SunriseClient_gui_BottomNotification; removeAllActions _target};
if (life_eln_vehicle distance player > 75) exitWith {["Ваша машина должна находиться рядом с вами для осуществления ремонтных работ","error"] call SunriseClient_gui_bottomNotification};
["Чиним лампу",7,"repairme","",false,{if !(animationState player isEqualTo "acts_carfixingwheel") then {["Acts_carFixingWheel"] call SunriseClient_system_animDo};!(isNull objectParent player)}] call SunriseClient_system_progressBar;

if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};
if !(NOTINVEH(player)) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"]};

life_eln_task setTaskState "SUCCEEDED"; 
life_eln_lamps = life_eln_lamps - [_target];
_target removeAction _actionId;

if (life_eln_lamps isEqualTo []) then {
	_price = getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_eln_price");
	if (IS_VIP) then {_price = _price call SunriseClient_system_increase};
	[format ["Вы выполнили работу, $%1 переведены на ваш счет. Верните технику в офис или продолжите работу",_price], "done"] call SunriseClient_gui_bottomNotification;
	["ElnDone"] spawn SunriseClient_experience_addExp;
	["atm","add",_price,"elnJob"] call SunriseClient_system_myCash;

	life_eln_job setTaskState "SUCCEEDED"; 
	player removeSimpleTask life_eln_job;
	player removeSimpleTask life_eln_task;
	life_job_inProgress = false;
	[["earning", getPlayerUID player, (player getVariable ["realname",""]), "eln", time - life_job_startTime, _price],"customLog"] call SunriseClient_system_hcExec;
} else {
	private _closest = objNull;
	private _closestdist = 100000;
	private _p_pos = getpos player;
	{
		if (_x distance _p_pos < _closestdist) then {
			_closest = _x;
			_closestdist = _x distance _p_pos;
		};
	} forEach life_eln_lamps;
	life_eln_task setSimpleTaskDestination (getPos _closest); 
	life_eln_task setTaskState "ASSIGNED"; 
	player setCurrentTask life_eln_task;
	removeAllActions _closest;//костыль
	_closest addAction ["Починить лампу",SunriseClient_eln_repair,"",1,true,true,"","!life_action_inUse",5];
	[format["Вы успешно отремонтировали лампу, осталось ламп: %1 ",count life_eln_lamps], "done"] call SunriseClient_gui_BottomNotification;
};