/*

	Filename: 	SunriseClient_system_copGoOnDuty.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (time - life_duty_timer < 10) exitWith {["error","","Подождите и повторите через пару секунд"] call SunriseClient_message};
if !(life_coplevel > 0) exitWith {["error","","Вы не работаете в полицейском департаменте!"] call SunriseClient_message};
if !(isNil {(group player) getVariable "gang_owner"}) exitWith {["error","","Вы должны выйти из группы!"] call SunriseClient_message};
life_duty_timer = time;

[player] joinSilent life_copGroup;
[player] remoteExecCall ["SunriseServer_system_copGoOnDuty",2];

player setVariable ["copDuty",true,true];
life_copDuty = true;

[player,"copLevel",life_coplevel] call CBA_fnc_setVarNet;
[] call SunriseClient_system_setTag;

["done","","Вы заступили на смену. Не забудьте экипироваться."] call SunriseClient_message;