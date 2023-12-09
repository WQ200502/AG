/*
	
	Filename: 	SunriseClient_system_medicSend.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _mode = param [0,0,[0]];
if (EQUAL((lbCurSel 39002),-1)) exitWith {hint "Никто не выбран"};
private _unit = CONTROL_DATA(39002);
_unit = call compile format["%1", _unit];
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};
if (EQUAL(_unit,player)) exitWith {};

[player,_mode] remoteExecCall ["SunriseClient_system_medicStatus",_unit];