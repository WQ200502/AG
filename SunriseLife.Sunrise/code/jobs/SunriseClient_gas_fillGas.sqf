/*

	Filename: 	SunriseClient_gas_fillGas.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params ["_target", "_caller", "_actionId", "_id"];
if (life_action_inUse) exitWith {[localize "STR_NOTF_Action","error"] call SunriseClient_gui_bottomNotification};

private _amount = gas_array select _id select 0;
private _maxLitres = LIFE_SETTINGS(getNumber,"life_gas_maxLitres");
if (_amount isEqualTo _maxLitres) exitWith {["Бензоколонка уже полная","error"] call SunriseClient_gui_bottomNotification};

if (player distance life_gas_vehicle > 25) exitWith {["Проверьте, чтобы ваш грузовик был рядом и повторите попытку","error"] call SunriseClient_gui_bottomNotification};
if !(life_gas_vehicle getVariable ["gasDelivery",false]) exitWith {["В грузовике нет топлива для бензоколонки","error"] call SunriseClient_gui_bottomNotification};

["Заливаем топливо",30,"repairme","",false,{if !(animationState player isEqualTo "acts_carfixingwheel") then {["Acts_carFixingWheel"] call SunriseClient_system_animDo};!(isNull objectParent player)}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};
if !(isNull objectParent player) exitWith {["Вы сели в машину, для заправки бензоколонки необходимо находиться рядом с ней","error"] call SunriseClient_gui_bottomNotification};

private _litrePrice = LIFE_SETTINGS(getNumber,"life_gas_litrePrice");
private _neededGas = _maxLitres - (gas_array # _id # 0);
private _price = _neededGas * _litrePrice;//price for liter
gas_array set [_id, [_maxLitres]];
publicVariable "gas_array";

life_gas_vehicle setVariable ["gasDelivery",false,true];
["GasDone"] spawn SunriseClient_experience_addExp;
if (IS_VIP) then {_price = _price call SunriseClient_system_increase};
["cash","add",_price,"gasJob"] call SunriseClient_system_myCash;
[format ["Вы успешно доставили топливо! На ваш банковский счет зачислено $%1",[_price] call SunriseClient_system_numberText],"done"] call SunriseClient_gui_bottomNotification;
life_gas_job setTaskState "SUCCEEDED"; 
player removeSimpleTask life_gas_job;
life_job_inProgress = false;
[["earning", getPlayerUID player, (player getVariable ["realname",""]), "gas", time - life_job_startTime, _price],"customLog"] call SunriseClient_system_hcExec;