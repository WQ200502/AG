/*

	Filename: 	SunriseServer_system_rcon.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
params ["_uid","_time","_reason","_log"];
SYSTEM_PASS serverCommand format ['#exec ban "%1"',_uid];
["bans",format ["|Ban| UID - %1 || REASON - %2 || LOG - %3",_uid, _reason, _log]] call SunriseServer_system_customLog;
