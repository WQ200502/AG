/*
	
	Filename: 	SunriseClient_gangs_InfoAdd.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _mW = ctrlText (CONTROL(4200,4201)); //средние
private _lW = ctrlText (CONTROL(4200,4202)); //длинные
private _info = ctrlText (CONTROL(4200,4203)); //информация

if (EQUAL(_mW,"") OR (EQUAL(_lW,""))) exitWith {["Должны быть заполнены оба поля","error"] call SunriseClient_gui_bottomNotification};
if (!([_mW] call SunriseClient_system_isFlatnumber) OR !([_lW] call SunriseClient_system_isFlatnumber)) exitWith {["Значения должны быть цифровыми","error"] call SunriseClient_gui_bottomNotification};

grpPlayer SVAR ["gang_info",[_mW,_lW,_info],true];

[[7,grpPlayer,steamid],"updateGang"] call SunriseClient_system_hcExec;

[format["<t size='1.8' color='#ffa200'>Внимание! Были изменены частоты рации!</t><br/><br/>Средние волны: <t color='#fff000'>%1</t><br/>Длинные волны: <t color='#fff000'>%2</t><br/><br/>Информация: <t color='#fff000'>%3</t>",_mW,_lW,_info],"done"] remoteExecCall ["SunriseClient_system_hint",grpPlayer];

closeDialog 0;