#include "..\..\script_macros.hpp"
/*

    Filename: 	SunriseClient_system_steamCheck.sqf
	Project: 	AmazingLife - RPG
	Author:		AmazingTeam
	E-mail:		dev@amazingrp.ru
	Web:		http://amazingrp.ru/
	
*/
_pid_array = profileNamespace getVariable['PID_ARRAY',[]];
_pid = (getPlayerUID player);

_add_Id = _pid_array pushBackUnique _pid;
if(_add_Id > -1) then
{
	profileNamespace setVariable['PID_ARRAY',_pid_array];
	saveprofileNamespace;
	if(_pid_array isEqualTo [_pid]) exitWith {};
	

	/*[[player,format["Смена Steam Аккаунта! %1;",_pid_array]],"log_any","log",true] call life_fnc_remote;
	[1,(getPlayerUID player),"0","Amazing Ban: MultiAcc / perm",(name player)] remoteExec ["Amazing_fnc_banPlayer",2];*/
	
	[["bans",[format["Смена Steam Аккаунта! %1;",_pid_array]]],"customLog"] call SunriseClient_system_hcExec;
	
	//[steamid,0,"Money Hack At Save",format["Money Hack Detect At Save CASH %1 - BANK %2",CASH,BANK]] remoteExecCall ["SunriseServer_system_rcon",RSERV];
	
	//[(getPlayerUID player),"0","Sunrise Ban: MultiAcc / perm","AdminMenuBAN",name player] remoteExecCall ["SunriseServer_database_ban",2];
	
	["ban",(getPlayerUID player),"SteamCheck Ban","Sunrise Ban: MultiAcc / perm"] remoteExecCall ["SunriseServer_system_serverCommand",RSERV];
};