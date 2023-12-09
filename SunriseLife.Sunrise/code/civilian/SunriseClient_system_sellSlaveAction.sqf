/*
	
	Filename: 	SunriseClient_system_sellSlaveAction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_owner",objNull,[objNull]],
	["_rate",0,[0]]
];
[player,"restrained"] call SunriseClient_system_clearGlobalVar;
[player,"slave",true] call CBA_fnc_setVarNet;
life_slave = true;
[getPlayerUID player,"life_slave",life_slave] remoteExecCall ["SunriseServer_database_updatePlayerIndCfg",2];

cutText ["Вы попали в рабство! Самое время добыть немного хлопка и обрести свободу.","BLACK IN",5];
player setPosATL (getMarkerPos "cotton_1");

if (!isNull _owner) then {
	[player,_rate] remoteExecCall ["SunriseClient_system_sellSlaveDone",_owner];
};

[] spawn {
	while {life_slave && LSALIVE(player)} do {
		if (player distance (getMarkerPos "cotton_1") > 35) then	{
			player setPosATL (getMarkerPos "cotton_1");
			hint "Убегать бесполезно. Солнце еще высоко....";
		};
		uiSleep 1;
	};
};