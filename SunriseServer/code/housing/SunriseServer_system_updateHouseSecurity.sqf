/*

	Filename: 	SunriseServer_system_updateHouseSecurity.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
if !(params [
    ["_house",Objnull,[Objnull]],
    ["_unit",objNull,[objNull]]
]) exitWith {["error",format ["|SunriseServer_system_updateHouseSecurity| PARAMS=%1",_this]] call SunriseServer_system_customLog};

_house setVariable ["house_security",true,true];
format ["updateHouseSecurity:1:%1",_house getVariable ["house_id",-1]] call SunriseServer_database_fireAndForget;
["Вы успешно установили сигнализацию","done"] remoteExecCall ["SunriseClient_system_hint",_unit];