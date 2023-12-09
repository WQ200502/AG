/*

	Filename: 	SunriseClient_admin_Jail.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if !(call life_isAdmin) exitWith {closeDialog 0;};

private _unit = call compile format["%1", CONTROL_DATA(2902)];
if (isNil "_unit" OR {isNull _unit}) exitwith {closeDialog 0;};

private _time = ctrlText (CONTROL(2900,1002));
private _reason = ctrlText (CONTROL(2900,1001));
if (isNil "_time" || (_time isEqualTo "")) exitWith {["Укажите время","error"] call SunriseClient_gui_bottomNotification;};
if !([_time] call SunriseClient_system_isnumber) exitWith {["Укажите количество в цифровом формате, а не символьном","error"] call SunriseClient_gui_bottomNotification;};
_time = parseNumber(_time);
if (_time < 0) exitWith {hint "Укажите положительное значение!"};

[[],false,_time,_reason] remoteExec ["SunriseClient_system_jailMe",_unit];