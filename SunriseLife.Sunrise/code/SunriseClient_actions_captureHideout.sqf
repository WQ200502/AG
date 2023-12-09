/*
	
	Filename: 	SunriseClient_actions_captureHideout.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params ["_flag", "_caller", "_actionId", "_arguments"];

private _group = _flag GVAR ["hide_owner",grpNull];

if (isNil {grpPlayer GVAR "gang_name"}) exitWith {[localize "STR_GNOTF_CreateGang", "error"] call SunriseClient_gui_BottomNotification};
if (EQUAL(_group,grpPlayer)) exitWith {[localize "STR_GNOTF_Controlled", "error"] call SunriseClient_gui_BottomNotification};
if !(isNull (_flag GVAR ["inCapture",objNull])) exitWith {[localize "STR_GNOTF_Captured", "error"] call SunriseClient_gui_BottomNotification};

private _time = 30;;
private _action = true;
if !(isNull _group) then {
	_action = [
		format[localize "STR_GNOTF_AlreadyControlled",_group GVAR ["gang_name",""]],
		localize "STR_GNOTF_CurrentCapture",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call SunriseClient_gui_guiMessage;
	
	_time = 60;
};

if !(_action) exitWith {[localize "STR_GNOTF_CaptureCancel", "error"] call SunriseClient_gui_BottomNotification};

[_flag,"inCapture",player] call CBA_fnc_setVarNet;

if (IS_VIP) then {_time = _time call SunriseClient_system_timeDiscount};
[localize "STR_GNOTF_Capturing",_time,{(player distance _flag > 30)}] call SunriseClient_system_progressBarSimple;
if (call SunriseClient_system_isInterrupted) exitWith {[localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};
if (player distance _flag > 30) exitWith {["Вы слишком далеко отошли от флага!", "error"] call SunriseClient_gui_BottomNotification;};

[_flag,"inCapture"] call SunriseClient_system_clearGlobalVar;

[localize "STR_GNOTF_CaptureDone!", "done"] call SunriseClient_gui_BottomNotification;
[_flag,"hide_owner",grpPlayer] call CBA_fnc_setVarNet;