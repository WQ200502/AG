/*

	Filename: 	SunriseClient_system_medGoOnDuty.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (time - life_duty_timer < 10) exitWith {["Подождите и повторите через пару секунд","error"] call SunriseClient_gui_bottomNotification};
if !(life_medlevel > 0) exitWith {["Вы не работаете в министерстве здравоохранения!","error"] call SunriseClient_gui_bottomNotification};
if !(isNil {(group player) getVariable "gang_owner"}) exitWith {["Вы должны выйти из группы!","error"] call SunriseClient_gui_bottomNotification};
life_duty_timer = time;

[player] joinSilent life_medGroup;
[player] remoteExecCall ["SunriseServer_system_medGoOnDuty",2];

player setVariable ["medDuty",true,true];
life_medDuty = true;

[player,"medrank",life_medlevel] call CBA_fnc_setVarNet;
[] call SunriseClient_system_setTag;

["Вы заступили на смену. Не забудьте экипироваться и взять автомобиль.","done"] call SunriseClient_gui_bottomNotification;