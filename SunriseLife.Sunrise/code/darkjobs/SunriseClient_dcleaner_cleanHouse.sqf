/*

	Filename: 	SunriseClient_dcleaner_cleanHouse.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {["error","","Вы заняты"] call SunriseClient_message};
params ["_target", "_caller", "_actionId"];
if (isNull life_dcleaner_job) exitWith {player removeAction _actionId;["error","",format["Вы не на работе"]] call SunriseClient_message};
if (random(100) >= (50 * perk_stealth)) then {
	["police","","Вас заметили жители, о вашей деятельности сообщено в полицию"] call SunriseClient_message;
	
	[[1,2],format["!!! Чистильщик (координаты: %1) орудует в городе %2 !!!",mapGridPosition player, text (nearestLocation[getPos player,"NameCity"])],false,[]] remoteExecCall ["SunriseClient_system_broadcast",life_copGroup];
	[[getPlayerUID player,name player,"220"],"wantedAdd"] call SunriseClient_system_hcExec;
};

["Скрываем улики преступления",10,"","",true] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; ["error","",format[localize "STR_NOTF_ActionCancel"]] call SunriseClient_message};

life_dcleaner_task setTaskState "SUCCEEDED"; 
deleteVehicle life_dcleaner_corpse;
life_dcleaner_houses = life_dcleaner_houses - [_target];

if (life_dcleaner_houses isEqualTo []) then {
	_price = getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_dcleaner_price");
	if (IS_VIP) then {_price = _price call SunriseClient_system_increase};
	["done","",format["您正在尝试执行此操作。请参阅 $%1 德意志",_price]] call SunriseClient_message;
	
	["dcash","add",_price,"dcleanerJob"] call SunriseClient_system_myCash;
	["DCleanerDone"] spawn SunriseClient_experience_addExp;
	life_dcleaner_job setTaskState "SUCCEEDED"; 
	player removeSimpleTask life_dcleaner_job;
	player removeSimpleTask life_dcleaner_task;
	life_job_inProgress = false;
	[["earning", getPlayerUID player, (player getVariable ["realname",""]), "dcleaner", time - life_job_startTime, _price],"customLog"] call SunriseClient_system_hcExec;
} else {
	private _closest = objNull;
	private _closestdist = 10000;

	{
		if (_x distance player < _closestdist) then {
			_closest = _x;
			_closestdist = _x distance player;
		};
	} forEach life_dcleaner_houses;
	life_dcleaner_corpse = (selectRandom ["Land_Bodybag_01_white_F","Land_Bodybag_01_blue_F","Land_Bodybag_01_black_F"]) createVehicleLocal [0,0,0];

	private _corpse_pos = selectRandom (_closest buildingPos -1);
	life_dcleaner_corpse setPosATL _corpse_pos;

	life_dcleaner_task setSimpleTaskDestination _corpse_pos; 
	life_dcleaner_task setTaskState "ASSIGNED"; 
	player setCurrentTask life_dcleaner_task;
	_closest addAction ["Скрыть улики",SunriseClient_dcleaner_cleanHouse,"",5,true,true,"","!life_action_inUse",5];
	["done","",format["Вы успешно сделали скрыли улики, осталось: %1 ",count life_dcleaner_houses]] call SunriseClient_message;
};
_target removeAction _actionId;