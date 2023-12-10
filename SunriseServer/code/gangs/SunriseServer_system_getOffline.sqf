/*

	Filename: 	SunriseServer_system_getOffline.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
if !(params [
	["_unit",objNull,[objNull]],
	["_group",grpNull,[grpNull]]
]) exitWith {["error",format ["|%1| PARAMS=%2",_fnc_scriptname,_this]] call SunriseServer_system_customLog};

private _list = switch (_group) do { 
	case life_copGroup : {"getOfflineCops" call SunriseServer_database_selectFull}; 
	case life_medGroup : {"getOfflineMeds" call SunriseServer_database_selectFull}; 
	default {format["getOffline:%1",_group getVariable ["gang_id","-1"]] call SunriseServer_database_selectFull}; 
}; 

[_list] remoteExecCall ["SunriseClient_gangs_OfflineList",_unit];