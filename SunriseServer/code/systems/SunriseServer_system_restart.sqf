/*

	Filename: 	SunriseServer_system_restart.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (serverName isEqualTo "test") exitWith {diag_log "[SERVER RESTART] -> DEV SERVER RESTART DISABLED"};
private _password = SYSTEM_PASS;

diag_log format ["[SERVER RESTART] -> Next Restart in %1 Seconds",call SunriseServer_system_getRestartTime];

_180minCheck = false;
_120minCheck = false;
_60minCheck = false;
_30minCheck = false;
_15minCheck = false;
_10minCheck = false;
_5minCheck = false;
_3minCheck = false;
_2minCheck = false;
_1minCheck = false;

checkServerTime = true;
while {checkServerTime} do
{
	_restartTime = call SunriseServer_system_getRestartTime;
	switch true do
	{	
		case ((_restartTime <= (180*60)) && !_180minCheck): {
			_180minCheck = true;
			call SunriseServer_system_hazardSpawnLoot;
			/*_Timestamp = (call compile ("extDB3" callExtension "9:LOCAL_TIME")) select 1;
			_nowTimeDay = _Timestamp select 2;
			_nowTimeHour = _Timestamp select 3;
			{
				if (
				(_nowTimeDay isEqualTo parseNumber(((_x select 5) splitString " ") select 0 splitString "-" select 0))
				AND 
				(_nowTimeHour isEqualTo parseNumber(((_x select 5) splitString " ") select 1 splitString ":" select 0))
				) exitWith {diag_log "RESOURCE CAPTURE: BATTLE LAUNCH";[_forEachIndex] spawn SunriseServer_system_initBattle};
			} forEach enabledCaptures;*/
		};
		case ((_restartTime <= (120*60)) && !_120minCheck): {
			_120minCheck = true;
			call SunriseServer_system_hazardSpawnLoot;
			[0,"Сервер будет перезагружен через 2 часа!"] remoteExecCall ["SunriseClient_system_broadcast",-2];
			[0,"Сервер будет перезагружен через 2 часа!"] remoteExecCall ["SunriseClient_system_broadcast",-2];
		};
		case ((_restartTime <= (60*60)) && !_60minCheck): {
			_60minCheck = true;
			call SunriseServer_system_hazardSpawnLoot;
			[0,"Сервер будет перезагружен через 1 час!"] remoteExecCall ["SunriseClient_system_broadcast",-2];
			[0,"Сервер будет перезагружен через 1 час!"] remoteExecCall ["SunriseClient_system_broadcast",-2];
		};
		case ((_restartTime <= (30*60)) && !_30minCheck): {
			_30minCheck = true;
			[0,"Сервер будет перезагружен через 30 минут!"] remoteExecCall ["SunriseClient_system_broadcast",-2];
			[0,"Сервер будет перезагружен через 30 минут!"] remoteExecCall ["SunriseClient_system_broadcast",-2];
		};
		case ((_restartTime <= (15*60)) && !_15minCheck): {
			_15minCheck = true;
			[0,"Сервер будет перезагружен через 15 минут! Сервер будет закрыт за 5 минут до рестарта.."] remoteExecCall ["SunriseClient_system_broadcast",-2];
			[0,"Сервер будет перезагружен через 15 минут! Сервер будет закрыт за 5 минут до рестарта.."] remoteExecCall ["SunriseClient_system_broadcast",-2];
		};
		case ((_restartTime <= (10*60)) && !_10minCheck): {
			_10minCheck = true;
			[0,"Сервер будет перезагружен через 10 минут! Сервер будет закрыт за 5 минут до рестарта.."] remoteExecCall ["SunriseClient_system_broadcast",-2];
			[0,"Сервер будет перезагружен через 10 минут! Сервер будет закрыт за 5 минут до рестарта.."] remoteExecCall ["SunriseClient_system_broadcast",-2];
		};
		case ((_restartTime <= (5*60)) && !_5minCheck): {
			_5minCheck = true;
			[0,"Сервер будет перезагружен через 5 минут! Не забудьте синхронизировать данные. Сервер будет закрыт до перезагрузки."] remoteExecCall ["SunriseClient_system_broadcast",-2];
			[0,"Сервер будет перезагружен через 5 минут! Не забудьте синхронизировать данные. Сервер будет закрыт до перезагрузки."] remoteExecCall ["SunriseClient_system_broadcast",-2];
			[format ["<t size='2.5'><t color='#f71414' align='center'>Внимание!</t></t><br/><br/><t size='1.5'align='center'>Надвигается сильная буря. Все магазины закрыты.</t>"],"warning"] remoteExecCall ["SunriseClient_system_hint",-2];
			server_restartSoon = true;
			publicVariable "server_restartSoon";
			_password serverCommand "#lock";
		};	
		case ((_restartTime <= (3*60)) && !_3minCheck): {
			_3minCheck = true;
			{format ["updateShops:%1:%2",_x select 1,_x select 0] call SunriseServer_database_fireAndForget} forEach shops_array;
			{format ["updateGas:%1:%2",_x select 0, _forEachIndex] call SunriseServer_database_fireAndForget} forEach gas_array;
		};
		case ((_restartTime <= (2*60)) && !_2minCheck): {
			_2minCheck = true;
			[0,"Сервер будет перезагружен через 2 минуты!"] remoteExecCall ["SunriseClient_system_broadcast",-2];
			[0,"Сервер будет перезагружен через 2 минуты!"] remoteExecCall ["SunriseClient_system_broadcast",-2];			
		};
		case ((_restartTime <= (1*60)) && !_1minCheck): {
			[0,"Сервер будет перезагружен через 1 минуту!"] remoteExecCall ["SunriseClient_system_broadcast",-2];
			[0,"Сервер будет перезагружен через 1 минуту!"] remoteExecCall ["SunriseClient_system_broadcast",-2];
			remoteExecCall ["SunriseClient_session_syncData",allPlayers];
			uiSleep 40;
			{_password serverCommand format ["#kick %1",getPlayerUID _x]} foreach allPlayers;
			uiSleep 5;
			checkServerTime = false;
			_password serverCommand "#shutdown";
		};
	};
	uiSleep 1;
};
diag_log "[SERVER RESTART] -> RESTART DISABLED";