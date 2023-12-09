/*
	
	Filename: 	SunriseClient_system_robPerson.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_robber",ObjNull,[ObjNull]],
	["_who","",[""]]
];

if (isNull _robber OR (EQUAL(_who,""))) exitWith {};

if (CASH > 0 OR DCASH > 0) then {
	[CASH,DCASH] remoteExecCall ["SunriseClient_system_robReceive",_robber];		 
	
	[[getPlayerUID _robber,GVAR_RNAME(_robber),"211"],"wantedAdd"] call SunriseClient_system_hcExec;
	
	titleText[format["Вас ограбили на сумму в $%2",_who,[CASH + DCASH] call SunriseClient_system_numberText],"PLAIN"];	
	//systemChat format ["Вас ограбил игрок с ID %1. Запомните этот ID на случай нарушений правил сервера",_who];	
	
	["info","",format["Вас ограбил игрок с ID %1. Запомните этот ID на случай нарушений правил сервера",_who],true] call SunriseClient_message;
	
	[["robbery",format["%1 (%2) robbed %3 (%4) for $%5",GVAR_RNAME(_robber),getPlayerUID _robber,GVAR_RNAME(player),steamid,[CASH + DCASH] call SunriseClient_system_numberText]],"customLog"] call SunriseClient_system_hcExec;	
	
	["cash","drop",CASH,"Robbed"] call SunriseClient_system_myCash;
	["dcash","drop",DCASH,"Robbed"] call SunriseClient_system_myCash;
} else {	
	[2,"STR_NOTF_RobFail",true,[GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_system_broadcast",_robber];
};