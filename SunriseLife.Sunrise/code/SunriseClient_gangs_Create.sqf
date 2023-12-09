/*
	
	Filename: 	SunriseClient_gangs_Create.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
private _gangName = ctrlText (CONTROL(2520,2522));
private _length = count (toArray(_gangName));
private _chrByte = toArray (_gangName);
private _allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
if (_length > 32) exitWith {[localize "STR_GNOTF_Over32","error"] call SunriseClient_gui_bottomNotification};
private _badChar = false;
{
	if !(_x in _allowed) exitWith {_badChar = true;};
} foreach _chrByte;
if (_badChar) exitWith {[localize "STR_GNOTF_IncorrectChar","error"] call SunriseClient_gui_bottomNotification};
private _gangPrice = LIFE_SETTINGS(getNumber,"life_gangPrice");
if (BANK < _gangPrice) exitWith {[format[localize "STR_GNOTF_NotEnoughMoney",[_gangPrice - BANK] call SunriseClient_system_numberText],"error"] call SunriseClient_gui_bottomNotification};

[[player,steamid,_gangName,GVAR_RNAME(player)],"insertGang","SYS",false] call SunriseClient_system_hcExec;

[localize "STR_NOTF_SendingData","info"] call SunriseClient_gui_bottomNotification;
closeDialog 0;
life_action_gangInUse = true;