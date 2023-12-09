/*
	
	Filename: 	SunriseClient_system_showPassport.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _target = param [0,objNull,[objNull]];
if ((isNull _target) OR !(alive _target)) exitWith {};

closeDialog 0;
private _info = [] call SunriseClient_system_getPassportText;
["info","","Вы показали паспорт"] call SunriseClient_message;
[_info,steamid] remoteExecCall ["SunriseClient_system_lookPassport",_target];