/*

	Filename: 	SunriseServer_database_ban.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
   ["_unit",objNull,[objNull]],
   ["_time",-1,[0]],
   ["_reason","",[""]],
   ["_log","",[""]],
   ["_admin","Система",[""]]
];
if (isNull _unit) exitWith {diag_log format ["ERROR fn_bans_add: %1",_this];};
private _playerUID = getPlayerUID _unit;
["bans",format ["|DBBan| UID - %1 || REASON - %2 || TIME - %3 || ADMIN - %4 || LOG - %5",_playerUID, _reason, _time,_admin,_log]] call SunriseServer_system_customLog;
format ["insertBan:%1:%2:%3:%4:%5",name _unit,_playerUID,_reason,_admin,_time] call SunriseServer_database_fireAndForget;

[(format["%1 минут",_time]),_reason,_admin] remoteExec ["SunriseClient_session_banned",_unit];

