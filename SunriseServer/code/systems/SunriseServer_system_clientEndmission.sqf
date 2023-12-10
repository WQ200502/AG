/*

	Filename: 	SunriseServer_system_clientEndmission.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
params [
    ["_uid","",[""]],
	["_name","",[""]]
];
["bans",format["%1 (%2) вышел из игры с помощью EndMission",_name,_uid]] call SunriseServer_system_customLog;
//[0,format ["%1 (%2) вышел из игры с помощью endMisssion. Скажите ему, что он попался хи-хи",_name,_uid]] remoteExecCall ["SunriseClient_system_broadcast",-2];
//_query = if (_side isEqualTo west) then {format ["clientDisconCop:%1",_uid]} else {format ["clientDiscon:%1",_uid]};
format ["clientEndmission:%1",_uid] call SunriseServer_database_fireAndForget;

