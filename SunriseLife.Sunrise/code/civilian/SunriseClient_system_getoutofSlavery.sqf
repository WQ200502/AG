/*
	
	Filename: 	SunriseClient_system_getoutofSlavery.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_inv_cotton == 20) then {
	[false,"cotton",20] call SunriseClient_system_handleInv;
	[player,"slave"] call SunriseClient_system_clearGlobalVar;	
	life_slave = false;
	player setPos (getMarkerPos "jail_release_civ");
	[getPlayerUID player,"life_slave",life_slave] remoteExecCall ["SunriseServer_database_updatePlayerIndCfg",2];
	["done","","Вы обрели свободу! Долой кандалы!"] call SunriseClient_message;
} else {
	["error","","Вам нужно ровно 20 единиц хлопка. Ни больше ни меньше!"] call SunriseClient_message;
};
