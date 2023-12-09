/*

	Filename: 	SunriseClient_system_medLeaveDuty.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (time - life_duty_timer < 10) exitWith {["等待并在几秒钟内重复","error"] call SunriseClient_gui_bottomNotification};
if !(life_medlevel > 0) exitWith {["您不为卫生部工作!c!","error"] call SunriseClient_gui_bottomNotification};
life_duty_timer = time;

[player] remoteExecCall ["SunriseServer_system_medLeaveDuty",2];
[player] joinSilent (createGroup civilian);

player setVariable ["medDuty",false,true];
life_medDuty = false;

[player,"medrank",0] call CBA_fnc_setVarNet;
[] call SunriseClient_system_setTag;

["你已经完成了换班.祝你好运!","done"] call SunriseClient_gui_bottomNotification;