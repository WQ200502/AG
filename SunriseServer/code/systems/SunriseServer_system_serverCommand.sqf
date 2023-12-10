/*

	Filename: 	SunriseServer_system_serverCommand.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
params ["_command","_param1","_reason","_log"];
private _password = SYSTEM_PASS;
switch (_command) do {
	case "shutdown": { _password serverCommand "#shutdown" };
	//case "message": { [0,"BattleEye Client: (Global) Admin: asdasdasd"] remoteExecCall ["SunriseClient_system_broadcast",-2]; };
	case "lock": { _password serverCommand "#lock" };
	case "unlock": { _password serverCommand "#unlock" };
	case "kick": {
		if (_param1 isEqualType objNull) then{
			_param1 = getPlayerUID _param1;
		};
		if !(_param1 isEqualTo "") then{
			_password serverCommand format ["#kick %1",_param1];
			["bans",format ["|Kick| UID - %1 || LOG - %2",_param1, _log]] call SunriseServer_system_customLog;
		};
	};
	case "ban": {
		if (_param1 isEqualType objNull) then{
			_param1 = getPlayerUID _param1;
		};
		if !(_param1 isEqualTo "") then{
			_password serverCommand format ['#exec ban "%1"',_param1];
			["bans",format ["|Ban| UID - %1 || REASON - %2 || LOG - %3",_param1, _reason, _log]] call SunriseServer_system_customLog;
		};
	};
	case "ddosts": {
		if (server_ddos_ts) then {
			server_ddos_ts = false;
			publicVariable "server_ddos_ts";
			[0,"Внимание! На TS3 сервере завершились магнитные бури."] remoteExecCall ["SunriseClient_system_broadcast",-2];
		} else {
			server_ddos_ts = true;
			publicVariable "server_ddos_ts";
			[0,"Внимание! На TS3 сервере наблюдаются магнитные бури. Возможны перебои со связью."] remoteExecCall ["SunriseClient_system_broadcast",-2];
		};
	};
	case "ddosserver": {
		if (server_ddos_air) then {
			server_ddos_air = false;
			publicVariable "server_ddos_air";
			[0,"Внимание! На острове окончились магнитные бури. Воздушная техника доступна."] remoteExecCall ["SunriseClient_system_broadcast",-2];
		} else {
			server_ddos_air = true;
			publicVariable "server_ddos_air";
			[0,"Внимание! На острове наблюдаются магнитные бури. Воздушная техника временно недоступна."] remoteExecCall ["SunriseClient_system_broadcast",-2];
		};
	};
};
