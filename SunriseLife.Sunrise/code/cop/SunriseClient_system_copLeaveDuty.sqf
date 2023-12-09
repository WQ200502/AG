/*

	Filename: 	SunriseClient_system_copLeaveDuty.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (time - life_duty_timer < 10) exitWith {["error","","Подождите и повторите через пару секунд"] call SunriseClient_message};
if !(life_coplevel > 0) exitWith {["error","","Вы не работаете в полицейском департаменте!"] call SunriseClient_message};
life_duty_timer = time;

[player] remoteExecCall ["SunriseServer_system_copLeaveDuty",2];
[player] joinSilent (createGroup civilian);

player setVariable ["copDuty",false,true];
life_copDuty = false;

[player,"copLevel",0] call CBA_fnc_setVarNet;
[] call SunriseClient_system_setTag;

["done","","Вы закончили смену. Хорошего дня!"] call SunriseClient_message;