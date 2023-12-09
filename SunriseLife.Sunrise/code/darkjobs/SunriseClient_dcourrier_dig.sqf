/*

	Filename: 	SunriseClient_dcourrier_dig.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {["error","","Вы заняты"] call SunriseClient_message};
params ["_target", "_caller", "_actionId"];
if (isNull life_dcourrier_job) exitWith {player removeAction _actionId;["error","",format["Вы не на работе"]] call SunriseClient_message};
if (random(100) >= (50 * perk_stealth)) then {
	["police","","这是警方报告你的数据的地方"] call SunriseClient_message;
	[[1,2],format["!!! 标记（坐标）: %1) 形状中的形状 %2 !!!",mapGridPosition player,text (nearestLocation[getPos player,"NameCity"])],false,[]] remoteExecCall ["SunriseClient_system_broadcast",life_copGroup];
	[[getPlayerUID player,name player,"230"],"wantedAdd"] call SunriseClient_system_hcExec;
};

["Делаем закладку",10,"","",true] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; ["error","",format[localize "STR_NOTF_ActionCancel"]] call SunriseClient_message};

life_dcourrier_task setTaskState "SUCCEEDED"; 

life_dcourrier_digs = life_dcourrier_digs - [_target];

if (life_dcourrier_digs isEqualTo []) then {
	_price = getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_dcourrier_price");
	if (IS_VIP) then {_price = _price call SunriseClient_system_increase};
	["done","",format["有关操作执行，请查看 $%1 德国的",_price]] call SunriseClient_message;
	["DCourrierDone"] spawn SunriseClient_experience_addExp;
	["dcash","add",_price,"dcourrierJob"] call SunriseClient_system_myCash;
	life_dcourrier_job setTaskState "SUCCEEDED"; 
	player removeSimpleTask life_dcourrier_job;
	player removeSimpleTask life_dcourrier_task;
	life_job_inProgress = false;
	[["earning", getPlayerUID player, (player getVariable ["realname",""]), "dcourrier", time - life_job_startTime, _price],"customLog"] call SunriseClient_system_hcExec;
} else {
	private _closest = objNull;
	private _closestdist = 10000;
	_p_pos = getpos player;
	{
		if (_x distance _p_pos < _closestdist) then {
			_closest = _x;
			_closestdist = _x distance _p_pos;
		};
	} forEach life_dcourrier_digs;
	life_dcourrier_task setSimpleTaskDestination (getPos _closest); 
	life_dcourrier_task setTaskState "ASSIGNED"; 
	player setCurrentTask life_dcourrier_task;
	_closest addAction ["Сделать закладку",SunriseClient_dcourrier_dig,"",1,true,true,"","!life_action_inUse",5];
	["info","",format["Вы успешно сделали закладку, осталось: %1",count life_dcourrier_digs]] call SunriseClient_message;	
};
_target removeAction _actionId;