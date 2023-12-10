/*

	Filename: 	SunriseServer_system_wantedUpdateJailTime.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
params [
    ["_playeruid","",[""]],
	["_time",0,[0]]
];
if (_playeruid isEqualTo "") exitWith {};
format ["updateJailTime:%1:%2",_time,_playeruid] call SunriseServer_database_fireAndForget;