/*
	
	Filename: 	SunriseClient_system_showPassportTo.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private["_info","_ret"];
_ret = param [0,ObjNull,[ObjNull]];

if (isNull _ret) exitWith {};

_info = [] call SunriseClient_system_getPassportText;
[_info,steamid] remoteExecCall ["SunriseClient_system_lookPassport",_ret];