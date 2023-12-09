/*
	
	Filename: 	SunriseClient_system_checkConnection.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _t_start = time;
clientOwner remoteExecCall ["SunriseServer_system_checkConnection",2];
waitUntil {uiSleep 0.05; (life_wait OR time - _t_start > 10)};
if (life_wait) exitWith {life_wait = false; true};

false