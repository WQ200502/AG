/*
	
	Filename: 	SunriseClient_system_searchAction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit) exitWith {};
if (player distance _unit > 5 || (call SunriseClient_system_isInterrupted) || !alive _unit) exitWith {["error","",format[localize "STR_NOTF_CannotSearchPerson"]] call SunriseClient_message};
call SunriseClient_actions_inUse;
[player,true] remoteExecCall ["SunriseClient_system_searchClient",_unit];