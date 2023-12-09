/*

	Filename: 	SunriseClient_terror_bombPlant.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {["error","","Вы заняты"] call SunriseClient_message};
params ["_target", "_caller", "_actionId"];
if (random(100) >= (50 * perk_stealth)) then {
	["police","","Вас заметили жители, о вашей деятельности сообщено в полицию"] call SunriseClient_message;
	[[1,2],format["!!! Террорист (координаты: %1) орудует у церкви в городе %2 !!!",mapGridPosition player, text (nearestLocation[getPos player,"NameCity"])],false,[]] remoteExecCall ["SunriseClient_system_broadcast",life_copGroup];
	[[getPlayerUID player,name player,"240"],"wantedAdd"] call SunriseClient_system_hcExec;
};

["Устанавливаем бомбу",100,"","",true] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; ["error","",format[localize "STR_NOTF_ActionCancel"]] call SunriseClient_message};
_target removeAction _actionId;

["info","","Бомба установлена, взрыв будет через 10 сек"] call SunriseClient_message;
_target allowDamage false;
["Ждем взрыв...",10] call SunriseClient_system_progressBarSimple;
"Bo_GBU12_LGB_MI10" createVehicle [getPosATL _target select 0, getPosATL _target select 1, (getPosATL _target select 2)+0.5];

life_terror_job setTaskState "SUCCEEDED"; 

private _price = getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_terror_price");
if (IS_VIP) then {_price = _price call SunriseClient_system_increase};
["done","",format["Вы успешно выполнили работу, получите вознаграждение в $%1 грязными деньгами",_price]] call SunriseClient_message;

["TerrorDone"] spawn SunriseClient_experience_addExp;
["dcash","add",_price] call SunriseClient_system_myCash;
life_terror_job setTaskState "SUCCEEDED"; 
player removeSimpleTask life_terror_job;
life_job_inProgress = false;
[["earning", getPlayerUID player, (player getVariable ["realname",""]), "terror", time - life_job_startTime, _price],"customLog"] call SunriseClient_system_hcExec;