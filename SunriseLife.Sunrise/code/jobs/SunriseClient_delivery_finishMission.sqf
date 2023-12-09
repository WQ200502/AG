/*

	Filename: 	SunriseClient_dlv_finishMission.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
life_depo = param [0,ObjNull,[ObjNull]];
if (life_action_inUse) exitWith {};
disableSerialization;
private _control = CONTROL(4300,4302);
if (player distance life_dlv_vehicle > 25) exitWith {["Проверьте, чтобы ваш грузовик был рядом и повторите попытку","error"] call SunriseClient_gui_bottomNotification};

private _cargoDeliver = life_dlv_vehicle GVAR ["cargoDeliver",[]];
_cargoDeliver params ["_from","_to"];
if (_cargoDeliver isEqualTo []) exitWith {["У вас не взят заказ на доставку","error"] call SunriseClient_gui_bottomNotification};

private _fromTitle = [_from] call SunriseClient_dlv_varToStr;
private _toTitle = [_to] call SunriseClient_dlv_varToStr;

if (_to != str(life_depo)) exitWith {[format["Вы привезли груз не в то депо! Вам необходимо доставить груз из %1 в %2",_fromTitle,_toTitle],"error"] call SunriseClient_gui_bottomNotification};
_cargoDeliver = life_dlv_vehicle GVAR ["cargoDeliver",[]];

life_dlv_vehicle lockCargo false;
[life_dlv_vehicle,"cargoDeliver"] call SunriseClient_system_clearGlobalVar;

private _distance = (call compile _from) distance (call compile _to);
["DeliveryDone",_distance] spawn SunriseClient_experience_addExp;
private _price = _cargoDeliver select 2;
if (IS_VIP) then {_price = _price call SunriseClient_system_increase};
["atm","add",_price,"deliveryJob"] call SunriseClient_system_myCash;
[format ['Вы успешно доставили груз в депо "%1"! На ваш банковский счет зачислено $%2',_toTitle,[_cargoDeliver select 2] call SunriseClient_system_numberText],"done"] call SunriseClient_gui_bottomNotification;
life_dlv_job setTaskState "SUCCEEDED"; 
player removeSimpleTask life_dlv_job;
life_job_inProgress = false;
[["earning", getPlayerUID player, (player getVariable ["realname",""]), "delivery", time - life_job_startTime, _cargoDeliver select 2],"customLog"] call SunriseClient_system_hcExec;